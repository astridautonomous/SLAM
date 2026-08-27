import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Pose
from nav_msgs.msg import Odometry
from std_msgs.msg import Int32MultiArray, MultiArrayDimension
from visualization_msgs.msg import Marker, MarkerArray
import itertools
import math
import numpy as np
import xml.etree.ElementTree as ET

#### CENTERLINE'DA YAYINLIYOR

class LaneletBlockerV5(Node):
    def __init__(self):
        super().__init__('lanelet_blocker_v5')
        self.get_logger().info("Lanelet Blocker v5 başlatıldı")

        # ── Parametreler ──────────────────────────────────────────────────────
        self.declare_parameter('map_path',        '/media/astrid/SMSSD/Robotaxi-26-Map/map/map_v7.osm')
        self.declare_parameter('engel_menzili',    20.0)
        self.declare_parameter('gap_esigi',        5.0)
        self.declare_parameter('lanelet_tolerans', 0.20)  # metre, kenardan minimum uzaklık
        self.declare_parameter('centerline_nokta_sayisi', 20)  # centerline örnekleme yoğunluğu

        map_path              = self.get_parameter('map_path').value
        self.engel_menzili    = self.get_parameter('engel_menzili').value
        self.gap_esigi        = self.get_parameter('gap_esigi').value
        self.lanelet_tolerans = self.get_parameter('lanelet_tolerans').value
        self.centerline_n     = int(self.get_parameter('centerline_nokta_sayisi').value)

        # Araç konumu ve engel belleği
        self.arac_x        = 0.0
        self.arac_y        = 0.0
        self.engel_listesi = []  # [(x, y), ...]

        # Marker takibi
        self._persistent_markers = {}
        self._next_id            = 0

        # ── Lanelet2 haritası (local_x/local_y tag'lerinden, projeksiyonsuz) ───
        # lanelet_id -> {'polygon': [...], 'left_id': int, 'right_id': int, 'centerline': [(x,y),...]}
        self.lanelets = {}
        self._load_map(map_path)

        # ── Subscriber / Publisher ────────────────────────────────────────────
        self.create_subscription(Pose,     '/astrid/slam/obstacle_locations',     self.centroid_callback, 10)
        self.create_subscription(Odometry, '/astrid/odometry_local', self.odom_callback,     10)

        self.blocked_pub       = self.create_publisher(Int32MultiArray, '/astrid/slam/blocked_lanelet_ids', 10)
        self.obstacle_pose_pub = self.create_publisher(Pose,            '/astrid/slam/obstacle_locations2', 10)
        self._marker_pub       = self.create_publisher(MarkerArray,     '/clustered_marker2',                10)

    # ── Harita yükleme (local_x/local_y ile, XML parser) ────────────────────────
    def _load_map(self, map_path):
        try:
            tree = ET.parse(map_path)
            root = tree.getroot()

            # node id -> (x, y)
            node_coords = {}
            for node in root.findall('node'):
                nid = int(node.get('id'))
                lx = node.find("tag[@k='local_x']")
                ly = node.find("tag[@k='local_y']")
                if lx is not None and ly is not None:
                    node_coords[nid] = (float(lx.get('v')), float(ly.get('v')))

            # way id -> [node_id, ...]
            way_nodes = {}
            for way in root.findall('way'):
                wid = int(way.get('id'))
                nds = [int(nd.get('ref')) for nd in way.findall('nd')]
                way_nodes[wid] = nds

            # relation'lardan lanelet'leri (left/right bound) çıkar
            for rel in root.findall('relation'):
                is_lanelet = any(
                    tag.get('k') == 'type' and tag.get('v') == 'lanelet'
                    for tag in rel.findall('tag')
                )
                if not is_lanelet:
                    continue

                rel_id = int(rel.get('id'))
                left_id, right_id = None, None
                for member in rel.findall('member'):
                    if member.get('type') != 'way':
                        continue
                    role = member.get('role')
                    if role == 'left':
                        left_id = int(member.get('ref'))
                    elif role == 'right':
                        right_id = int(member.get('ref'))

                if left_id is None or right_id is None:
                    continue
                if left_id not in way_nodes or right_id not in way_nodes:
                    continue

                left_pts  = [node_coords[n] for n in way_nodes[left_id]  if n in node_coords]
                right_pts = [node_coords[n] for n in way_nodes[right_id] if n in node_coords]
                if not left_pts or not right_pts:
                    continue

                # Poligon: left bound + ters right bound
                polygon = left_pts + right_pts[::-1]

                # Centerline: sol/sağ bound'u eşit sayıda noktaya yeniden örnekleyip
                # karşılıklı noktaların orta noktalarını al
                centerline = self._build_centerline(left_pts, right_pts, self.centerline_n)

                self.lanelets[rel_id] = {
                    'polygon':    polygon,
                    'left_id':    left_id,
                    'right_id':   right_id,
                    'centerline': centerline,
                }

            self.get_logger().info(f"Harita yüklendi: {len(self.lanelets)} lanelet")
        except Exception as e:
            self.get_logger().error(f"Harita yüklenemedi: {e}")

    # ── Centerline oluşturma ─────────────────────────────────────────────────
    @staticmethod
    def _resample_polyline(pts, n):
        """pts polyline'ını n adet eşit yay-uzunluğu aralıklı noktaya yeniden örnekler."""
        if len(pts) == 1:
            return [pts[0]] * n
        cum = [0.0]
        for i in range(1, len(pts)):
            cum.append(cum[-1] + math.dist(pts[i - 1], pts[i]))
        total = cum[-1]
        if total < 1e-9:
            return [pts[0]] * n

        resampled = []
        for i in range(n):
            target = total * i / (n - 1) if n > 1 else 0.0
            # target'ın düştüğü segmenti bul
            seg_idx = 1
            while seg_idx < len(cum) and cum[seg_idx] < target:
                seg_idx += 1
            seg_idx = min(seg_idx, len(cum) - 1)
            seg_len = cum[seg_idx] - cum[seg_idx - 1]
            t = 0.0 if seg_len < 1e-9 else (target - cum[seg_idx - 1]) / seg_len
            ax, ay = pts[seg_idx - 1]
            bx, by = pts[seg_idx]
            resampled.append((ax + t * (bx - ax), ay + t * (by - ay)))
        return resampled

    def _build_centerline(self, left_pts, right_pts, n):
        n = max(n, 2)
        left_rs  = self._resample_polyline(left_pts, n)
        right_rs = self._resample_polyline(right_pts, n)
        return [((lx + rx) / 2.0, (ly + ry) / 2.0)
                for (lx, ly), (rx, ry) in zip(left_rs, right_rs)]

    # ── Odometry callback ─────────────────────────────────────────────────────
    def odom_callback(self, msg: Odometry):
        self.arac_x = msg.pose.pose.position.x
        self.arac_y = msg.pose.pose.position.y

    # ── Ana callback ──────────────────────────────────────────────────────────
    def centroid_callback(self, msg: Pose):
        if not self.lanelets:
            return

        cx = msg.position.x
        cy = msg.position.y
        # self.get_logger().info(f"Engel geldi, x: {cx}, y: {cy}")

        # Bu nokta herhangi bir lanelet içinde değilse VEYA kenara çok yakınsa hiçbir şey yapma
        current_ids = self._find_lanelets(cx, cy)
        if not current_ids:
            return

        # 12m dışındaki engelleri temizle
        self.engel_listesi = [
            e for e in self.engel_listesi
            if math.dist(e, (self.arac_x, self.arac_y)) < self.engel_menzili
        ]

        # Yeni engeli ekle
        if (cx, cy) not in self.engel_listesi:
            self.engel_listesi.append((cx, cy))

        centroids = self.engel_listesi
        blocked_ids = set()

        # ADIM 1: centroid → lanelet eşlemesi
        centroid_lanelet_map = {(cx, cy): current_ids}
        for c in centroids:
            if c == (cx, cy):
                continue
            centroid_lanelet_map[c] = self._find_lanelets(c[0], c[1])

        # ADIM 2: komşu çiftler → gap kontrolü
        for (c1, c2) in itertools.combinations(centroids, 2):
            ll_ids_1 = centroid_lanelet_map.get(c1, [])
            ll_ids_2 = centroid_lanelet_map.get(c2, [])

            if not self._herhangi_biri_komsu(ll_ids_1, ll_ids_2):
                continue

            # Komşu bulundu → gap kontrolü
            if self._gap_dar_mi(c1, c2):
                # Gap dar → her iki lanelet blokla
                for lid in ll_ids_1:
                    blocked_ids.add(lid)
                    self.get_logger().info(f"Gap dar → lanelet {lid} bloklandı (c1)")
                for lid in ll_ids_2:
                    blocked_ids.add(lid)
                    self.get_logger().info(f"Gap dar → lanelet {lid} bloklandı (c2)")
            else:
                # Gap geniş → bloklama yok
                self.get_logger().info("Gap geniş → bloklama yok")

        self._publish_blocked(list(blocked_ids))

        # ── Yayınlamadan önce: içinde bulunduğu lanelet'in centerline'ına izdüşür ──
        proj_x, proj_y, best_lid = self._project_to_best_centerline(cx, cy, current_ids)
        if proj_x is None:
            # centerline bulunamadıysa orijinal noktayı kullan
            proj_x, proj_y = cx, cy

        out_msg = Pose()
        out_msg.position.x = proj_x
        out_msg.position.y = proj_y
        out_msg.position.z = msg.position.z
        out_msg.orientation = msg.orientation

        self.obstacle_pose_pub.publish(out_msg)
        dist = float(np.hypot(out_msg.position.x - self.arac_x, out_msg.position.y - self.arac_y))
        self.get_logger().info(
                f'Obstacle @ map ({out_msg.position.x:.2f}, {out_msg.position.y:.2f}) '
                f'arac x: {self.arac_x}, arac y: {self.arac_y}, araca {dist:.2f} metre var.')

        # ── Centerline'a izdüşürülmüş konumu marker olarak yayınla ───────────
        m = Marker()
        m.header.frame_id = 'map'
        m.header.stamp     = self.get_clock().now().to_msg()  # Pose'da header yok
        m.id               = self._next_id
        m.type             = Marker.SPHERE
        m.action           = Marker.ADD
        m.pose             = out_msg
        m.scale.x = m.scale.y = m.scale.z = 0.5
        m.color.b = 1.0
        m.color.a = 0.8

        self._persistent_markers[self._next_id] = m
        self._next_id += 1

        marker_array = MarkerArray()
        marker_array.markers.extend(self._persistent_markers.values())
        self._marker_pub.publish(marker_array)

    # ── Centerline izdüşüm yardımcıları ──────────────────────────────────────
    @staticmethod
    def _project_point_to_segment(px, py, ax, ay, bx, by):
        """Noktayı (ax,ay)-(bx,by) segmentine izdüşürür; (proj_x, proj_y, dist) döner."""
        dx, dy = bx - ax, by - ay
        seg_len_sq = dx * dx + dy * dy
        if seg_len_sq < 1e-12:
            return ax, ay, math.hypot(px - ax, py - ay)
        t = ((px - ax) * dx + (py - ay) * dy) / seg_len_sq
        t = max(0.0, min(1.0, t))
        proj_x = ax + t * dx
        proj_y = ay + t * dy
        return proj_x, proj_y, math.hypot(px - proj_x, py - proj_y)

    def _nearest_point_on_centerline(self, x, y, centerline):
        """centerline polyline'ı üzerinde (x,y)'ye en yakın noktayı ve mesafeyi döner."""
        best_dist  = float('inf')
        best_point = centerline[0]
        for i in range(len(centerline) - 1):
            ax, ay = centerline[i]
            bx, by = centerline[i + 1]
            px, py, d = self._project_point_to_segment(x, y, ax, ay, bx, by)
            if d < best_dist:
                best_dist  = d
                best_point = (px, py)
        return best_point, best_dist

    def _project_to_best_centerline(self, x, y, lanelet_ids):
        """Verilen lanelet id'leri arasından centerline'ı en yakın olanı seçip izdüşürür."""
        best_dist  = float('inf')
        best_point = (None, None)
        best_lid   = None
        for lid in lanelet_ids:
            data = self.lanelets.get(lid)
            if not data or len(data['centerline']) < 2:
                continue
            point, dist = self._nearest_point_on_centerline(x, y, data['centerline'])
            if dist < best_dist:
                best_dist  = dist
                best_point = point
                best_lid   = lid
        return best_point[0], best_point[1], best_lid

    # ── Komşuluk kontrolü ─────────────────────────────────────────────────────
    def _herhangi_biri_komsu(self, ll_ids_1: list, ll_ids_2: list) -> bool:
        for id1 in ll_ids_1:
            for id2 in ll_ids_2:
                if id1 == id2:
                    continue
                if self._komsu_mu(id1, id2):
                    return True
        return False

    def _komsu_mu(self, ll_id1: int, ll_id2: int) -> bool:
        """Ortak boundary (left/right way id) paylaşıyor mu?"""
        try:
            ll1 = self.lanelets[ll_id1]
            ll2 = self.lanelets[ll_id2]
            ll1_bounds = {ll1['left_id'], ll1['right_id']}
            ll2_bounds = {ll2['left_id'], ll2['right_id']}
            return bool(ll1_bounds & ll2_bounds)
        except Exception as e:
            self.get_logger().warn(f"Komşuluk kontrolü hatası: {e}")
            return False

    # ── Gap kontrolü ─────────────────────────────────────────────────────────
    def _gap_dar_mi(self, c1, c2) -> bool:
        """Öklid mesafesi gap_esigi'nden azsa → dar (True)"""
        mesafe = math.dist(c1, c2)
        self.get_logger().info(f"Mesafe={mesafe:.2f}m")
        if mesafe < self.gap_esigi:
            return True
        return False

    # ── Lanelet sorgusu (poligon içi VE kenardan en az tolerans kadar uzak) ────
    def _find_lanelets(self, x, y) -> list:
        result = []
        for lid, data in self.lanelets.items():
            polygon = data['polygon']
            if not self._point_in_polygon(x, y, polygon):
                continue
            # Poligon içinde ama kenara çok yakınsa (sınırdaysa) reddet
            if self._distance_to_polygon(x, y, polygon) < self.lanelet_tolerans:
                continue
            result.append(lid)
        return result

    @staticmethod
    def _point_in_polygon(x, y, polygon) -> bool:
        """Standart ray-casting algoritması."""
        n = len(polygon)
        inside = False
        j = n - 1
        for i in range(n):
            xi, yi = polygon[i]
            xj, yj = polygon[j]
            if ((yi > y) != (yj > y)) and \
               (x < (xj - xi) * (y - yi) / (yj - yi + 1e-12) + xi):
                inside = not inside
            j = i
        return inside

    @staticmethod
    def _point_to_segment_distance(px, py, ax, ay, bx, by) -> float:
        """Noktanın (ax,ay)-(bx,by) doğru parçasına en kısa mesafesi."""
        dx, dy = bx - ax, by - ay
        seg_len_sq = dx * dx + dy * dy
        if seg_len_sq < 1e-12:
            return math.hypot(px - ax, py - ay)
        t = ((px - ax) * dx + (py - ay) * dy) / seg_len_sq
        t = max(0.0, min(1.0, t))
        proj_x = ax + t * dx
        proj_y = ay + t * dy
        return math.hypot(px - proj_x, py - proj_y)

    def _distance_to_polygon(self, x, y, polygon) -> float:
        """Noktanın poligonun tüm kenarlarına olan en kısa mesafesi."""
        n = len(polygon)
        min_dist = float('inf')
        j = n - 1
        for i in range(n):
            xi, yi = polygon[i]
            xj, yj = polygon[j]
            d = self._point_to_segment_distance(x, y, xj, yj, xi, yi)
            if d < min_dist:
                min_dist = d
            j = i
        return min_dist

    # ── Publisher ─────────────────────────────────────────────────────────────
    def _publish_blocked(self, blocked_ids: list):
        msg = Int32MultiArray()
        msg.layout.dim.append(
            MultiArrayDimension(
                label='lanelet_ids',
                size=len(blocked_ids),
                stride=len(blocked_ids)
            )
        )
        msg.data = blocked_ids
        self.blocked_pub.publish(msg)
        if blocked_ids:
            self.get_logger().info(f"Bloklu laneletler: {blocked_ids}")


def main(args=None):
    rclpy.init(args=args)
    node = LaneletBlockerV5()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        if rclpy.ok():
            rclpy.shutdown()


if __name__ == '__main__':
    main()
