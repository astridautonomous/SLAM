#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import PointCloud2
from nav_msgs.msg import OccupancyGrid, Odometry
from std_msgs.msg import Header, Int8, String
import sensor_msgs_py.point_cloud2 as pc2
import numpy as np
np.float = float
import math
import json

class CombinedLidarOGM(Node):
    def __init__(self):
        super().__init__('combined_lidar_ogm')
        self.get_logger().info("Kod çalışmaya başladı")

        # Subscribers
        self.create_subscription(PointCloud2, '/velodyne_points',   self.pointcloud_callback, 10)
        self.create_subscription(Odometry,    '/clap/ros/odometry', self.odom_callback,      10)
        self.create_subscription(String,      '/astrid/perception/traffic_sign', self.traffic_sign_callback, 10)

        # Publishers
        self.ogm_publisher   = self.create_publisher(OccupancyGrid, '/astrid/slam/local_map', 10)
        self.dynamic_pub     = self.create_publisher(Int8,          '/astrid/slam/dynamic_mode', 10)
        self.status_publisher= self.create_publisher(Int8,          '/astrid/slam/station_status', 10)

        # OGM params
        self.map_width  = 8
        self.map_height = 8
        self.resolution = 1.0
        self.offset_center_x = 0.32
        self.offset_center_y = 0.95

        # Odometry + state
        self.latest_odom = None

        # Dynamic obstacle
        self.previous_ogm      = np.zeros((self.map_height, self.map_width), dtype=np.int8)
        self.cell_timestamps   = {}
        self.stop_timeout      = 5.0
        self.state             = 'idle'
        self.region_notified   = False
        self.cleared_flag      = False

        # Parking
        self.in_parking_zone       = False
        self.current_zone          = None
        self.current_entry_handled = False
        self.zone_entry_counts     = {1:0,2:0,3:0}
        
        # Trafik işareti durumu
        self.traffic_sign_detected = False  # Yaya geçidi işareti algılandı mı?

   def traffic_sign_callback(self, msg):
    """Trafik işareti mesajlarını işler (sadece 'name' alanı ile kontrol)"""
    try:
        signs = json.loads(msg.data)

        if isinstance(signs, list) and signs:
            for sign in signs:
                # sign dict ise name alanını al, string ise direkt al
                if isinstance(sign, dict):
                    sign_name = sign.get("name", "").lower()
                elif isinstance(sign, str):
                    sign_name = sign.lower()
                else:
                    continue  # başka tipse atla

                # Karşılaştırma
                if sign_name == "yaya_gecidi":
                    self.traffic_sign_detected = True
                    self.get_logger().info("Yaya geçidi trafik işareti algılandı")
                    break  # bir tane bulunca çık
        else:
            self.get_logger().warn("Trafik işareti listesi boş veya geçersiz formatta.")

    except json.JSONDecodeError:
        self.get_logger().error("Geçersiz JSON formatı alındı")
    except Exception as e:
        self.get_logger().error(f"Trafik işareti parse hatası: {str(e)}")



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

        # Compute OGM origin
        half_w = (self.map_width * self.resolution)/2
        half_h = (self.map_height * self.resolution)/2
        off = np.array([self.offset_center_x, self.offset_center_y])
        R = np.array([[cos_yaw,-sin_yaw],[sin_yaw,cos_yaw]])
        goff = R @ off
        ox = x - half_w - goff[0]
        oy = y - half_h - goff[1]

        # Build OGM
        ogm = np.zeros((self.map_height, self.map_width), dtype=np.int8)
        for px,py,pz in pc2.read_points(msg, field_names=("x","y","z"), skip_nans=True):
            if not (0.3 < abs(pz) < 2.0):
                continue
            xg = x + (px*cos_yaw - py*sin_yaw)
            yg = y + (px*sin_yaw + py*cos_yaw)
            ix = int((xg - ox)/self.resolution)
            iy = int((yg - oy)/self.resolution)	
            if 0<=ix<self.map_width and 0<=iy<self.map_height:
                ogm[iy,ix] = 100

        self.publish_ogm(ogm, ox, oy)

        in_crosswalk = ( -26.8261 <= x <= -19.9399 and -40.5174 <= y <= -33.3384)
        zone_id = self.detect_parking_zone(x,y)

        # ÇİFT KONTROL: Fiziksel bölge VE trafik işareti
        if not in_crosswalk and zone_id is None:	
            self.handle_exit_zones()
            return

        # Hem fiziksel bölgedeyiz hem de trafik işareti görüldü
        if in_crosswalk or self.traffic_sign_detected:
            self.process_crosswalk(ogm)
        elif zone_id is not None:
            self.process_parking(ogm, zone_id)

    def detect_parking_zone(self, x, y):
        if -19.426<=x<=-6.225 and -23.3805<=y<=-12.4065:            # Durak koordinatları bu şekilde kullanacağın zaman değiştir
            return 1
        if -45.2734<=x<=-30.3478 and -60.999<=y<=-52.8818:
            return 2
        return None

    def handle_exit_zones(self):
        if self.region_notified:
            self.state='idle'
            self.previous_ogm.fill(0)
            self.cell_timestamps.clear()
            self.region_notified=False
            self.cleared_flag=False
            
        if self.in_parking_zone:
            self.in_parking_zone=False
            self.current_zone=None
            self.current_entry_handled=False

    def process_crosswalk(self, ogm):
        control_time = 5
        dynamic_cell_treshold_moving = 2
        dynamic_cell_treshold_stopping =3
        
        if not self.region_notified:
            self.get_logger().info("Yaya geçidi bölgesine girildi veya trafik işareti tespit edildi, dinamik engel takibi aktif")
            self.region_notified = True
            self.empty_start = None
            self.stable_start = None
            self.cleared_flag = False

        if self.cleared_flag:
            self.state = 'idle'
            self.previous_ogm = ogm.copy()
            return

        dynamic_cells = set()
        for iy in range(self.map_height):
            for ix in range(self.map_width):
                if self.previous_ogm[iy, ix] == 0 and ogm[iy, ix] == 100:
                    dynamic_cells.add((ix, iy))

        now = self.get_clock().now()
        current_time = now.nanoseconds * 1e-9
        new_state = self.state

        current_cells = set()
        for iy in range(self.map_height):
            for ix in range(self.map_width):
                if ogm[iy, ix] == 100:
                    current_cells.add((ix, iy))

        for cell in current_cells:
            if cell not in self.cell_timestamps:
                self.cell_timestamps[cell] = current_time
        for cell in list(self.cell_timestamps):
            if cell not in current_cells:
                del self.cell_timestamps[cell]

        if self.state == 'idle' and len(current_cells) >= 1:
            self.get_logger().info("Dinamik engel tespit edildi")
            self.publish_dynamic_state(0)
            new_state = 'detected'
            self.stable_start = None

        elif self.state in ['detected','stopped'] and len(dynamic_cells) >= dynamic_cell_treshold_moving:
            self.get_logger().info("Dinamik engel hareket ediyor")
            self.publish_dynamic_state(0)
            new_state = 'moving'
            self.stable_start = None

        elif self.state in ['moving', 'detected']:
            stable_cells = sum(1 for t in self.cell_timestamps.values() if current_time - t >= self.stop_timeout)
            if stable_cells >= dynamic_cell_treshold_stopping:
                if self.stable_start is None:
                    self.stable_start = current_time
                elif current_time - self.stable_start >= 1.0:
                    self.get_logger().info("Dinamik engel durdu")
                    self.publish_dynamic_state(0)
                    new_state = 'stopped'
                    self.stable_start = None
            else:
                self.stable_start = None

        if self.state == 'stopped':
            if self.empty_start is None:
                self.empty_start = current_time
            elif current_time - self.empty_start >= control_time:
                self.get_logger().info("Dinamik engel temizlendi")
                self.publish_dynamic_state(1)
                new_state = 'idle'
                self.cell_timestamps.clear()
                self.empty_start = None
                self.cleared_flag = True
        else:
            self.empty_start = None

        self.state = new_state
        self.previous_ogm = ogm.copy()

    def process_parking(self, ogm, zone_id):
        if not self.in_parking_zone or self.current_zone!=zone_id:
            self.get_logger().info(f"Park bölgesine girildi ({zone_id})")
            self.in_parking_zone=True
            self.current_zone=zone_id
            self.current_entry_handled=False
            self.zone_entry_counts[zone_id]+=1

        if self.current_entry_handled:
            return

        if self.zone_entry_counts[zone_id]>=2:
            self.get_logger().info("Çift giriş tespiti: zorla 0")
            self.status_publisher.publish(Int8(data=0))
        else:
            black = np.count_nonzero(ogm==100)
            if black>=4:
                self.get_logger().info("Dolu park bölgesi")
                self.status_publisher.publish(Int8(data=0))
            else:
                self.get_logger().info("Boş park bölgesi")
                self.status_publisher.publish(Int8(data=1))

        self.current_entry_handled=True

    def publish_ogm(self, ogm, ox, oy):
        """
        Publish OccupancyGrid with a fixed rotation around its center by -121.5 degrees.
        """
        msg = OccupancyGrid()
        msg.header = Header()
        msg.header.stamp = self.get_clock().now().to_msg()
        msg.header.frame_id = 'map'

        msg.info.resolution = self.resolution
        msg.info.width = self.map_width
        msg.info.height = self.map_height

        half_w = (self.map_width * self.resolution) / 2.0
        half_h = (self.map_height * self.resolution) / 2.0
        center_x = ox + half_w
        center_y = oy + half_h

        yaw_fixed = math.radians(238.1)  # -121.5 degree                # Global harita döndürülmüşse burası kullanılacak onun dışı gerek yok 0 yaz
        cos_f = math.cos(yaw_fixed)
        sin_f = math.sin(yaw_fixed)

        dx = half_w * cos_f - half_h * sin_f
        dy = half_w * sin_f + half_h * cos_f

        msg.info.origin.position.x = center_x - dx
        msg.info.origin.position.y = center_y - dy
        msg.info.origin.position.z = 0.0
        msg.info.origin.orientation.x = 0.0
        msg.info.origin.orientation.y = 0.0
        msg.info.origin.orientation.z = math.sin(yaw_fixed / 2.0)
        msg.info.origin.orientation.w = math.cos(yaw_fixed / 2.0)

        msg.data = ogm.flatten().tolist()
        self.ogm_publisher.publish(msg)

    def publish_dynamic_state(self, code):
        msg = Int8()
        msg.data = code
        self.dynamic_pub.publish(msg)

def main(args=None):
    rclpy.init(args=args)
    node = CombinedLidarOGM()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
