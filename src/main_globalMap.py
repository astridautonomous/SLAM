#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from rcl_interfaces.msg import ParameterDescriptor, SetParametersResult
from nav_msgs.msg import Odometry, Path
from visualization_msgs.msg import Marker, MarkerArray
from geometry_msgs.msg import Point, PoseStamped, TransformStamped
from tf2_ros import StaticTransformBroadcaster
import math
from scipy.spatial.transform import Rotation as R

import xml.etree.ElementTree as ET
import os


class CombinedOSMPathNode(Node):
    def __init__(self):
        super().__init__('combined_osm_path_node')

        # OSM Marker Bileşeni
        #self.osm_path = '/home/talha/Desktop/Son_deneme/map_v3.osm'
        self.osm_path = '/media/astrid/SMSSD/Robotaxi-26-Map/map/map_v7.osm'
        # self.osm_path = '/home/hasan/Robotaxi-26-Map/sk/map_v3.osm'

        self.tf_brd = StaticTransformBroadcaster(self)
        self.publish_static_map_to_odom()

        self.marker_pub = self.create_publisher(MarkerArray, '/astrid/slam/global_map', 10)
        self.osm_marker_array = None
        self.parse_osm_file()  # OSM dosyasını başlangıçta bir kez parse et

        # Path Bileşeni
        self.path_msg = Path()
        self.path_msg.header.frame_id = 'odom'
        self.path_pub = self.create_publisher(Path, '/astrid/slam/trajectory', 10)

        # Odometry Aboneliği (her iki bileşen için ortak)
        self.odom_sub = self.create_subscription(
            Odometry,
            '/astrid/odometry_local',
            self.odometry_callback,
            10
        )

        # OSM Marker'ları periyodik olarak yayınla
        self.timer = self.create_timer(1.0, self.publish_osm_markers)

        # ── Centerline Bileşeni (runtime'da açılıp kapatılabilir) ──────────────
        self.declare_parameter(
            'centerline_goster', False,
            ParameterDescriptor(description="True/False: lanelet centerline'larının yayınlanıp yayınlanmayacağı")
        )
        self.declare_parameter('centerline_nokta_sayisi', 20)
        self.declare_parameter('centerline_cizgi_kalinligi', 0.1)
        self.declare_parameter('centerline_renk_r', 0.6)
        self.declare_parameter('centerline_renk_g', 0.3)
        self.declare_parameter('centerline_renk_b', 0.0)
        self.declare_parameter('centerline_renk_a', 0.9)

        self.centerline_goster = self.get_parameter('centerline_goster').value
        self.centerline_n      = int(self.get_parameter('centerline_nokta_sayisi').value)
        self.centerline_width  = float(self.get_parameter('centerline_cizgi_kalinligi').value)
        self.centerline_color  = (
            float(self.get_parameter('centerline_renk_r').value),
            float(self.get_parameter('centerline_renk_g').value),
            float(self.get_parameter('centerline_renk_b').value),
            float(self.get_parameter('centerline_renk_a').value),
        )

        # Centerline artık ayrı bir topic'e değil, aynı /astrid/slam/global_map
        # topic'ine (self.marker_pub) yayınlanıyor.
        self.centerlines = {}          # lanelet_id -> [(x, y), ...]
        self._centerline_markers_cache = []   # önceden inşa edilmiş ADD marker listesi
        self._load_centerlines()
        self._build_centerline_marker_cache()

        # Parametre runtime'da değiştirildiğinde (ör. `ros2 param set` ile) yakalanır
        self.add_on_set_parameters_callback(self._on_parameter_change)

        # Toggle kapalıyken açılırsa diye bekleyen bir DELETE ihtiyacı yok;
        # ilk yayın zaten publish_osm_markers() timer'ı ile birlikte gidecek.
        self.get_logger().info("OSM Marker, Path ve Centerline Publisher (tek topic: global_map) başlatıldı")

    # ── Parametre değişikliği callback'i ────────────────────────────────────
    def _on_parameter_change(self, params):
        for p in params:
            if p.name == 'centerline_goster':
                yeni_deger = bool(p.value)
                if yeni_deger != self.centerline_goster:
                    self.centerline_goster = yeni_deger
                    if self.centerline_goster:
                        self.get_logger().info("Centerline görselleştirme AÇILDI")
                        # Bir sonraki timer tick'inde global_map ile birlikte gidecek;
                        # anında görünmesi için hemen bir kez de yayınla
                        self.publish_osm_markers()
                    else:
                        self.get_logger().info("Centerline görselleştirme KAPATILDI")
                        # RViz'de asılı kalmasınlar diye önce DELETE gönder,
                        # sonrasında timer artık sadece OSM marker'larını yollar
                        self._publish_global_map(include_centerline=False, centerline_action=Marker.DELETE)
        return SetParametersResult(successful=True)

    def publish_static_map_to_odom(self):
        t = TransformStamped()
        t.header.stamp = self.get_clock().now().to_msg()
        t.header.frame_id = 'map'
        t.child_frame_id = 'odom'

        t.transform.translation.x = 0.0 #0.1246
        t.transform.translation.y = 0.0 #-0.6079
        t.transform.translation.z = 0.0
        t.transform.rotation.x = 0.0
        t.transform.rotation.y = 0.0
        t.transform.rotation.z = 0.0 #-0.083121
        t.transform.rotation.w = 1.0 #0.996541
        self.tf_brd.sendTransform(t)
        self.get_logger().info("Static Transform 'map' -> 'odom' başarıyla yayınlandı.")

    def odometry_callback(self, msg):
        pose = PoseStamped()
        pose.header = msg.header
        pose.pose = msg.pose.pose
        self.path_msg.poses.append(pose)
        self.path_msg.header.stamp = self.get_clock().now().to_msg()
        self.path_pub.publish(self.path_msg)

    def parse_osm_file(self):
        if not os.path.exists(self.osm_path):
            self.get_logger().error(f"OSM dosyası bulunamadı: {self.osm_path}")
            return

        try:
            tree = ET.parse(self.osm_path)
        except Exception as e:
            self.get_logger().error(f"OSM dosyası okunamadı: {e}")
            return

        root = tree.getroot()

        # ---- Node koordinatlarını topla ----
        nodes = {}
        for node in root.findall('node'):
            node_id = node.attrib['id']
            local_x, local_y = None, None
            for tag in node.findall('tag'):
                if tag.attrib['k'] == 'local_x':
                    local_x = float(tag.attrib['v'])
                elif tag.attrib['k'] == 'local_y':
                    local_y = float(tag.attrib['v'])
            if local_x is not None and local_y is not None:
                nodes[node_id] = (local_x, local_y)

        if not nodes:
            self.get_logger().warn("OSM dosyasında koordinat bulunamadı!")
            return

        # ---- Way'leri id'sine göre indexle (hem yol hem polygon için gerekli) ----
        ways_by_id = {w.attrib['id']: w for w in root.findall('way')}

        # ================= YOLLAR (mevcut mantık) =================
        way_ids_to_include = set()
        allowed_relation_types = {'road', 'station1', 'station2', 'station3',
                                  'park1', 'park2', 'park3', 'park4', 'park5', 'park6', 'park7', 'park8'}

        for relation in root.findall('relation'):
            relation_type = None
            for tag in relation.findall('tag'):
                if tag.attrib['k'] == 'subtype':
                    relation_type = tag.attrib['v']
                elif tag.attrib['k'] == 'type' and tag.attrib['v'] in allowed_relation_types:
                    relation_type = tag.attrib['v']
            if relation_type in allowed_relation_types:
                for member in relation.findall('member'):
                    if member.attrib['type'] == 'way':
                        way_ids_to_include.add(member.attrib['ref'])

        marker_array = MarkerArray()
        marker_id = 0
        way_count = 0

        for way_id in way_ids_to_include:
            way = ways_by_id.get(way_id)
            if way is None:
                continue

            marker = Marker()
            marker.header.frame_id = "map"
            marker.header.stamp = self.get_clock().now().to_msg()
            marker.ns = "osm_local"
            marker.id = marker_id
            marker_id += 1
            marker.type = Marker.LINE_STRIP
            marker.action = Marker.ADD
            marker.scale.x = 0.2
            marker.color.a = 1.0
            marker.color.r = 0.5
            marker.color.g = 0.5
            marker.color.b = 0.5

            for nd in way.findall('nd'):
                ref = nd.attrib['ref']
                if ref in nodes:
                    x, y = nodes[ref]
                    marker.points.append(Point(x=x, y=y, z=0.0))

            if len(marker.points) >= 2:
                marker_array.markers.append(marker)
                way_count += 1

        # ================= POLYGONLAR =================
        # Vector Map Builder / Lanelet2 çıktısında polygon iki şekilde gelebilir:
        #   1) Tek başına kapalı bir "way" (area=yes veya type=polygon etiketli)
        #   2) Bir "relation" (type=multipolygon), outer/inner rolündeki way üyeleriyle
        # Kendi haritandaki gerçek etiketlere göre bu iki seti güncellemen gerekebilir.
        polygon_way_tag_values = {'polygon', 'yes'}          # way üzerindeki area/type tag değeri
        polygon_relation_types = {'multipolygon', 'polygon'} # relation üzerindeki type/subtype değeri

        polygon_id_counter = 0

        def add_polygon_marker(coord_list, source_id):
            nonlocal marker_id, polygon_id_counter
            if len(coord_list) < 3:
                return

            # Kapalı olsun diye ilk noktayı sona ekle (sınır çizgisi için)
            closed_pts = coord_list + [coord_list[0]]

            # --- Sadece sınır çizgisi (yollarla aynı renk/kalınlık) ---
            border = Marker()
            border.header.frame_id = "map"
            border.header.stamp = self.get_clock().now().to_msg()
            border.ns = "osm_polygons_border"
            border.id = marker_id
            marker_id += 1
            border.type = Marker.LINE_STRIP
            border.action = Marker.ADD
            border.scale.x = 0.2
            border.color.a = 1.0
            border.color.r = 0.5
            border.color.g = 0.5
            border.color.b = 0.5
            for x, y in closed_pts:
                border.points.append(Point(x=x, y=y, z=0.0))
            marker_array.markers.append(border)

            polygon_id_counter += 1

        def coords_from_way(way):
            pts = []
            for nd in way.findall('nd'):
                ref = nd.attrib['ref']
                if ref in nodes:
                    pts.append(nodes[ref])
            return pts

        # 1) Tek way olarak tanımlı polygon'lar
        for way in root.findall('way'):
            is_polygon_way = False
            for tag in way.findall('tag'):
                if tag.attrib['k'] in ('area', 'type', 'subtype') and tag.attrib['v'] in polygon_way_tag_values:
                    is_polygon_way = True
                    break
            if not is_polygon_way:
                continue
            pts = coords_from_way(way)
            add_polygon_marker(pts, way.attrib['id'])

        # 2) Relation (multipolygon) olarak tanımlı polygon'lar
        for relation in root.findall('relation'):
            rel_type = None
            for tag in relation.findall('tag'):
                if tag.attrib['k'] in ('type', 'subtype') and tag.attrib['v'] in polygon_relation_types:
                    rel_type = tag.attrib['v']
            if rel_type is None:
                continue

            outer_pts = []
            for member in relation.findall('member'):
                if member.attrib['type'] == 'way' and member.attrib.get('role', 'outer') == 'outer':
                    way = ways_by_id.get(member.attrib['ref'])
                    if way is not None:
                        outer_pts.extend(coords_from_way(way))

            add_polygon_marker(outer_pts, relation.attrib['id'])

        self.osm_marker_array = marker_array
        self.get_logger().info(
            f"{way_count} adet yol, {polygon_id_counter} adet polygon OSM'den yüklendi"
        )

    def publish_osm_markers(self):
        """Timer tarafından periyodik çağrılır: OSM marker'ları + (açıksa) centerline'ları
        aynı /astrid/slam/global_map mesajında birleştirip yayınlar."""
        self._publish_global_map(include_centerline=self.centerline_goster, centerline_action=Marker.ADD)

    def _publish_global_map(self, include_centerline: bool, centerline_action: int):
        if self.osm_marker_array is None:
            return

        stamp = self.get_clock().now().to_msg()
        combined = MarkerArray()

        for marker in self.osm_marker_array.markers:
            marker.header.stamp = stamp
        combined.markers.extend(self.osm_marker_array.markers)

        if include_centerline or centerline_action == Marker.DELETE:
            combined.markers.extend(
                self._get_centerline_markers(stamp, action=centerline_action)
            )

        self.marker_pub.publish(combined)

    # ══════════════════════════ Centerline Bileşeni ══════════════════════════
    def _load_centerlines(self):
        """OSM'den lanelet (left/right bound) relation'larını okuyup centerline'ları hesaplar."""
        if not os.path.exists(self.osm_path):
            return
        try:
            tree = ET.parse(self.osm_path)
        except Exception as e:
            self.get_logger().error(f"Centerline için harita okunamadı: {e}")
            return

        root = tree.getroot()

        node_coords = {}
        for node in root.findall('node'):
            nid = int(node.attrib['id'])
            lx = node.find("tag[@k='local_x']")
            ly = node.find("tag[@k='local_y']")
            if lx is not None and ly is not None:
                node_coords[nid] = (float(lx.get('v')), float(ly.get('v')))

        way_nodes = {}
        for way in root.findall('way'):
            wid = int(way.attrib['id'])
            way_nodes[wid] = [int(nd.attrib['ref']) for nd in way.findall('nd')]

        for rel in root.findall('relation'):
            is_lanelet = any(
                tag.get('k') == 'type' and tag.get('v') == 'lanelet'
                for tag in rel.findall('tag')
            )
            if not is_lanelet:
                continue

            rel_id = int(rel.attrib['id'])
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

            self.centerlines[rel_id] = self._build_centerline(left_pts, right_pts, self.centerline_n)

        self.get_logger().info(f"Centerline hesaplandı: {len(self.centerlines)} lanelet")

    @staticmethod
    def _resample_polyline(pts, n):
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

    def _build_centerline_marker_cache(self):
        """Centerline nokta listelerini bir kez marker geometrisine çevirip saklar
        (her tick'te points listesini yeniden kurmamak için)."""
        r, g, b, a = self.centerline_color
        self._centerline_markers_cache = []
        for lid, centerline in self.centerlines.items():
            if len(centerline) < 2:
                continue
            pts = [Point(x=x, y=y, z=0.0) for (x, y) in centerline]
            self._centerline_markers_cache.append((lid, pts, (r, g, b, a)))

    def _get_centerline_markers(self, stamp, action: int):
        """global_map mesajına eklenecek centerline marker listesini üretir.
        action=Marker.ADD  -> çizgileri çiz
        action=Marker.DELETE -> RViz'de daha önce çizilmiş olanları temizle (points boş kalabilir)"""
        markers = []
        for lid, pts, (r, g, b, a) in self._centerline_markers_cache:
            m = Marker()
            m.header.frame_id = 'map'
            m.header.stamp     = stamp
            m.ns               = 'lanelet_centerlines'
            m.id                = lid
            m.action            = action
            if action == Marker.ADD:
                m.type    = Marker.LINE_STRIP
                m.scale.x = self.centerline_width
                m.color.r, m.color.g, m.color.b, m.color.a = r, g, b, a
                m.pose.orientation.w = 1.0
                m.points  = pts
            markers.append(m)
        return markers


def main(args=None):
    rclpy.init(args=args)
    node = CombinedOSMPathNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()
