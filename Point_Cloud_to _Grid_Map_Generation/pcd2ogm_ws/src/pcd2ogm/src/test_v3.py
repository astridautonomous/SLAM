import numpy as np
import open3d as o3d
import rospy
from nav_msgs.msg import OccupancyGrid

def grid_map_msgs(grid_map):
    rospy.init_node("ogm_publisher_node", anonymous=True)
    rospy.loginfo("Astrid Autonomous")
    rospy.logwarn("Application has been started, please wait")
    rospy.loginfo("Run Rviz and Add 'grid_map' to read the map")
    pub = rospy.Publisher("grid_map", OccupancyGrid, queue_size=10)
    rate = rospy.Rate(1)  # Herz

    msg = OccupancyGrid()
    msg.header.stamp = rospy.Time.now()
    msg.header.frame_id = "map"
    msg.info.resolution = 0.1
    msg.info.width = grid_map.shape[0]
    msg.info.height = grid_map.shape[1]
    msg.info.origin.position.x = 0
    msg.info.origin.position.y = 0
    msg.info.origin.position.z = 0
    msg.data = grid_map.flatten().tolist()

    while not rospy.is_shutdown():
        pub.publish(msg)
        rate.sleep()

if __name__ == "__main__":
    pcd = o3d.io.read_point_cloud("test_v2.pcd")  # Add here yours ".pcd" file
    pcd_array = np.asarray(pcd.points)

    grid_value = {"OCCUPIED": 100, "FREE": 0, "UNKNOWN": -1, "BORDER": -1}

    x_min, x_max = np.min(pcd_array[:, 0]), np.max(pcd_array[:, 0])
    y_min, y_max = np.min(pcd_array[:, 1]), np.max(pcd_array[:, 1])

    x_range = int(np.ceil(x_max - x_min) + 1)
    y_range = int(np.ceil(y_max - y_min) + 1)

    print("The Dimensions of the Map: {}, {}".format(x_range, y_range))

    points = np.zeros((x_range, y_range), dtype=np.int8)

    for point in pcd_array:
        x_index = int(np.round(point[0] - x_min))
        y_index = int(np.round(point[1] - y_min))
        points[x_index, y_index] = grid_value["OCCUPIED"]

    grid_map_msgs(points)
