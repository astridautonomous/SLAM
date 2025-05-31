# Install script for directory: /home/tezcan/workspaces_git/SLAM/realtime-pc2grid_ws/src/pointcloud_to_grid

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/tezcan/workspaces_git/SLAM/realtime-pc2grid_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pointcloud_to_grid" TYPE FILE FILES "/home/tezcan/workspaces_git/SLAM/realtime-pc2grid_ws/devel/include/pointcloud_to_grid/MyParamsConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/pointcloud_to_grid" TYPE FILE FILES "/home/tezcan/workspaces_git/SLAM/realtime-pc2grid_ws/devel/lib/python3/dist-packages/pointcloud_to_grid/__init__.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/tezcan/workspaces_git/SLAM/realtime-pc2grid_ws/devel/lib/python3/dist-packages/pointcloud_to_grid/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/pointcloud_to_grid" TYPE DIRECTORY FILES "/home/tezcan/workspaces_git/SLAM/realtime-pc2grid_ws/devel/lib/python3/dist-packages/pointcloud_to_grid/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/tezcan/workspaces_git/SLAM/realtime-pc2grid_ws/build/pointcloud_to_grid/catkin_generated/installspace/pointcloud_to_grid.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pointcloud_to_grid/cmake" TYPE FILE FILES
    "/home/tezcan/workspaces_git/SLAM/realtime-pc2grid_ws/build/pointcloud_to_grid/catkin_generated/installspace/pointcloud_to_gridConfig.cmake"
    "/home/tezcan/workspaces_git/SLAM/realtime-pc2grid_ws/build/pointcloud_to_grid/catkin_generated/installspace/pointcloud_to_gridConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pointcloud_to_grid" TYPE FILE FILES "/home/tezcan/workspaces_git/SLAM/realtime-pc2grid_ws/src/pointcloud_to_grid/package.xml")
endif()

