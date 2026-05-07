import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Pose
from nav_msgs.msg import Odometry
from std_msgs.msg import Int32MultiArray, MultiArrayDimension
import itertools
import math
import time
import lanelet2
from lanelet2.io import load
import lanelet2.geometry as ll2_geom
 
 
class LaneletBlockerV5(Node):
    def __init__(self):
        super().__init__('lanelet_blocker_v5')
        self.get_logger().info("Lanelet Blocker v5 başlatıldı")
 
        # ── Parametreler ──────────────────────────────────────────────────────
        self.declare_parameter('map_path',      '/home/astrid/test-27.04/carla_test.osm')
        self.declare_parameter('engel_menzili',  20.0)
        self.declare_parameter('gap_esigi',      5.0)
 
        map_path           = self.get_parameter('map_path').value
        self.engel_menzili = self.get_parameter('engel_menzili').value
        self.gap_esigi     = self.get_parameter('gap_esigi').value
        self.offset_x      = 0.0
        self.offset_y      = 0.0
 
        # Araç konumu ve engel belleği
        self.arac_x        = 0.0
        self.arac_y        = 0.0
        self.engel_listesi = []  # [(x, y), ...]
 
        # ── Lanelet2 haritası ─────────────────────────────────────────────────
        self.lanelet_map = None
        self._load_map(map_path)
        self._compute_offset(map_path)
 
        # ── Subscriber / Publisher ────────────────────────────────────────────
        self.create_subscription(Pose,     '/astrid/slam/obstacle_locations',     self.centroid_callback, 10)
        self.create_subscription(Odometry, '/clap/ros/odometry', self.odom_callback,     10)

        self.blocked_pub = self.create_publisher(Int32MultiArray, '/astrid/slam/blocked_lanelet_ids', 10)
        self.obstacle_pose_pub = self.create_publisher(Pose,'/astrid/slam/obstacle_locations2', 10)

    # ── Harita yükleme ────────────────────────────────────────────────────────
    def _load_map(self, map_path):
        try:
            from lanelet2.projection import LocalCartesianProjector
            projector = LocalCartesianProjector(
                lanelet2.io.Origin(39.74412668834, 25.83327057014)
            )
            self.lanelet_map = load(map_path, projector)
            count = len(list(self.lanelet_map.laneletLayer))
            self.get_logger().info(f"Harita yüklendi: {count} lanelet")
        except Exception as e:
            self.get_logger().error(f"Harita yüklenemedi: {e}")
 
    # ── Offset otomatik hesaplama ─────────────────────────────────────────────
    def _compute_offset(self, map_path: str):
        """
        .osm dosyasındaki local_x/local_y ile LocalCartesianProjector
        çıktısı arasındaki farkı tüm node'lar üzerinden ortalamayla hesaplar.
        """
        try:
            import xml.etree.ElementTree as ET
            from lanelet2.projection import LocalCartesianProjector
 
            tree = ET.parse(map_path)
            root = tree.getroot()
            proj = LocalCartesianProjector(
                lanelet2.io.Origin(39.74412668834, 25.83327057014)
            )
            ox_list, oy_list = [], []
            for node in root.findall('node'):
                lat = float(node.get('lat'))
                lon = float(node.get('lon'))
                lx  = node.find("tag[@k='local_x']")
                ly  = node.find("tag[@k='local_y']")
                if lx is not None and ly is not None:
                    p = proj.forward(lanelet2.core.GPSPoint(lat, lon, 0))
                    ox_list.append(float(lx.get('v')) - p.x)
                    oy_list.append(float(ly.get('v')) - p.y)
 
            self.offset_x = sum(ox_list) / len(ox_list)
            self.offset_y = sum(oy_list) / len(oy_list)
            self.get_logger().info(
                f"Offset hesaplandı: x={self.offset_x:.4f}  y={self.offset_y:.4f}"
            )
        except Exception as e:
            self.get_logger().error(f"Offset hesaplanamadı: {e}")
 
    # ── Odometry callback ─────────────────────────────────────────────────────
    def odom_callback(self, msg: Odometry):
        self.arac_x = msg.pose.pose.position.x - self.offset_x
        self.arac_y = msg.pose.pose.position.y - self.offset_y
 
    # ── Ana callback ──────────────────────────────────────────────────────────
    def centroid_callback(self, msg: Pose):
        if self.lanelet_map is None:
            return
 
        cx = msg.position.x - self.offset_x
        cy = msg.position.y - self.offset_y
 
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
        centroid_lanelet_map = {}
        for c in centroids:
            ids = self._find_lanelets(c[0], c[1])
            centroid_lanelet_map[c] = ids
 
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
                self.get_logger().info(f"Gap geniş → bloklama yok")
 
 
        self._publish_blocked(list(blocked_ids))
        time.sleep(3.0)
        self.obstacle_pose_pub.publish(msg)
 
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
        """Ortak boundary paylaşıyor mu?"""
        try:
            ll1 = self.lanelet_map.laneletLayer[ll_id1]
            ll2 = self.lanelet_map.laneletLayer[ll_id2]
            ll1_bounds = {ll1.leftBound.id, ll1.rightBound.id}
            ll2_bounds = {ll2.leftBound.id, ll2.rightBound.id}
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
 
    # ── Lanelet sorgusu ───────────────────────────────────────────────────────
    def _find_lanelets(self, x, y) -> list:
        point = lanelet2.core.BasicPoint2d(x, y)
        return [
            ll.id
            for ll in self.lanelet_map.laneletLayer
            if ll2_geom.inside(ll, point)
        ]
 
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
