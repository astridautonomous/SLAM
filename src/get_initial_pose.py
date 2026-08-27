import rclpy
from rclpy.node import Node
from geometry_msgs.msg import PoseStamped
from nav_msgs.msg import Odometry


class InitialPosePublisher(Node):
    def __init__(self):
        super().__init__('initial_pose_publisher')
        self.publisher_ = self.create_publisher(PoseStamped, '/astrid/slam/initial_pose', 10)

        self.initial_position = None

        # İlk odom mesajı gelene kadar dinle
        self.odom_sub = self.create_subscription(
            Odometry, '/astrid/odometry_local', self.odom_cb, 10
        )

        self.timer = self.create_timer(1.0, self.publish_initial_pose)

    def odom_cb(self, msg):
        if self.initial_position is not None:
            return 

        self.initial_position = (msg.pose.pose.position.x, msg.pose.pose.position.y)

        self.get_logger().info(
            f"İlk odometri yakalandı: ({self.initial_position[0]:.2f}, {self.initial_position[1]:.2f})"
        )

        # Artık odom'u dinlemeye gerek yok
        self.destroy_subscription(self.odom_sub)

    def publish_initial_pose(self):
        if self.initial_position is None:
            self.get_logger().warn("Henüz odom alınmadı, initial pose yayınlanamıyor.")
            return

        x, y = self.initial_position

        pose_msg = PoseStamped()
        pose_msg.header.stamp = self.get_clock().now().to_msg()
        pose_msg.header.frame_id = 'map'
        pose_msg.pose.position.x = x
        pose_msg.pose.position.y = y
        pose_msg.pose.position.z = 0.0
        pose_msg.pose.orientation.w = 1.0
        
        self.publisher_.publish(pose_msg)
        self.get_logger().info(f"Initial pose yayınlandı: ({x:.2f}, {y:.2f})")

        # Tek sefer yayınlayıp timer'ı durdurmak icin
        # self.timer.cancel()


def main(args=None):
    rclpy.init(args=args)
    node = InitialPosePublisher()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    node.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
