execute_process(COMMAND "/home/tezcan/Work_Spaces/carla-ros-slam_ws/build/carla_ego_vehicle/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/tezcan/Work_Spaces/carla-ros-slam_ws/build/carla_ego_vehicle/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
