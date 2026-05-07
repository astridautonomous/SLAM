import rclpy
import rclpy.duration
from rclpy.node import Node
from sensor_msgs.msg import PointCloud2
from visualization_msgs.msg import Marker, MarkerArray
from geometry_msgs.msg import Pose
from tf2_ros.buffer import Buffer
from tf2_ros.transform_listener import TransformListener
import tf2_geometry_msgs
import sensor_msgs_py.point_cloud2 as pc2
import numpy as np
import cupy as cp


# ── Constants ─────────────────────────────────────────────────────────────────

EGO_X_FRONT =  2.5
EGO_X_REAR  = -1.5
EGO_Y_MIN   = -1.2
EGO_Y_MAX   =  1.2
ARROW_MARKER_ID = 999_999

# ── GPU DBSCAN kernel ─────────────────────────────────────────────────────────
# Each thread handles one point and finds all neighbours within eps.
# Union-Find (label propagation) is then done on CPU using the adjacency
# information, which is cheap because the adjacency array is small.

_NEIGHBOUR_KERNEL = cp.RawKernel(r'''
extern "C" __global__
void find_neighbours(
    const float* __restrict__ xy,   // (N, 2) row-major
    int*         __restrict__ adj,  // (N, MAX_K) neighbour indices, -1 = empty
    int*         __restrict__ cnt,  // (N,)       actual neighbour count
    const int    N,
    const int    MAX_K,
    const float  eps2               // eps squared
) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i >= N) return;

    float xi = xy[i * 2];
    float yi = xy[i * 2 + 1];
    int   k  = 0;

    for (int j = 0; j < N && k < MAX_K; ++j) {
        float dx = xi - xy[j * 2];
        float dy = yi - xy[j * 2 + 1];
        if (dx*dx + dy*dy <= eps2) {
            adj[i * MAX_K + k] = j;
            ++k;
        }
    }
    cnt[i] = k;
}
''', 'find_neighbours')


def _dbscan_gpu(xy: cp.ndarray, eps: float, min_samples: int,
                max_k: int = 256) -> np.ndarray:
    """
    Pure CuPy DBSCAN (no RAPIDS).

    The neighbour search runs in a CUDA kernel; the label-propagation BFS
    runs on CPU on the compact adjacency list (negligible cost).

    Returns a NumPy int32 label array; -1 = noise.
    """
    N = xy.shape[0]
    if N == 0:
        return np.empty(0, dtype=np.int32)

    xy_c  = cp.ascontiguousarray(xy, dtype=cp.float32)
    adj   = cp.full((N, max_k), -1, dtype=cp.int32)
    cnt   = cp.zeros(N, dtype=cp.int32)

    threads = 256
    blocks  = (N + threads - 1) // threads
    _NEIGHBOUR_KERNEL(
        (blocks,), (threads,),
        (xy_c, adj, cnt, np.int32(N), np.int32(max_k), np.float32(eps * eps))
    )

    # Transfer compact adjacency to CPU
    adj_cpu = cp.asnumpy(adj)   # (N, max_k)
    cnt_cpu = cp.asnumpy(cnt)   # (N,)

    # BFS label propagation on CPU
    labels    = np.full(N, -1, dtype=np.int32)
    cluster   = 0

    for i in range(N):
        if labels[i] != -1:
            continue
        nb_i = cnt_cpu[i]
        if nb_i < min_samples:
            continue                         # noise (for now)

        # Start new cluster
        labels[i] = cluster
        queue = list(adj_cpu[i, :nb_i])

        while queue:
            j = int(queue.pop())
            if labels[j] == -1:
                labels[j] = cluster          # previously noise → border
            if labels[j] != cluster:
                continue                     # already assigned to another cluster
            nb_j = cnt_cpu[j]
            if nb_j >= min_samples:          # core point — expand
                for nb in adj_cpu[j, :nb_j]:
                    nb = int(nb)
                    if labels[nb] == -1:
                        labels[nb] = cluster
                        queue.append(nb)

        cluster += 1

    return labels


# ── Node ──────────────────────────────────────────────────────────────────────

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

        self.declare_parameter('min_z',         -1.5)
        self.declare_parameter('max_z',          0.5)
        self.declare_parameter('range_x_front', 50.0)
        self.declare_parameter('range_x_rear',   0.0)
        self.declare_parameter('range_y',        7.0)
        self.declare_parameter('memory_threshold', 1.6)
        self.declare_parameter('memory_max_size',  500)
        self.declare_parameter('dbscan_eps',  0.8)
        self.declare_parameter('dbscan_min', 12)

        self._tf_ready: bool = False
        self._known_xy: cp.ndarray = cp.empty((0, 2), dtype=cp.float64)
        self._persistent_markers: dict[int, Marker] = {}
        self._next_id: int = 0

        self.create_subscription(PointCloud2, '/carla/hero/lidar', self._cloud_cb, 1)
        self._marker_pub = self.create_publisher(MarkerArray, '/clustered_marker',   10)
        self._pose_pub   = self.create_publisher(Pose,        '/astrid/slam/obstacle_locations', 10)

        self.get_logger().info('Obstacle cluster node started (CuPy kernel DBSCAN).')

    # ── pipeline ──────────────────────────────────────────────────────────────

    def _read(self, msg: PointCloud2) -> cp.ndarray:
        raw = pc2.read_points(msg, field_names=('x', 'y', 'z'), skip_nans=True)
        xyz = np.column_stack([raw['x'], raw['y'], raw['z']]).astype(np.float32)
        return cp.asarray(xyz)

    def _filter(self, pts: cp.ndarray, p: dict) -> cp.ndarray:
        ego = (
            (pts[:, 0] <= EGO_X_FRONT) &
            (pts[:, 0] >= EGO_X_REAR)  &
            (pts[:, 1] >= EGO_Y_MIN)   &
            (pts[:, 1] <= EGO_Y_MAX)
        )
        box = (
            (pts[:, 0] <= p['range_x_front'])  &
            (pts[:, 0] >= -p['range_x_rear'])  &
            (pts[:, 1] >= -p['range_y'])        &
            (pts[:, 1] <= p['range_y'])         &
            (pts[:, 2] >= p['min_z'])           &
            (pts[:, 2] <= p['max_z'])
        )
        return pts[box & ~ego]

    def _is_known(self, xy: cp.ndarray, thr: float) -> bool:
        if not len(self._known_xy):
            return False
        d = self._known_xy - xy
        return bool(cp.any(d[:, 0] ** 2 + d[:, 1] ** 2 < thr ** 2).item())

    # ── callback ──────────────────────────────────────────────────────────────

    def _cloud_cb(self, msg: PointCloud2) -> None:
        p = {k: self.get_parameter(k).value for k in self.PARAMS}

        pts = self._read(msg)
        if pts.size == 0:
            return

        pts = self._filter(pts, p)
        if pts.size == 0:
            return

        try:
            tf = self.tf_buffer.lookup_transform(
                'map', msg.header.frame_id, rclpy.time.Time(),
                timeout=rclpy.duration.Duration(seconds=0.0))
        except Exception as ex:
            self.get_logger().debug(f'TF not ready yet: {ex}')
            return

        if not self._tf_ready:
            self._tf_ready = True
            self.get_logger().info('TF map frame found — detection active.')

        # Neighbour search on GPU; label propagation returns NumPy array
        labels        = _dbscan_gpu(pts[:, :2], p['dbscan_eps'], p['dbscan_min'])
        unique_labels = set(labels.tolist()) - {-1}
        thr           = p['memory_threshold']
        max_size      = p['memory_max_size']

        # Pull pts to CPU once for per-cluster slicing (avoids repeated transfers)
        pts_cpu = cp.asnumpy(pts)

        marker_array = MarkerArray()
        marker_array.markers.append(
            _make_arrow(msg.header.stamp,
                        tf2_geometry_msgs.do_transform_pose(_pose(), tf)))

        for k in unique_labels:
            cluster_pts = pts_cpu[labels == k]
            centroid    = cluster_pts.mean(axis=0)

            map_pose = tf2_geometry_msgs.do_transform_pose(
                _pose(float(centroid[0]), float(centroid[1]), float(centroid[2])), tf)
            mx, my = map_pose.position.x, map_pose.position.y

            if self._is_known(cp.array([mx, my], dtype=cp.float64), thr):
                continue

            self._known_xy = cp.vstack([self._known_xy, cp.array([[mx, my]])])
            if self._known_xy.shape[0] > max_size:
                self._known_xy = self._known_xy[-(max_size // 2):]
                self.get_logger().warn('Memory cap reached — evicting oldest entries.')

            mins   = cluster_pts[:, :2].min(axis=0)
            maxs   = cluster_pts[:, :2].max(axis=0)
            radius = float(np.clip(np.linalg.norm(maxs - mins), 1.0, 3.5))
            if radius == 1.0:
                continue
            self.get_logger().info(f'radius {radius:.2f} m')

            self._pose_pub.publish(map_pose)
            m = Marker()
            m.header.frame_id          = 'map'
            m.header.stamp             = msg.header.stamp
            m.id                       = self._next_id
            m.type                     = Marker.SPHERE
            m.action                   = Marker.ADD
            m.pose                     = map_pose
            m.scale.x = m.scale.y = m.scale.z = radius
            m.color.g = 1.0;  m.color.a = 0.8

            self._persistent_markers[self._next_id] = m
            self._next_id += 1

            self.get_logger().info(
                f'Obstacle @ ({mx:.2f}, {my:.2f}) | total: {self._known_xy.shape[0]}')

        marker_array.markers.extend(self._persistent_markers.values())
        self._marker_pub.publish(marker_array)


# ── helpers ───────────────────────────────────────────────────────────────────

def _pose(x: float = 0.0, y: float = 0.0, z: float = 0.0) -> Pose:
    p = Pose()
    p.position.x = x; p.position.y = y; p.position.z = z
    p.orientation.w = 1.0
    return p


def _make_arrow(stamp, pose: Pose) -> Marker:
    m = Marker()
    m.header.frame_id            = 'map'
    m.header.stamp               = stamp
    m.id                         = ARROW_MARKER_ID
    m.type                       = Marker.ARROW
    m.action                     = Marker.ADD
    m.pose                       = pose
    m.scale.x, m.scale.y, m.scale.z = 2.0, 0.2, 0.2
    m.color.r = 1.0;  m.color.a = 1.0
    return m


# ── entry point ───────────────────────────────────────────────────────────────

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