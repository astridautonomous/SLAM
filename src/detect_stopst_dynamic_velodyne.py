#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from rclpy.qos import QoSProfile, QoSDurabilityPolicy, QoSReliabilityPolicy

from std_msgs.msg import Int8,String
from nav_msgs.msg import OccupancyGrid,Odometry
from geometry_msgs.msg import Pose 

import time
import numpy as np
import math
import json

def calculate_distance(odom1: Odometry, odom2: Odometry):
    x_diff = odom2.pose.pose.position.x - odom1.pose.pose.position.x
    y_diff = odom2.pose.pose.position.y - odom1.pose.pose.position.y
    dist = float(np.hypot(x_diff,y_diff))

    return dist

class DetectStopsNode(Node):
    def __init__(self):
        super().__init__('detect_stops_node')
        self.get_logger().info("Park zone detect başladı")
        
        self.transient_qos_perception = QoSProfile(
            depth=5,
            durability=QoSDurabilityPolicy.VOLATILE,
            reliability=QoSReliabilityPolicy.BEST_EFFORT,
        )

        self.create_subscription(
            OccupancyGrid,
            "/astrid/slam/local_map",
            self.ogm_callback,
            10
        )
        self.create_subscription(
            Odometry,
            "/astrid/odometry_local",
            self.odom_callback,
            10
        )
        
        self.create_subscription(
            String,
            "/astrid/perception/traffic_sign",
            self.traffic_sign_cb,
            self.transient_qos_perception
        )

        self.pub = self.create_publisher(Int8, '/astrid/slam/station_status', 10)
        # 1 - bos 0 - dolu

        self.side_col_count = 2
        self.occupied_cell_limit = 2
        self.pub_control = 3
        self.pub_control_occ = 3

        self.current_yaw = 0.0

        # Perception'dan levha gelince aktif olması istenirse
        self.is_active = False

    def traffic_sign_cb(self, msg):
        msg_list = json.loads(msg.data)
        data = msg_list[0][0]
        if not self.is_active and data == 'durak':
            self.is_active = True
            self.get_logger().info("Park zone detect devreye girdi")

    def odom_callback(self, msg):
        q = msg.pose.pose.orientation
        siny = 2.0 * (q.w * q.z + q.x * q.y)
        cosy = 1.0 - 2.0 * (q.y * q.y + q.z * q.z)
        self.current_yaw = math.atan2(siny, cosy)

    def ogm_callback(self, msg):
        if not self.is_active:
            return

        width = msg.info.width
        height = msg.info.height
        ogm = np.asarray(msg.data, dtype=np.int8).reshape((height, width))

        if self.is_side_zones_empty(ogm):
            self.pub_control += 1
            if self.pub_control >= 5:
                self.publish_station_status(1)
                self.pub_control_occ = 0
        else:
            self.pub_control_occ += 1
            if self.pub_control_occ >= 5:
                self.publish_station_status(0)
                self.pub_control = 0

    def is_side_zones_empty(self, ogm):
        # yaw = self.current_yaw
        zone = ogm[-self.side_col_count:, :]

        # Yaw'a göre OGM'de gerçek sağ tarafı bul
        # if -math.pi/4 < yaw <= math.pi/4:
        #     İleri bakıyor → sağ = alt satırlar (Y negatif)
        #     zone = ogm[-self.side_col_count:, :]
        # elif math.pi/4 < yaw <= 3*math.pi/4:
        #     Sola dönmüş → sağ = son sütunlar
        #     zone = ogm[:, -self.side_col_count:]
        # elif yaw > 3*math.pi/4 or yaw <= -3*math.pi/4:
        #     Geri bakıyor → sağ = üst satırlar
        #     zone = ogm[:self.side_col_count, :]
        # else:
        #     Sağa dönmüş → sağ = ilk sütunlar
        #     zone = ogm[:, :self.side_col_count]

        occupied = np.count_nonzero(zone == 100)
        # self.get_logger().info(
        #     f"Yaw: {math.degrees(yaw):.1f}°, Gerçek sağ dolu: {occupied}"
        # )
        return occupied < self.occupied_cell_limit 

    def publish_station_status(self, station_status):
        msg = Int8()
        msg.data = station_status
        self.pub.publish(msg)

class DetectDynamicNode(Node):
    def __init__(self):
        super().__init__('detect_dynamic_node')
        self.get_logger().info("Detect dynamic node başladı")

        self.transient_qos_perception = QoSProfile(
            depth=5,
            durability=QoSDurabilityPolicy.VOLATILE,
            reliability=QoSReliabilityPolicy.BEST_EFFORT,
        )
        self.create_subscription(
            OccupancyGrid,
            "/astrid/slam/local_map",
            self.ogm_callback,
            10
        )
        self.create_subscription(
            String,
            "/astrid/perception/traffic_sign",
            self.traffic_sign_cb,
            self.transient_qos_perception
        )
        self.create_subscription(
            Odometry,
            "/astrid/odometry_local",
            self.odom_callback,
            10
        )
        self.pub = self.create_publisher(Int8,'/astrid/slam/dynamic_mode',10)
        self.ogm_publisher = self.create_publisher(OccupancyGrid, '/astrid/slam/local_map_filtered', 10)

        # Config parameters
        self.front_border = 1     
        self.back_border = 5      
        self.side_border = 1
        self.diff_threshold = 0
        self.control_time_treshold = 2.0
        self.compare_time = 0.7
        self.deactivate_counter = 0

        # OGM
        self.previous_ogm = None
        self.latest_ogm = None
        self.latest_msg = None

        # Odometry
        self.latest_odom = None
        self.sign_detection_odom = None

        self.is_active = False

        self.create_timer(self.compare_time, self.compare_maps)
        # self.create_timer(0.5, self.deactivate_node)

        self.control_time = time.monotonic()

    def traffic_sign_cb(self, msg):
        msg_list = json.loads(msg.data)
        data = msg_list[0][0]

        if not self.is_active and data == 'yaya_gecidi':
            self.is_active = True
            self.sign_detection_odom = self.latest_odom

            self.get_logger().info("Dinamik engel tespiti levha ile devrede.")

    def odom_callback(self,msg):
        self.latest_odom = msg

        if 4.3844 <= self.latest_odom.pose.pose.position.x <= 6.1792 and 21.378 <= self.latest_odom.pose.pose.position.y <= 28.4385:
            self.is_active = True
            self.get_logger().info("Dinamik engel tespiti konum ile devrede.")

    def ogm_callback(self, msg):        
        width = msg.info.width
        height = msg.info.height
        ogm = np.asarray(msg.data, dtype=np.int8).reshape((height, width))

        self.latest_ogm = ogm
        self.latest_msg = msg

    def compare_maps(self):
        now = time.monotonic()

        if not self.is_active:
            return

        if self.latest_ogm is None:
            return

        # ilk map
        if self.previous_ogm is None:
            self.previous_ogm = self.latest_ogm.copy()
            return

        ogm = self.latest_ogm
        side_border = self.side_border
        front_border = self.front_border
        back_border = self.back_border

        h, w = ogm.shape
        # x/y yer değiştirildi: front/back artık sütunlarda (x), side artık satırlarda (y)
        row_start = side_border
        row_end = h - side_border if side_border > 0 else h
        col_start = back_border
        col_end = w - front_border if front_border > 0 else w

        inner = ogm[row_start:row_end, col_start:col_end]
        prev_inner = self.previous_ogm[row_start:row_end, col_start:col_end]
        self.publish_debug_ogm(inner, row_start, col_start)

        diff_count = np.count_nonzero(inner != prev_inner)
        print(diff_count)
        self.previous_ogm = ogm.copy()

        if diff_count > self.diff_threshold:
            self.control_time = now
        
        if now - self.control_time >= self.control_time_treshold:
            #gaz
            self.publish_control(0)
            self.deactivate_counter += 1
            if self.deactivate_counter >= 200:
                self.is_active = False
                self.deactivate_counter = 0
                self.publish_control(99)
                self.get_logger().info("Dynamic zone detect devre dışı.")
        else:
            #fren
            self.publish_control(1)
            self.deactivate_counter = 0

    def deactivate_node(self):
        if calculate_distance(self.latest_msg,self.sign_detection_odom) >= 10.0:
            self.is_active = False
            msg = Int8()
            msg.data = 99
            self.pub.publish(msg)
            self.get_logger().info("Dinamik engel tespiti devre disi.")

    def publish_control(self,control):
        msg = Int8()
        msg.data = control
        self.pub.publish(msg)

    def publish_debug_ogm(self, inner, row_start, col_start):
        if self.latest_msg is None:
            return

        src = self.latest_msg
        out = OccupancyGrid()

        # Kaynak OGM velodyne frame'inde -> aynısını koru, stamp'i de kaynaktan al
        out.header.stamp = src.header.stamp
        out.header.frame_id = src.header.frame_id if src.header.frame_id else 'velodyne'

        out.info.resolution = src.info.resolution
        out.info.height, out.info.width = inner.shape

        # Crop nedeniyle origin'i kayan miktar kadar öteliyoruz
        out.info.origin = Pose()
        out.info.origin.position.x = src.info.origin.position.x + col_start * src.info.resolution
        out.info.origin.position.y = src.info.origin.position.y + row_start * src.info.resolution
        out.info.origin.position.z = src.info.origin.position.z
        out.info.origin.orientation = src.info.origin.orientation

        out.data = inner.flatten().astype(np.int8).tolist()

        self.ogm_publisher.publish(out)

def main(args=None):
    rclpy.init(args=args)
    
    detect_dynamic_node = DetectDynamicNode()
    detect_stops_node = DetectStopsNode()

    executor = rclpy.executors.MultiThreadedExecutor()
    executor.add_node(detect_dynamic_node)
    executor.add_node(detect_stops_node)

    try:
        executor.spin()
    except KeyboardInterrupt:
        pass
    finally:
        executor.shutdown()
        detect_dynamic_node.destroy_node()
        detect_stops_node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()