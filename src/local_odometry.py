#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from nav_msgs.msg import Odometry
import numpy as np
from scipy.spatial.transform import Rotation as R
from geometry_msgs.msg import TransformStamped
from tf2_ros import TransformBroadcaster

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
        
        self.origin_rotation = R.from_quat([
            0.039366576056305135,
            -0.005621067737727492,
            -0.49813080553122996,
            -0.8661895732851433
        ])
        
        self.origin_position = np.array([658509.2749288337, 4543736.032312304, 86.44469179731873])

        self.get_logger().info('Odometri Node Başlatıldı.')

    def odom_callback(self, msg: Odometry):
        vehicle_center_position = np.array([
            msg.pose.pose.position.x,
            msg.pose.pose.position.y,
            msg.pose.pose.position.z
        ])

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
        # local_qt = self.origin_rotation.inv() * qt
        # updated_quat_array = local_qt.as_quat()

        euler = qt.as_euler('xyz', degrees=True)

        # 2.HARİTA
        # euler[2] += (180 - 83.18209917856753)

        # İLK HARİTA
        print("mesaj:", euler[2])

        euler[2] += -(59.71690265626092 + 3.668)
        euler[2] = (euler[2] + 180) % 360 - 180
        print(euler[2])
        
        # Array formatında yeni quaternion değerlerini tek seferde hesaplıyoruz
        updated_quat_array = R.from_euler('xyz', euler, degrees=True).as_quat()
        # 5. Odometry mesajı
        local_msg = msg
        local_msg.header.stamp = msg.header.stamp
        local_msg.header.frame_id = 'odom'
        local_msg.child_frame_id = 'base_link'
        
        local_msg.pose.pose.position.x = -local_position_aligned[0]
        local_msg.pose.pose.position.y = -local_position_aligned[1]
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
        
        t.transform.translation.x = -local_position_aligned[0]
        t.transform.translation.y = -local_position_aligned[1]
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
