#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/tezcan/Work_Spaces/carla-ros-slam_ws/src/carla_waypoint_publisher"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/tezcan/Work_Spaces/carla-ros-slam_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/tezcan/Work_Spaces/carla-ros-slam_ws/install/lib/python3/dist-packages:/home/tezcan/Work_Spaces/carla-ros-slam_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/tezcan/Work_Spaces/carla-ros-slam_ws/build" \
    "/home/tezcan/anaconda3/envs/rosbridge-carla/bin/python3" \
    "/home/tezcan/Work_Spaces/carla-ros-slam_ws/src/carla_waypoint_publisher/setup.py" \
     \
    build --build-base "/home/tezcan/Work_Spaces/carla-ros-slam_ws/build/carla_waypoint_publisher" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/tezcan/Work_Spaces/carla-ros-slam_ws/install" --install-scripts="/home/tezcan/Work_Spaces/carla-ros-slam_ws/install/bin"
