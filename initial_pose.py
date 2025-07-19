#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped
from rclpy.qos import QoSProfile, DurabilityPolicy

class InitialPosePublisher(Node):
    def __init__(self):
        super().__init__('initial_pose_publisher')

        # Transient local QoS ile yayıncı (latching benzeri davranış)
        qos = QoSProfile(depth=1)
        qos.durability = DurabilityPolicy.TRANSIENT_LOCAL
        self.init_pub = self.create_publisher(
            PoseStamped,
            '/astrid/slam/initial_pose',
            qos)

        # Tek seferlik callback flag
        self._got_initial = False

        # Odometry aboneliği
        self.create_subscription(
            Odometry,
            '/clap/ros/odmetry',
            self.odom_callback,
            10)

        self.get_logger().info('InitialPosePublisher başlatıldı, ilk odometry bekleniyor...')

    def odom_callback(self, msg: Odometry):
        if self._got_initial:
            return

        # İlk odometry alındı, publish et
        init = PoseStamped()
        init.header.stamp = msg.header.stamp
        init.header.frame_id = msg.header.frame_id  

        # Sadece x, y alınıyor
        init.pose.position.x = msg.pose.pose.position.x
        init.pose.position.y = msg.pose.pose.position.y
        init.pose.position.z = 0.0

        # Orientation'ı nötr birimi (identity quaternion)
        init.pose.orientation.x = 0.0
        init.pose.orientation.y = 0.0
        init.pose.orientation.z = 0.0
        init.pose.orientation.w = 1.0

        self.init_pub.publish(init)
        self._got_initial = True
        self.get_logger().info(
            f'Initial pose yayınlandı: x={init.pose.position.x:.3f}, y={init.pose.position.y:.3f}'
        )

def main(args=None):
    rclpy.init(args=args)
    node = InitialPosePublisher()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
