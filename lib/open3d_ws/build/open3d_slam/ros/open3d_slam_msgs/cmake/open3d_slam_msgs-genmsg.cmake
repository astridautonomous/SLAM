# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "open3d_slam_msgs: 2 messages, 2 services")

set(MSG_I_FLAGS "-Iopen3d_slam_msgs:/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(open3d_slam_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg" NAME_WE)
add_custom_target(_open3d_slam_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "open3d_slam_msgs" "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg" ""
)

get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/PolygonMesh.msg" NAME_WE)
add_custom_target(_open3d_slam_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "open3d_slam_msgs" "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/PolygonMesh.msg" "std_msgs/Header:sensor_msgs/PointField:open3d_slam_msgs/Vertices:sensor_msgs/PointCloud2"
)

get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveMap.srv" NAME_WE)
add_custom_target(_open3d_slam_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "open3d_slam_msgs" "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveMap.srv" ""
)

get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveSubmaps.srv" NAME_WE)
add_custom_target(_open3d_slam_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "open3d_slam_msgs" "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveSubmaps.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/open3d_slam_msgs
)
_generate_msg_cpp(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/PolygonMesh.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/open3d_slam_msgs
)

### Generating Services
_generate_srv_cpp(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/open3d_slam_msgs
)
_generate_srv_cpp(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveSubmaps.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/open3d_slam_msgs
)

### Generating Module File
_generate_module_cpp(open3d_slam_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/open3d_slam_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(open3d_slam_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(open3d_slam_msgs_generate_messages open3d_slam_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_cpp _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/PolygonMesh.msg" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_cpp _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveMap.srv" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_cpp _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveSubmaps.srv" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_cpp _open3d_slam_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(open3d_slam_msgs_gencpp)
add_dependencies(open3d_slam_msgs_gencpp open3d_slam_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS open3d_slam_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/open3d_slam_msgs
)
_generate_msg_eus(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/PolygonMesh.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/open3d_slam_msgs
)

### Generating Services
_generate_srv_eus(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/open3d_slam_msgs
)
_generate_srv_eus(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveSubmaps.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/open3d_slam_msgs
)

### Generating Module File
_generate_module_eus(open3d_slam_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/open3d_slam_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(open3d_slam_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(open3d_slam_msgs_generate_messages open3d_slam_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_eus _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/PolygonMesh.msg" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_eus _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveMap.srv" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_eus _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveSubmaps.srv" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_eus _open3d_slam_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(open3d_slam_msgs_geneus)
add_dependencies(open3d_slam_msgs_geneus open3d_slam_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS open3d_slam_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/open3d_slam_msgs
)
_generate_msg_lisp(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/PolygonMesh.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/open3d_slam_msgs
)

### Generating Services
_generate_srv_lisp(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/open3d_slam_msgs
)
_generate_srv_lisp(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveSubmaps.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/open3d_slam_msgs
)

### Generating Module File
_generate_module_lisp(open3d_slam_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/open3d_slam_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(open3d_slam_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(open3d_slam_msgs_generate_messages open3d_slam_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_lisp _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/PolygonMesh.msg" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_lisp _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveMap.srv" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_lisp _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveSubmaps.srv" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_lisp _open3d_slam_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(open3d_slam_msgs_genlisp)
add_dependencies(open3d_slam_msgs_genlisp open3d_slam_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS open3d_slam_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/open3d_slam_msgs
)
_generate_msg_nodejs(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/PolygonMesh.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/open3d_slam_msgs
)

### Generating Services
_generate_srv_nodejs(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/open3d_slam_msgs
)
_generate_srv_nodejs(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveSubmaps.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/open3d_slam_msgs
)

### Generating Module File
_generate_module_nodejs(open3d_slam_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/open3d_slam_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(open3d_slam_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(open3d_slam_msgs_generate_messages open3d_slam_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_nodejs _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/PolygonMesh.msg" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_nodejs _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveMap.srv" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_nodejs _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveSubmaps.srv" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_nodejs _open3d_slam_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(open3d_slam_msgs_gennodejs)
add_dependencies(open3d_slam_msgs_gennodejs open3d_slam_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS open3d_slam_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/open3d_slam_msgs
)
_generate_msg_py(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/PolygonMesh.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/open3d_slam_msgs
)

### Generating Services
_generate_srv_py(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveMap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/open3d_slam_msgs
)
_generate_srv_py(open3d_slam_msgs
  "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveSubmaps.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/open3d_slam_msgs
)

### Generating Module File
_generate_module_py(open3d_slam_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/open3d_slam_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(open3d_slam_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(open3d_slam_msgs_generate_messages open3d_slam_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/Vertices.msg" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_py _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/msg/PolygonMesh.msg" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_py _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveMap.srv" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_py _open3d_slam_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tezcan/Work_Spaces/open3d_ws/src/open3d_slam/ros/open3d_slam_msgs/srv/SaveSubmaps.srv" NAME_WE)
add_dependencies(open3d_slam_msgs_generate_messages_py _open3d_slam_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(open3d_slam_msgs_genpy)
add_dependencies(open3d_slam_msgs_genpy open3d_slam_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS open3d_slam_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/open3d_slam_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/open3d_slam_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(open3d_slam_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/open3d_slam_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/open3d_slam_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(open3d_slam_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/open3d_slam_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/open3d_slam_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(open3d_slam_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/open3d_slam_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/open3d_slam_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(open3d_slam_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/open3d_slam_msgs)
  install(CODE "execute_process(COMMAND \"/home/tezcan/anaconda3/envs/rosbridge-carla/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/open3d_slam_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/open3d_slam_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(open3d_slam_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
