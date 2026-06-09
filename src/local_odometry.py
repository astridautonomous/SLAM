#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from nav_msgs.msg import Odometry
import numpy as np
from scipy.spatial.transform import Rotation as R
from geometry_msgs.msg import TransformStamped # TF mesaj tipi eklendi
from tf2_ros import TransformBroadcaster # Dinamik TF yayıncısı eklendi

class LocalOdometryTransformer(Node):
    def __init__(self):
        super().__init__('local_odometry_transformer')
        
        # DİNAMİK TF YAYINLAYICI: odom -> base_link dönüşümünü ağaca basmak için
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
        
        # 1. BAŞLANGIÇ DEĞERLERİ VE KALİBRASYON Sabitleri
        self.anten_offset = np.array([0.0, -0.81, 0.20])
        
        self.origin_rotation = R.from_quat([
            0.006954508886855634,
            0.0388077386168387276,
            -0.9982542606022622,
            -0.043979605055677766
        ])
        
        raw_antenna_origin = np.array([669056.1787730327, 4546733.860840387, 102.32558589493439])
        
        origin_offset_global = self.origin_rotation.apply(self.anten_offset)
        self.origin_position = raw_antenna_origin - origin_offset_global
        
        self.get_logger().info('Odometri Node Başlatıldı. Dinamik TF Yayıncısı aktif.')

    def odom_callback(self, msg: Odometry):
        # 1. Anlık mutlak koordinatları vektör olarak al
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

        # 2. Anlık anten pozisyonundan araç merkezini bul
        offset_global = current_quat.apply(self.anten_offset)
        vehicle_center_position = current_position - offset_global
        
        # 3. POZİSYON SIFIRLAMA
        local_position_raw = vehicle_center_position - self.origin_position
        
        # 4. BAŞLANGIÇ YÖNÜNE HİZALAMA
        local_position_aligned = self.origin_rotation.inv().apply(local_position_raw)
        
        # 5. YÖNELİMİ (QUATERNION) SIFIRLAMA
        local_quat = (current_quat * self.origin_rotation.inv()).as_quat()

        # 6. YENİ ODOMETRİ MESAJINI OLUŞTUR VE YAYINLA
        local_msg = msg
        local_msg.header = msg.header
        local_msg.header.frame_id = 'odom'        
        local_msg.child_frame_id = 'base_link'    
        
        local_msg.pose.pose.position.x = local_position_aligned[0]
        local_msg.pose.pose.position.y = local_position_aligned[1]
        local_msg.pose.pose.position.z = local_position_aligned[2]
        
        local_msg.pose.pose.orientation.x = local_quat[0]
        local_msg.pose.pose.orientation.y = local_quat[1]
        local_msg.pose.pose.orientation.z = local_quat[2]
        local_msg.pose.pose.orientation.w = local_quat[3]
        
        self.publisher.publish(local_msg)

        # 7. CRITICAL DÜZELTME: TF AĞACINA YAYINLAMA (odom -> base_link)
        transforms = []

        t = TransformStamped()
        t.header.stamp = local_msg.header.stamp # Gelen orijinal odometri zaman damgası korunmalı
        t.header.frame_id = 'odom'
        t.child_frame_id = 'base_link'

        # Odometride hesaplanan pozisyonu TF'e aktar
        t.transform.translation.x = local_position_aligned[0]
        t.transform.translation.y = local_position_aligned[1]
        t.transform.translation.z = local_position_aligned[2]

        # Odometride hesaplanan yönelimi TF'e aktar
        t.transform.rotation.x = local_quat[0]
        t.transform.rotation.y = local_quat[1]
        t.transform.rotation.z = local_quat[2]
        t.transform.rotation.w = local_quat[3]

        transforms.append(t)

        t2 = TransformStamped()
        t2.header.stamp = local_msg.header.stamp # Gelen orijinal odometri zaman damgası korunmalı
        t2.header.frame_id = 'base_link'
        t2.child_frame_id = 'velodyne'

        # Odometride hesaplanan pozisyonu TF'e aktar
        t2.transform.translation.x = local_position_aligned[0]
        t2.transform.translation.y = local_position_aligned[1]
        t2.transform.translation.z = local_position_aligned[2]

        # Odometride hesaplanan yönelimi TF'e aktar
        t2.transform.rotation.x = local_quat[0]
        t2.transform.rotation.y = local_quat[1]
        t2.transform.rotation.z = local_quat[2]
        t2.transform.rotation.w = local_quat[3]
        transforms.append(t2)


        # TF Ağacına gönderiyoruz
        self.tf_broadcaster.sendTransform(transforms)


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