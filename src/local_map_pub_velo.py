#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import PointCloud2
from nav_msgs.msg import OccupancyGrid
from std_msgs.msg import Header
import sensor_msgs_py.point_cloud2 as pc2
import numpy as np
np.float = float

class CombinedLidarOGM(Node):
    def __init__(self):
        super().__init__('combined_lidar_ogm')
        self.get_logger().info("Kod çalışmaya başladı")

        self.create_subscription(PointCloud2, '/velodyne_points', self.pointcloud_callback, 10)
        self.ogm_publisher = self.create_publisher(OccupancyGrid, '/astrid/slam/local_map', 10)

        # OGM params
        self.map_width = 12
        self.resolution = 1.0

        self.sag_mesafe = 2.0
        self.sol_mesafe = 4.0
        self.map_height = int((self.sag_mesafe + self.sol_mesafe) / self.resolution)

        # Nokta yükseklik filtresi (velodyne frame'inde, sensöre göre)
        self.z_min = 0.3
        self.z_max = 2.0

    def pointcloud_callback(self, msg):
        half_w = (self.map_width * self.resolution) / 2.0

        ogm = np.zeros((self.map_height, self.map_width), dtype=np.int8)
        for px, py, pz in pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True):
            if not (self.z_min < abs(pz) < self.z_max):
                continue
            ix = int((px + half_w) / self.resolution)
            iy = int((py + self.sag_mesafe) / self.resolution)
            if 0 <= ix < self.map_width and 0 <= iy < self.map_height:
                ogm[iy, ix] = 100

        self.publish_ogm(ogm, msg.header.frame_id, msg.header.stamp)

    def publish_ogm(self, ogm, frame_id, stamp):
        msg = OccupancyGrid()
        msg.header = Header()
        msg.header.stamp = stamp
        msg.header.frame_id = frame_id if frame_id else 'velodyne'
        msg.info.resolution = self.resolution
        msg.info.width = self.map_width
        msg.info.height = self.map_height

        # Origin: sensörün kendi frame'inde haritanın sol-alt kösesi
        msg.info.origin.position.x = -(self.map_width * self.resolution) / 2.0
        msg.info.origin.position.y = -self.sag_mesafe
        msg.info.origin.orientation.w = 1.0

        msg.data = ogm.flatten().tolist()
        self.ogm_publisher.publish(msg)

def main(args=None):
    rclpy.init(args=args)
    node = CombinedLidarOGM()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()