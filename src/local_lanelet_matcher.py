import lanelet2
import lanelet2.io
import lanelet2.projection
import lanelet2.traffic_rules
import lanelet2.routing
import rclpy
from rclpy.node import Node
from std_msgs.msg import Int32
from nav_msgs.msg import Odometry
from shapely.geometry import Point, Polygon
from shapely.prepared import prep
 
# ─── Harita Yükleme ───────────────────────────────────────────────────────────
filename = "/home/astrid/test-27.04/carla_test.osm"
origin = lanelet2.io.Origin(0.0, 0.0)
projector = lanelet2.projection.LocalCartesianProjector(origin)
 
map = lanelet2.io.load(filename, projector)
traffic_rules = lanelet2.traffic_rules.create(
    lanelet2.traffic_rules.Locations.Germany,
    lanelet2.traffic_rules.Participants.Vehicle,
)
routing_graph = lanelet2.routing.RoutingGraph(map, traffic_rules)
 
print("Harita başarıyla yüklendi!")
print("Lanelet sayısı:", len(map.laneletLayer))
 
 
class LocalLaneletMatcher(Node):
    def __init__(self):
        super().__init__('local_lanelet_matcher')
 
        self.subscription = self.create_subscription(
            Odometry, '/clap/ros/odometry', self.odom_callback, 10
        )
        self.pub = self.create_publisher(Int32, '/astrid/slam/current_lanelet_id', 10)
 
        self.last_lanelet_id = None
        self._lanelet_polygons = self._build_lanelet_polygons()
        self.get_logger().info(
            f"{len(self._lanelet_polygons)} lanelet için polygon hazırlandı")
 
    def _get_local_coords(self, point):
        """OSM local_x/local_y tag'lerini okur (CARLA frame)."""
        if 'local_x' not in point.attributes or 'local_y' not in point.attributes:
            return None
        try:
            return float(point.attributes['local_x']), float(point.attributes['local_y'])
        except Exception:
            return None
 
    def _build_lanelet_polygons(self):
        """
        Polygon koordinatları local_x/local_y tag'lerinden (CARLA frame) oluşturulur.
        Böylece odom ham koordinatıyla doğrudan karşılaştırılabilir.
        """
        result = {}
        skipped = 0
        for ll in map.laneletLayer:
            left  = [self._get_local_coords(p) for p in ll.leftBound]
            right = [self._get_local_coords(p) for p in reversed(list(ll.rightBound))]
            coords = [c for c in left + right if c is not None]
            if len(coords) < 3:
                skipped += 1
                continue
            if coords[0] != coords[-1]:
                coords.append(coords[0])
            try:
                poly = Polygon(coords)
                if poly.is_valid and not poly.is_empty:
                    result[ll.id] = prep(poly)
                else:
                    skipped += 1
            except Exception:
                skipped += 1
        if skipped:
            self.get_logger().warn(
                f"{skipped} lanelet için polygon oluşturulamadı (local_x/local_y eksik)")
        return result
 
    def find_current_lanelet(self, x, y):
        pt = Point(x, y)
        for ll_id, prepared_poly in self._lanelet_polygons.items():
            if prepared_poly.covers(pt):
                return ll_id
        return None
 
    def odom_callback(self, msg: Odometry):
        # Ham CARLA koordinatı kullan — local_x/local_y zaten CARLA frame'inde
        x = msg.pose.pose.position.x
        y = msg.pose.pose.position.y
 
        current_id = self.find_current_lanelet(x, y)
 
        # Sadece lanelet değiştiğinde logla ve yayınla
        if current_id != self.last_lanelet_id:
            if current_id is not None:
                self.get_logger().info(
                    f"Araç lanelet={current_id} içinde (x={x:.2f}, y={y:.2f})")
            else:
                self.get_logger().info(
                    f"Araç hiçbir lanelete ait değil (x={x:.2f}, y={y:.2f})")
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
