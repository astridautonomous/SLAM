#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import PointCloud2
from nav_msgs.msg import OccupancyGrid
from std_msgs.msg import Header
import sensor_msgs_py.point_cloud2 as pc2
import numpy as np
import cupy as cp

class FixedLidarOGMCupy(Node):
    def __init__(self):
        super().__init__('fixed_lidar_ogm_cupy')
        self.get_logger().info("Fixed Lidar OGM - Lidar at Center")

        self.declare_parameter('use_voxel', False)
        voxel_use = self.get_parameter('use_voxel').get_parameter_value().bool_value
        pc2_topic = '/astrid/slam/voxel_grid_filter' if voxel_use else '/velodyne_points'

        # Subscribers (Odometry kaldırıldı)
        self.create_subscription(PointCloud2, pc2_topic, self.pointcloud_callback, 10)

        # Publishers
        self.ogm_publisher = self.create_publisher(OccupancyGrid, '/astrid/slam/local_map', 10)

        # OGM params (Dokunulmadı)
        self.map_width = 8
        self.map_height = 8
        self.resolution = 1.0

        # Lidar'ı Merkeze Sabitleyen Orijin Hesabı
        # Harita 8x8 ve resolution 1.0 ise, toplam 8 metre genişlik vardır.
        # Lidar (0,0)'da ise, sol alt köşe -4.0, -4.0 olmalıdır.
        self.ox = -(self.map_width * self.resolution) / 2.0
        self.oy = -(self.map_height * self.resolution) / 2.0

    def pointcloud_callback(self, msg):
        # 1. Process PointCloud using CuPy
        points_np = pc2.read_points_numpy(msg, field_names=("x", "y", "z"), skip_nans=True)
        if points_np.size == 0:
            return
            
        points_gpu = cp.array(points_np) 

        # 2. Filter by Z-height (Sabit araç için gürültü engelleme)
        z_vals = cp.abs(points_gpu[:, 2])
        mask = (z_vals > 0.3) & (z_vals < 2.0)
        filtered_points = points_gpu[mask]

        if filtered_points.shape[0] == 0:
            self.publish_empty_ogm()
            return

        # 3. Grid Indices (Lidar orijinde olduğu için x_odom/yaw hesabı kalktı)
        px = filtered_points[:, 0]
        py = filtered_points[:, 1]

        # Lidar (0,0) kabul edildiği için doğrudan orijin ofseti uygulanır
        ix = ((px - self.ox) / self.resolution).astype(cp.int32)
        iy = ((py - self.oy) / self.resolution).astype(cp.int32)

        # 4. Boundary Check
        valid_mask = (ix >= 0) & (ix < self.map_width) & (iy >= 0) & (iy < self.map_height)
        ix = ix[valid_mask]
        iy = iy[valid_mask]

        # 5. Fill Grid on GPU
        ogm_gpu = cp.zeros((self.map_height, self.map_width), dtype=cp.int8)
        ogm_gpu[iy, ix] = 100

        # 6. Transfer and Publish
        self.publish_ogm(cp.asnumpy(ogm_gpu), msg.header.frame_id)

    def publish_empty_ogm(self):
        ogm = np.zeros((self.map_height, self.map_width), dtype=np.int8)
        self.publish_ogm(ogm, 'map')

    def publish_ogm(self, ogm, frame_id):
        msg = OccupancyGrid()
        msg.header = Header()
        msg.header.stamp = self.get_clock().now().to_msg()
        msg.header.frame_id = frame_id 
        
        msg.info.resolution = self.resolution
        msg.info.width = self.map_width
        msg.info.height = self.map_height
        msg.info.origin.position.x = float(self.ox)
        msg.info.origin.position.y = float(self.oy)
        msg.info.origin.orientation.w = 1.0
        
        msg.data = ogm.flatten().tolist()
        self.ogm_publisher.publish(msg)

def main(args=None):
    rclpy.init(args=args)
    node = FixedLidarOGMCupy()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()