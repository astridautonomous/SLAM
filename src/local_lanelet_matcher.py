#!/usr/bin/env python3
import json
import lanelet2
import lanelet2.io
import lanelet2.projection
import lanelet2.traffic_rules
import lanelet2.routing
import rclpy
from rclpy.node import Node
from std_msgs.msg import Int32MultiArray, Float32MultiArray, Int32, String
from nav_msgs.msg import Odometry
from rclpy.qos import QoSProfile, QoSDurabilityPolicy, QoSReliabilityPolicy
from shapely.geometry import Point, Polygon

# Harita Yükleme
filename = "/home/sdka/Documents/lanelet2_map.osm"
latitude, longitude = 0.0, 0.0
origin = lanelet2.io.Origin(latitude, longitude)
projector = lanelet2.projection.LocalCartesianProjector(origin)

map = lanelet2.io.load(filename, projector)
traffic_rules = lanelet2.traffic_rules.create(
    lanelet2.traffic_rules.Locations.Germany,
    lanelet2.traffic_rules.Participants.Vehicle,
)
routing_graph = lanelet2.routing.RoutingGraph(map, traffic_rules)

print("Harita başarıyla yüklendi!")
print("Lanelet sayısı:", len(map.laneletLayer))


# Yardımcı Fonksiyonlar --------------------------------------------------------
def get_local_coords(point):
    x_tag = point.attributes['local_x']
    y_tag = point.attributes['local_y']
    if x_tag is None or y_tag is None:
        return None
    return float(x_tag), float(y_tag)

class LocalLaneletMatcher(Node):
    def __init__(self):
        super().__init__('local_lanelet_matcher')
        self.subscription = self.create_subscription(
            Odometry, '/clap/ros/odometry', self.odom_callback, 10
        )
        self.pub = self.create_publisher(Int32, '/astrid/slam/current_lanelet_id', 10)
        self.last_lanelet_id = None
        self._lanelet_polygons = self._build_lanelet_polygons()

    def _build_lanelet_polygons(self):
        from shapely.prepared import prep
        result = {}
        for ll in map.laneletLayer:
            left = [get_local_coords(p) for p in ll.leftBound]
            right = [get_local_coords(p) for p in reversed(ll.rightBound)]
            coords = [c for c in left + right if c is not None]
            if len(coords) < 3:
                continue
            if coords[0] != coords[-1]:
                coords.append(coords[0])
            poly = Polygon(coords)
            if poly.is_valid:
                result[ll.id] = prep(poly)
        return result

    def find_current_lanelet(self, x, y):
        pt = Point(x, y)
        for ll_id, prepared_poly in self._lanelet_polygons.items():
            if prepared_poly.covers(pt):
                return ll_id
        return None

    def odom_callback(self, msg: Odometry):
        x = msg.pose.pose.position.x
        y = msg.pose.pose.position.y
        current_id = self.find_current_lanelet(x, y)

        if current_id != self.last_lanelet_id:
            if current_id is not None:
                self.get_logger().info(f" Araç şu anda lanelet_id={current_id} içinde")
            else:
                self.get_logger().info(" Araç hiçbir lanelet içinde değil")
            self.last_lanelet_id = current_id

            msg_out = Int32()
            msg_out.data = current_id if current_id is not None else -1
            self.pub.publish(msg_out)

def main():
    rclpy.init()
    node = LocalLaneletMatcher()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
