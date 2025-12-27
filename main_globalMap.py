#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from nav_msgs.msg import Odometry, Path
from visualization_msgs.msg import Marker, MarkerArray
from geometry_msgs.msg import Point, PoseStamped
import xml.etree.ElementTree as ET
import os

class CombinedOSMPathNode(Node):
    def __init__(self):
        super().__init__('combined_osm_path_node')
        
        # OSM Marker Bileşeni
        self.osm_path = '/home/emirhan/Documents/simulation_fulltrackv2.osm'   # Kendi osm inle değiştir
        self.marker_pub = self.create_publisher(MarkerArray, '/astrid/osm_map', 10)
        self.osm_marker_array = None
        self.parse_osm_file()  # OSM dosyasını başlangıçta bir kez parse et
        
        # Path Bileşeni
        self.path_msg = Path()
        self.path_msg.header.frame_id = 'map'
        self.path_pub = self.create_publisher(Path, '/astrid/slam/trajectory', 10)
        
        # Odometry Aboneliği (her iki bileşen için ortak)
        self.odom_sub = self.create_subscription(
            Odometry,
            '/clap/ros/odometry',
            self.odometry_callback,
            10
        )
        
        # OSM Marker'ları periyodik olarak yayınla
        self.timer = self.create_timer(1.0, self.publish_osm_markers)
        
        self.get_logger().info("OSM Marker ve Path Publisher başlatıldı")

    def odometry_callback(self, msg):
        # Path Güncelleme
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
        way_ids_to_include = set()
        allowed_relation_types = {'road', 'station1', 'station2', 'station3',
                                  'park1', 'park2', 'park3', 'park4', 'park5', 'park6', 'park7', 'park8'} # Bu nesneleri OSM dosyasındakine göre düzenle

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

        marker_array = MarkerArray()
        marker_id = 0
        way_count = 0

        for way in root.findall('way'):
            if way.attrib['id'] not in way_ids_to_include:
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

        self.osm_marker_array = marker_array
        self.get_logger().info(f"{way_count} adet yol OSM'den yüklendi")

    def publish_osm_markers(self):
        if self.osm_marker_array is None:
            return

        # Zaman damgasını güncelle
        for marker in self.osm_marker_array.markers:
            marker.header.stamp = self.get_clock().now().to_msg()
        
        self.marker_pub.publish(self.osm_marker_array)

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
