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
        self.create_subscription(PointCloud2, '/carla/hero/lidar',   self.pointcloud_callback, 10)
        self.create_subscription(Odometry,    '/carla/hero/odometry', self.odom_callback,      10)

        # Publishers
        self.ogm_publisher   = self.create_publisher(OccupancyGrid, '/astrid/slam/local_map', 10)
        self.dynamic_pub     = self.create_publisher(Int8,          '/astrid/slam/dynamic_mode', 10)
        self.status_publisher= self.create_publisher(Int8,          '/astrid/slam/station_status', 10)

        # OGM params
        self.map_width  = 8
        self.map_height = 8
        self.resolution = 1.0
        self.offset_center_x = -3.0
        self.offset_center_y = -1.5

        # Odometry + state
        self.latest_odom = None

        # Dynamic obstacle
        self.previous_ogm      = np.zeros((self.map_height, self.map_width), dtype=np.int8)
        self.cell_timestamps   = {}
        self.stop_timeout      = 5.0
        self.state             = 'idle'
        self.region_notified   = False
        self.cleared_flag      = False  # Yeni flag: cleared mesajı sonrası mesaj engelleme

        # Parking
        self.in_parking_zone       = False
        self.current_zone          = None
        self.current_entry_handled = False
        self.zone_entry_counts     = {1:0,2:0,3:0}

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

        # Build OGM (always)
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

        # Publish OGM unconditionally
        self.publish_ogm(ogm, ox, oy)

        # Region checks
        in_crosswalk = (-19.6845 <= x <= -13.789 and 3.4669 <= y <= 9.4541)
        zone_id = self.detect_parking_zone(x,y)

        # If neither region, clear dynamic/parking state and return
        if not in_crosswalk and zone_id is None:
            self.handle_exit_zones()
            return

        # Dynamic obstacle only in crosswalk
        if in_crosswalk:
            self.process_crosswalk(ogm)

        # Parking only in parking zone
        if zone_id is not None:
            self.process_parking(ogm, zone_id)

    def detect_parking_zone(self, x, y):
        if -1.9703<=x<=6.5129 and -10.609<=y<=4.8695:
            return 3
        if 41.1619<=x<=46.9368 and -3.0345<=y<=18.2254:
            return 1
        if 15.5102<=x<=35.8413 and 29.7604<=y<=36.2667:
            return 2
        return None

    def handle_exit_zones(self):
        # reset dynamic
        if self.region_notified:
            self.state='idle'
            self.previous_ogm.fill(0)
            self.cell_timestamps.clear()
            self.region_notified=False
            self.cleared_flag=False  # Reset cleared_flag alan dışına çıkınca

        # reset parking
        if self.in_parking_zone:
            self.in_parking_zone=False
            self.current_zone=None
            self.current_entry_handled=False

    def process_crosswalk(self, ogm):
        control_time = 5  # Engel silme gecikmesi
        dynamic_cell_treshold_moving = 2 # Kalibre edilebilir veri
        dynamic_cell_treshold_stopping =3 # Kalibre edilebilir veri
        if not self.region_notified:
            self.get_logger().info("Entered crosswalk area, dynamic obstacle tracking activated.")
            self.region_notified = True
            self.empty_start = None
            self.stable_start = None
            self.cleared_flag = False  # Bölgeye girince cleared flag sıfırlansın

        # Eğer cleared_flag setliyse, artık mesaj yayınlama
        if self.cleared_flag:
            # State'yi idle olarak tut, yeni mesaj atma
            self.state = 'idle'
            self.previous_ogm = ogm.copy()
            return

        # 0'dan 100'e geçen hücreleri tespit et
        dynamic_cells = set()
        for iy in range(self.map_height):
            for ix in range(self.map_width):
                if self.previous_ogm[iy, ix] == 0 and ogm[iy, ix] == 100:
                    dynamic_cells.add((ix, iy))

        now = self.get_clock().now()
        current_time = now.nanoseconds * 1e-9
        new_state = self.state

        # Mevcut dolu hücreleri listele
        current_cells = set()
        for iy in range(self.map_height):
            for ix in range(self.map_width):
                if ogm[iy, ix] == 100:
                    current_cells.add((ix, iy))

        # Hücre zaman damgalarını güncelle
        for cell in current_cells:
            if cell not in self.cell_timestamps:
                self.cell_timestamps[cell] = current_time
        for cell in list(self.cell_timestamps):
            if cell not in current_cells:
                del self.cell_timestamps[cell]

        # FSM: Engel tespit süreci
        if self.state == 'idle' and len(current_cells) >= 1:
            self.get_logger().info("Dynamic obstacle detected")
            self.publish_dynamic_state(1)
            new_state = 'detected'
            self.stable_start = None

        elif self.state in ['detected','stopped'] and len(dynamic_cells) >= dynamic_cell_treshold_moving:
            self.get_logger().info("Dynamic obstacle moving")
            self.publish_dynamic_state(1)
            new_state = 'moving'
            self.stable_start = None

        elif self.state in ['moving', 'detected']:
            stable_cells = sum(1 for t in self.cell_timestamps.values() if current_time - t >= self.stop_timeout)
            if stable_cells >= dynamic_cell_treshold_stopping:
                if self.stable_start is None:
                    self.stable_start = current_time
                elif current_time - self.stable_start >= 1.0:
                    self.get_logger().info("Dynamic obstacle stopped")
                    self.publish_dynamic_state(1)
                    new_state = 'stopped'
                    self.stable_start = None
            else:
                self.stable_start = None

        # Engel temizleme mantığı: stopped olduktan 5 saniye sonra reset ve cleared mesajı yayınla
        if self.state == 'stopped':
            if self.empty_start is None:
                self.empty_start = current_time
            elif current_time - self.empty_start >= control_time:
                self.get_logger().info("Dynamic obstacle cleared")
                self.publish_dynamic_state(0)  # Engel tamamen durdu ve sistem sıfırlandı
                new_state = 'idle'
                self.cell_timestamps.clear()
                self.empty_start = None
                self.cleared_flag = True  # Bundan sonra mesaj atma

        else:
            self.empty_start = None

        # Durum güncelle
        self.state = new_state
        self.previous_ogm = ogm.copy()

    def process_parking(self, ogm, zone_id):
        # on entry
        if not self.in_parking_zone or self.current_zone!=zone_id:
            self.get_logger().info(f"Entered parking zone ({zone_id})")
            self.in_parking_zone=True
            self.current_zone=zone_id
            self.current_entry_handled=False
            self.zone_entry_counts[zone_id]+=1

        if self.current_entry_handled:
            return

        if self.zone_entry_counts[zone_id]>=2:
            self.get_logger().info("Re-entry ≥2 times: force 0")
            self.status_publisher.publish(Int8(data=0))
        else:
            black = np.count_nonzero(ogm==100)
            if black>=3:
                self.get_logger().info("Occupied parking zone")
                self.status_publisher.publish(Int8(data=0))
            else:
                self.get_logger().info("Available parking zone")
                self.status_publisher.publish(Int8(data=1))

        self.current_entry_handled=True

    def publish_ogm(self, ogm, ox, oy):
        msg = OccupancyGrid()
        msg.header = Header()
        msg.header.stamp = self.get_clock().now().to_msg()
        msg.header.frame_id='map'
        msg.info.resolution=self.resolution
        msg.info.width=self.map_width
        msg.info.height=self.map_height
        msg.info.origin.position.x=ox
        msg.info.origin.position.y=oy
        msg.info.origin.orientation.w=1.0
        msg.data = ogm.flatten().tolist()
        self.ogm_publisher.publish(msg)

    def publish_dynamic_state(self, code):
        msg = Int8()
        msg.data = code
        self.dynamic_pub.publish(msg)

def main(args=None):
    rclpy.init(args=args)
    node=CombinedLidarOGM()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__=='__main__':
    main()
