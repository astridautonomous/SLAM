import rclpy
from rclpy.node import Node
from rclpy.qos import QoSProfile, QoSDurabilityPolicy, QoSReliabilityPolicy

from std_msgs.msg import String, Int8
from nav_msgs.msg import Odometry
from sensor_msgs.msg import PointCloud2, PointField
import sensor_msgs_py.point_cloud2 as pc2
from visualization_msgs.msg import Marker, MarkerArray
from geometry_msgs.msg import Pose

from tf2_ros.buffer import Buffer
from tf2_ros.transform_listener import TransformListener

import numpy as np
from sklearn.cluster import DBSCAN
import json

def ndarray_to_pointcloud2(points: np.ndarray, frame_id: str, stamp) -> PointCloud2:
    """(N, 3) float32 array → sensor_msgs/PointCloud2"""
    pts = points.astype(np.float32)
    msg = PointCloud2()
    msg.header.frame_id = frame_id
    msg.header.stamp    = stamp
    msg.height          = 1
    msg.width           = pts.shape[0]
    msg.fields          = [
        PointField(name='x', offset=0,  datatype=PointField.FLOAT32, count=1),
        PointField(name='y', offset=4,  datatype=PointField.FLOAT32, count=1),
        PointField(name='z', offset=8,  datatype=PointField.FLOAT32, count=1),
    ]
    msg.is_bigendian = False
    msg.point_step   = 12
    msg.row_step     = 12 * pts.shape[0]
    msg.data         = pts.tobytes()
    msg.is_dense     = True
    return msg    

class ObstacleClusterNode(Node):

    PARAMS = (
        'min_z', 'max_z', 'range_x_front', 'range_x_rear', 'range_y',
        'memory_threshold', 'memory_max_size',
        'dbscan_eps', 'dbscan_min',
    )

    def __init__(self):
        super().__init__('obstacle_cluster_node')
        self.tf_buffer   = Buffer()
        self.tf_listener = TransformListener(self.tf_buffer, self)

        #Bounding box
        self.declare_parameter('min_z',         -1.0)
        self.declare_parameter('max_z',          0.0)
        self.declare_parameter('range_x_front',  12.0) #20.0
        self.declare_parameter('range_x_rear',   0.0)
        self.declare_parameter('range_y',        1.2)

        #Memory
        self.declare_parameter('memory_threshold', 1.6)
        self.declare_parameter('memory_max_size',  500)

        #DBSCAN
        self.declare_parameter('dbscan_eps',  0.5)
        self.declare_parameter('dbscan_min',  10)

        self._tf_ready: bool = False
        self._known_xy: np.ndarray = np.empty((0, 2), dtype=np.float64)
        self._persistent_markers: dict[int, Marker] = {}
        self._next_id: int = 0

        self.transient_qos_perception = QoSProfile(
            depth=5,
            durability=QoSDurabilityPolicy.VOLATILE,
            reliability=QoSReliabilityPolicy.BEST_EFFORT,
        )


        self.create_subscription(PointCloud2, '/velodyne_points', self._cloud_cb, 1)
        self.create_subscription(Odometry, '/astrid/odometry_local', self.odom_cb, 10)
        self.create_subscription(String, '/astrid/perception/traffic_sign', self.traffic_sign_cb, self.transient_qos_perception)
        self.create_subscription(Int8, '/astrid/slam/dynamic_mode', self.dynamic_mode_cb, 10)

        self._marker_pub   = self.create_publisher(MarkerArray,  '/clustered_marker',                 10)
        self._pose_pub     = self.create_publisher(Pose,         '/astrid/slam/obstacle_locations',   10)
        self._filtered_pub = self.create_publisher(PointCloud2,  '/obstacle_cluster/filtered_points', 10)

        self.current_odom = None

        self.is_active = True

        self.get_logger().info('Obstacle cluster node started (Map Frame Mode, CPU DBSCAN).')

    def _read(self, msg: PointCloud2) -> np.ndarray:
        raw = pc2.read_points(msg, field_names=('x', 'y', 'z'), skip_nans=True)
        return np.column_stack([raw['x'], raw['y'], raw['z']]).astype(np.float32)

    def _filter(self, pts: np.ndarray, p: dict) -> np.ndarray:
        box = (
            (pts[:, 0] <= p['range_x_front'])  &
            (pts[:, 0] >= -p['range_x_rear'])  &
            (pts[:, 1] >= -p['range_y'])        &
            (pts[:, 1] <= p['range_y'])         &
            (pts[:, 2] >= p['min_z'])           &
            (pts[:, 2] <= p['max_z'])
        )
        return pts[box]

    def _cluster(self, pts: np.ndarray, p: dict) -> np.ndarray:
        return DBSCAN(
            eps=p['dbscan_eps'],
            min_samples=p['dbscan_min']
        ).fit(pts[:, :2]).labels_.astype(np.int32)

    def _is_known(self, xy: np.ndarray, thr: float) -> bool:
        if not len(self._known_xy):
            return False
        d = self._known_xy - xy
        return bool(np.any(d[:, 0] ** 2 + d[:, 1] ** 2 < thr ** 2))

    def _cloud_cb(self, msg: PointCloud2) -> None:
        if not self.is_active:
            return

        p = {k: self.get_parameter(k).value for k in self.PARAMS}

        pts = self._read(msg)
        if not pts.size:
            return

        pts = self._filter(pts, p)
        transformed_cloud = ndarray_to_pointcloud2(pts, 'velodyne', msg.header.stamp)
        self._filtered_pub.publish(transformed_cloud)
        if not pts.size:
            return

        # --- TF yerine odometri kullan ---
        if self.current_odom is None:
            self.get_logger().warn('Odometry henüz gelmedi, obstacle publish edilmiyor.')
            return

        if not self._tf_ready:
            self._tf_ready = True
            self.get_logger().info('Odometry map frame kaynağı aktif — NumPy transformation.')

        odom_pose = self.current_odom.pose.pose
        t = odom_pose.position
        q = odom_pose.orientation

        x, y, z, w = q.x, q.y, q.z, q.w
        R = np.array([
            [1 - 2*(y**2 + z**2), 2*(x*y - z*w),       2*(x*z + y*w)],
            [2*(x*y + z*w),       1 - 2*(x**2 + z**2), 2*(y*z - x*w)],
            [2*(x*z - y*w),       2*(y*z + x*w),       1 - 2*(x**2 + y**2)]
        ])
        T = np.array([t.x, t.y, t.z])

        labels        = self._cluster(pts, p)
        unique_labels = set(labels.tolist()) - {-1}
        thr           = p['memory_threshold']
        max_size      = p['memory_max_size']

        marker_array = MarkerArray()

        vehicle_x = t.x
        vehicle_y = t.y

        for k in unique_labels:
            cluster_pts = pts[labels == k]
            centroid    = cluster_pts.mean(axis=0)

            centroid_map = R @ centroid + T
            mx, my = float(centroid_map[0]), float(centroid_map[1])

            map_pose = Pose()
            map_pose.position.x = mx
            map_pose.position.y = my
            map_pose.position.z = float(centroid_map[2])
            map_pose.orientation = odom_pose.orientation 
            
            if self._is_known(np.array([mx, my]), thr):
                continue

            self._known_xy = np.vstack([self._known_xy, [[mx, my]]])
            if self._known_xy.shape[0] > max_size:
                self._known_xy = self._known_xy[-(max_size // 2):]
                self.get_logger().warn('Memory cap reached — evicting oldest entries.')

            if map_pose.position.x < 1000:
                self._pose_pub.publish(map_pose)

                m = Marker()
                m.header.frame_id          = 'map'
                m.header.stamp             = msg.header.stamp
                m.id                       = self._next_id
                m.type                     = Marker.SPHERE
                m.action                   = Marker.ADD
                m.pose                     = map_pose
                m.scale.x = m.scale.y = m.scale.z = 0.5
                m.color.g = 1.0
                m.color.a = 0.8

                self._persistent_markers[self._next_id] = m
                self._next_id += 1
                dist = float(np.hypot(mx - vehicle_x, my - vehicle_y))
                self.get_logger().info(
                    f'Obstacle @ map ({mx:.2f}, {my:.2f}), arac konumu: x={vehicle_x}, y={vehicle_y}, araca {dist:.2f} metre var.')

        marker_array.markers.extend(self._persistent_markers.values())
        self._marker_pub.publish(marker_array)

    def odom_cb(self, msg):
        self.current_odom = msg

    def traffic_sign_cb(self, msg):
        msg_list = json.loads(msg.data)
        data = msg_list[0][0]

        if self.is_active and data == 'yayaGecidi':
            self.is_active = False

            self.get_logger().info("Statik engel tespiti devre disi.")

    def dynamic_mode_cb(self, msg:Int8):
        if not self.is_active and msg.data == 99:
            self.is_active = True

            self.get_logger().info("Statik engel tespiti devrede.")


def main(args=None):
    rclpy.init(args=args)
    node = ObstacleClusterNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()