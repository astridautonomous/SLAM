#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from std_msgs.msg import Int8,String
from nav_msgs.msg import OccupancyGrid,Odometry
import time
import numpy as np
import math
import json
from rclpy.qos import QoSProfile, QoSDurabilityPolicy, QoSReliabilityPolicy

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
            "/clap/ros/odometry",
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
        yaw = self.current_yaw

        # Yaw'a göre OGM'de gerçek sağ tarafı bul
        if -math.pi/4 < yaw <= math.pi/4:
            # İleri bakıyor → sağ = alt satırlar (Y negatif)
            zone = ogm[-self.side_col_count:, :]
        elif math.pi/4 < yaw <= 3*math.pi/4:
            # Sola dönmüş → sağ = son sütunlar
            zone = ogm[:, -self.side_col_count:]
        elif yaw > 3*math.pi/4 or yaw <= -3*math.pi/4:
            # Geri bakıyor → sağ = üst satırlar
            zone = ogm[:self.side_col_count, :]
        else:
            # Sağa dönmüş → sağ = ilk sütunlar
            zone = ogm[:, :self.side_col_count]

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
        self.pub = self.create_publisher(Int8,'/astrid/slam/dynamic_mode',10)

        # Config parameters
        self.up_border = 1
        self.side_border = 2
        self.diff_threshold = 0
        self.control_time_treshold = 2.0
        self.compare_time = 0.5
        self.deactivate_counter = 0

        # OGM
        self.previous_ogm = None
        self.latest_ogm = None

        self.is_active = False

        self.create_timer(self.compare_time, self.compare_maps)
        self.control_time = time.monotonic()

    def traffic_sign_cb(self, msg):
        msg_list = json.loads(msg.data)
        data = msg_list[0][0]

        if not self.is_active and data == 'yayaGecidi':
            self.is_active = True
            self.get_logger().info("Dynamic zone detect devreye girdi")

    def ogm_callback(self, msg):        
        width = msg.info.width
        height = msg.info.height
        ogm = np.asarray(msg.data, dtype=np.int8).reshape((height, width))

        self.latest_ogm = ogm

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
        up_border = self.up_border
        
        inner = ogm[up_border:-up_border, side_border:-side_border]
        prev_inner = self.previous_ogm[up_border:-up_border, side_border:-side_border]

        diff_count = np.count_nonzero(inner != prev_inner)
        
        self.previous_ogm = ogm.copy()

        if diff_count > self.diff_threshold:
            self.control_time = now
        
        if now - self.control_time >= self.control_time_treshold:
            #gaz
            self.publish_control(0)
            self.deactivate_counter += 1
            if self.deactivate_counter >= 20:
                self.is_active = False
                self.deactivate_counter = 0
                self.publish_control(99)
                self.get_logger().info("Dynamic zone detect devre dışı.")
        else:
            #fren
            self.publish_control(1)
            self.deactivate_counter = 0

    def publish_control(self,control):
        msg = Int8()
        msg.data = control
        self.pub.publish(msg)

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