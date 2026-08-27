#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import PointCloud2
from nav_msgs.msg import OccupancyGrid, Odometry
from std_msgs.msg import Header, Int8
import sensor_msgs_py.point_cloud2 as pc2
import numpy as np
np.float = float
import math

class CombinedLidarOGM(Node):
    def __init__(self):
        super().__init__('combined_lidar_ogm')
        self.get_logger().info("Kod çalışmaya başladı")

        # Subscribers
        self.create_subscription(PointCloud2, '/velodyne_points',   self.pointcloud_callback, 10)
        # self.create_subscription(PointCloud2, '/',   self.pointcloud_callback, 10)
        self.create_subscription(Odometry,    '/astrid/odometry_local', self.odom_callback,10)

        # Publishers
        self.ogm_publisher = self.create_publisher(OccupancyGrid, '/astrid/slam/local_map', 10)

        # OGM params
        self.map_width = 12
        self.resolution = 1.0

        self.sag_mesafe = 2.0    
        self.sol_mesafe = 4.0   
        self.map_height = int((self.sag_mesafe + self.sol_mesafe) / self.resolution)
        
        # Odometry
        self.latest_odom = None

    def odom_callback(self, msg):
        self.latest_odom = msg

    def pointcloud_callback(self, msg):
        if self.latest_odom is None:
            return

        x = self.latest_odom.pose.pose.position.x
        y = self.latest_odom.pose.pose.position.y
        q = self.latest_odom.pose.pose.orientation
        t3 = 2.0*(q.w*q.z + q.x*q.y)
        t4 = 1.0 - 2.0*(q.y*q.y + q.z*q.z)
        yaw = math.atan2(t3, t4)
        cos_yaw = math.cos(yaw)
        sin_yaw = math.sin(yaw)

        half_h = (self.map_height * self.resolution) / 2.0
        half_w = (self.map_width * self.resolution) / 2.0

        R = np.array([[cos_yaw, -sin_yaw], # R -> rotasyon matrisi, arac dondugunde haritanın da donmesi icin
                    [sin_yaw,  cos_yaw]])
        local_origin = np.array([-half_w, -self.sag_mesafe]) # OGM'nin origin'i haritadaki en kücuk x ve y
        gorigin = R @ local_origin + np.array([x, y]) # @ -> matris carpimi operatoru
        ox, oy = gorigin[0], gorigin[1]

        ogm = np.zeros((self.map_height, self.map_width), dtype=np.int8)
        for px, py, pz in pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True):
            if not (0.3 < abs(pz) < 2.0):
                continue
            ix = int((px + half_w) / self.resolution)
            iy = int((py + self.sag_mesafe) / self.resolution)
            if 0 <= ix < self.map_width and 0 <= iy < self.map_height:
                ogm[iy, ix] = 100
        self.publish_ogm(ogm, ox, oy, yaw)

    def publish_ogm(self, ogm, ox, oy, yaw):
        msg = OccupancyGrid()
        msg.header = Header()
        msg.header.stamp = self.get_clock().now().to_msg()
        msg.header.frame_id = 'map'
        msg.info.resolution = self.resolution
        msg.info.width = self.map_width
        msg.info.height = self.map_height
        msg.info.origin.position.x = ox
        msg.info.origin.position.y = oy

        # Yaw -> quaternion (sadece z ekseni etrafında rotasyon)
        msg.info.origin.orientation.z = math.sin(yaw / 2.0)
        msg.info.origin.orientation.w = math.cos(yaw / 2.0)

        msg.data = ogm.flatten().tolist()
        self.ogm_publisher.publish(msg)

def main(args=None):
    rclpy.init(args=args)
    node=CombinedLidarOGM()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__=='__main__':
    main()
