import rclpy
from rclpy.node import Node
from sensor_msgs.msg import PointCloud2,PointField
from sensor_msgs_py import point_cloud2
from std_msgs.msg import Header

import open3d as o3d
import numpy as np

class VoxelFilterNode(Node):
    def __init__(self):
        super().__init__("voxel_filter_node")

        self.get_logger().info("Voxel Filter Node basladi.")

        self.declare_parameter('non_filtered_topic','/carla/hero/lidar')
        self.declare_parameter('filtered_topic','/astrid/slam/voxel_grid_filter')
        self.declare_parameter('voxel_leaf_size',0.2)

        self.non_filtered_topic = self.get_parameter('non_filtered_topic').get_parameter_value().string_value
        self.filtered_topic = self.get_parameter('filtered_topic').get_parameter_value().string_value
        self.voxel_leaf_size = self.get_parameter('voxel_leaf_size').get_parameter_value().double_value

        self.create_subscription(PointCloud2,self.non_filtered_topic,self.voxel_callback,10)
    
        self.filtered_publisher = self.create_publisher(PointCloud2,self.filtered_topic,10)

    def voxel_callback(self,msg):
        points = point_cloud2.read_points(
            msg,
            field_names=("x","y","z"),
            skip_nans=True
        )
        
        xyz = []
        for p in points:
            # p = (x, y, z, ...) padding olabilir
            xyz.append([p[0], p[1], p[2]])  # sadece x, y, z al

        xyz = np.array(xyz, dtype=np.float32)
        
        pcd = o3d.geometry.PointCloud()
        pcd.points = o3d.utility.Vector3dVector(xyz)

        filtered = pcd.voxel_down_sample(voxel_size=self.voxel_leaf_size)

        filtered_xyz = np.asarray(filtered.points,dtype=np.float32)

        header = Header()
        header.stamp = self.get_clock().now().to_msg()
        header.frame_id = msg.header.frame_id

        fields = [
            PointField(name='x', offset=0, datatype=PointField.FLOAT32, count=1),
            PointField(name='y', offset=4, datatype=PointField.FLOAT32, count=1),
            PointField(name='z', offset=8, datatype=PointField.FLOAT32, count=1),
        ]

        cloud_message = point_cloud2.create_cloud(
            header,
            fields,
            filtered_xyz
        )

        self.filtered_publisher.publish(cloud_message)

        self.get_logger().info(
            f"Non-filtered: {xyz.shape[0]} | Filtered: {filtered_xyz.shape[0]}"
        )

def main(args=None):
    rclpy.init(args=args)
    node=VoxelFilterNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__=='__main__':
    main()


        
