#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from nav_msgs.msg import Odometry
import numpy as np
from scipy.spatial.transform import Rotation as R
from geometry_msgs.msg import TransformStamped
from tf2_ros import TransformBroadcaster
import math

class LocalOdometryTransformer(Node):
    def __init__(self):
        super().__init__('local_odometry_transformer')
        
        self.tf_broadcaster = TransformBroadcaster(self)
        
        self.subscription = self.create_subscription(
            Odometry,
            '/clap/ros/odometry',
            self.odom_callback,
            10
        )
        
        self.publisher = self.create_publisher(
            Odometry,
            '/astrid/odometry_local',
            10
        )
        self.anten_offset = np.array([0.0, 0.45, 0.03])

        raw_quat = [
             0.0034706535908910884,
             0.010309274633277805,
             -0.4512485388361879,
            -0.8923386994860065
        ]
        # Orijinal quaternion'u oluştur
        orig_rot = R.from_quat(raw_quat)
        
        # Euler açılarına çevir (xyz sırası ile)
        euler_angles = orig_rot.as_euler('xyz', degrees=True)
        
        # Yaw (Z ekseni) değerine 1.834 derece ekle
        euler_angles[2] += -1.834-9.536
        
        # Tekrar quaternion'a çevir ve origin_rotation olarak kaydet
        self.origin_rotation = R.from_euler('xyz', euler_angles, degrees=True)        
        # Anten offsetini hesaba katarak orijin pozisyonunu güncelleme
        raw_antenna_origin = np.array([711688.0025738292, 4518510.056894256, 122.89930956874349])

        origin_offset_global = self.origin_rotation.apply(self.anten_offset)
        self.origin_position = raw_antenna_origin - origin_offset_global

        self.get_logger().info('Odometri Node Başlatıldı.')

    def odom_callback(self, msg: Odometry):
        # 1. Anlık pozisyon ve quaternion eklendi
        current_position = np.array([
            msg.pose.pose.position.x,
            msg.pose.pose.position.y,
            msg.pose.pose.position.z
        ])
        
        current_quat = R.from_quat([
            msg.pose.pose.orientation.x,
            msg.pose.pose.orientation.y,
            msg.pose.pose.orientation.z,
            msg.pose.pose.orientation.w
        ])

        # Anten -> araç merkezi dönüşümü
        offset_global = current_quat.apply(self.anten_offset)
        vehicle_center_position = current_position - offset_global

        # 2. Pozisyon sıfırlama
        local_position_raw = vehicle_center_position - self.origin_position
        
        # 3. Harita koordinat sistemine hizalama
        local_position_aligned = self.origin_rotation.inv().apply(local_position_raw)
        
        # 4. Yönelim: haritaya göre rölatif + yaw offset
        qt = R.from_quat([
            msg.pose.pose.orientation.x,
            msg.pose.pose.orientation.y,
            msg.pose.pose.orientation.z,
            msg.pose.pose.orientation.w
        ])
        local_qt = self.origin_rotation.inv() * qt
        updated_quat_array = local_qt.as_quat()

        euler = qt.as_euler('xyz', degrees=True)

        # 2.HARİTA
        # euler[2] += (180 - 83.18209917856753)

        # İLK HARİTA
        print("mesaj:", euler[2])

        euler[2] += (-53.657496820142+9.536)
        # euler[2] = (euler[2] + 180) % 360 - 180
        print(euler[2])
        import math

        x_offset = 0.8
        y_offset = 0.9
        yaw_deg = 0.02
        yaw_rad = math.radians(yaw_deg)
        delta_x = x_offset * math.cos(yaw_rad) - y_offset * math.sin(yaw_rad)
        delta_y = x_offset * math.sin(yaw_rad) + y_offset * math.cos(yaw_rad)
        
        # Array formatında yeni quaternion değerlerini tek seferde hesaplıyoruz
        updated_quat_array = R.from_euler('xyz', euler, degrees=True).as_quat()
        
        # 5. Odometry mesajı
        local_msg = msg
        local_msg.header.stamp = msg.header.stamp
        local_msg.header.frame_id = 'odom'
        local_msg.child_frame_id = 'base_link'
        
        local_msg.pose.pose.position.x = -local_position_aligned[0] + delta_x
        local_msg.pose.pose.position.y = -local_position_aligned[1] - delta_y
        local_msg.pose.pose.position.z = 0.0 #local_position_aligned[2]
        
        # Doğrudan dizi (array) üzerinden değerleri mesaja atıyoruz
        local_msg.pose.pose.orientation.x = updated_quat_array[0]
        local_msg.pose.pose.orientation.y = updated_quat_array[1]
        local_msg.pose.pose.orientation.z = updated_quat_array[2]
        local_msg.pose.pose.orientation.w = updated_quat_array[3]
        # local_msg.pose.pose.orientation = msg.pose.pose.orientation
        self.publisher.publish(local_msg)

        # 6. TF yayını
        t = TransformStamped()
        t.header.stamp = msg.header.stamp
        t.header.frame_id = 'odom'
        t.child_frame_id = 'base_link'
        
        t.transform.translation.x = -local_position_aligned[0] + delta_x
        t.transform.translation.y = -local_position_aligned[1] - delta_y
        t.transform.translation.z = 0.0#local_position_aligned[2]
        
        # t.transform.rotation.x = msg.pose.pose.orientation.x
        # t.transform.rotation.y = msg.pose.pose.orientation.y
        # t.transform.rotation.z = msg.pose.pose.orientation.z
        # t.transform.rotation.w = msg.pose.pose.orientation.w
        t.transform.rotation.x = updated_quat_array[0]
        t.transform.rotation.y = updated_quat_array[1]
        t.transform.rotation.z = updated_quat_array[2]
        t.transform.rotation.w = updated_quat_array[3]
        
        self.tf_broadcaster.sendTransform(t)


def main(args=None):
    rclpy.init(args=args)
    node = LocalOdometryTransformer()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info('Node kapatıldı.')
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
