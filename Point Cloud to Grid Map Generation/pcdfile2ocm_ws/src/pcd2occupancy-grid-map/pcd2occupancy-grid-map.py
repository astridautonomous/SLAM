#!~/anaconda3/envs/rosbridge-carla/bin/python3
import numpy as np
import open3d as o3d
import cv2 as cv
import rospy
from nav_msgs.msg import OccupancyGrid


if __name__ == "__main__":
    rospy.init_node("ogm_publisher_node",anonymous=True)
    rospy.loginfo("Astrid Autonomus")
    rospy.logwarn("Application has been started, please wait")

    pcd = o3d.io.read_point_cloud("testdrive_carla.pcd") # Add here yours ".pcd" file
    pcd_array = np.asarray(pcd.points)

    grid_value = {"OCCUPIED": 100, "FREE": 0, "UNKNOWN":-1, "BORDER": -1}

    x_axis = (pcd_array[:, 0])
    y_axis = (pcd_array[:, 1])
    z_axis = (pcd_array[:, 2])
    
    max_value_x = int(np.max(x_axis))+1
    min_value_x = int(np.min(x_axis))-1
    max_value_y = int(np.max(y_axis))+1
    min_value_y = int(np.min(y_axis))-1
    max_value_z = int(np.max(z_axis))+1
    min_value_z = int(np.min(z_axis))-1

    rospy.loginfo("Calculated Minimum and Maximum axis datas")

    print("\n","Maximum x value:", max_value_x)
    print(" Minimum x value:", min_value_x,"\n")
    print(" Maximum y value:", max_value_y)
    print(" Minimum y value:", min_value_y,"\n")
    print(" Maximum z value:", max_value_z)
    print(" Minimum z value:", min_value_z,"\n")

    x_range = int((max_value_x)-(min_value_x))
    y_range = int((max_value_y)-(min_value_y))
         
    rospy.loginfo("The Dimensions of the Map: {}, {}".format(x_range, y_range))

    points = np.zeros((x_range, y_range), dtype=np.int8)
    #print(points)
    axis = np.where(z_axis > 0.1) #and np.where(z_axis < 5.0)

    for a in range(len(points)):
        x_road_axis = int(x_axis[a])
        y_road_axis = int(y_axis[a])
        new_x_road_axis = x_road_axis - (min_value_x)             
        new_y_road_axis = y_road_axis - (min_value_y)
        points[new_x_road_axis,new_y_road_axis] = grid_value["FREE"]

    if len(axis[0]) > 0:
        for i in axis[0]:
            x_road_axis = int(x_axis[i])
            y_road_axis = int(y_axis[i])
            new_x_road_axis = x_road_axis - (min_value_x)
            new_y_road_axis = y_road_axis - (min_value_y)
            points[new_x_road_axis,new_y_road_axis] = grid_value["OCCUPIED"]
            
            for r in range(2):
                try:
                    points[new_x_road_axis+r,new_y_road_axis] = grid_value["BORDER"]
                    points[new_x_road_axis-r,new_y_road_axis] = grid_value["BORDER"]
                    points[new_x_road_axis,new_y_road_axis-r] = grid_value["BORDER"]
                    points[new_x_road_axis,new_y_road_axis+r] = grid_value["BORDER"]
                except: 
                    pass
        
    # np.savetxt('/home/tezcan/Work_Spaces/pcdfile2ocm_ws/src/pcd2occupancy-grid-map/testdrive_gridmap.txt', points, fmt='%d')
    # cv.imshow("AutonomoUs",points)
    # cv.waitKey(0)
    
    rospy.loginfo("Run Rviz and Add 'grid_map' to read the map")
    #rospy.logerr("AutonomoUs Error! Caution, You will be autonomous tomorrow")

    #publishing node 
    pub = rospy.Publisher("astrid_grid_map",OccupancyGrid, queue_size=10)
    rate = rospy.Rate(1) #Herz

    msg = OccupancyGrid()
    msg.header.stamp = rospy.Time.now()
    msg.header.frame_id = "map"
    msg.info.resolution = 0.1
    msg.info.width = points.shape[1]
    msg.info.height = points.shape[0]
    msg.info.origin.position.x = 0
    msg.info.origin.position.y = 0
    msg.info.origin.position.z = 0
    msg.data = points.flatten().tolist()

    while not rospy.is_shutdown():
        pub.publish(msg)
        rate.sleep()