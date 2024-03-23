;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_msgs::RadarTrackedObjectStamped)
  (if (not (find-package "AINSTEIN_RADAR_MSGS"))
    (make-package "AINSTEIN_RADAR_MSGS"))
  (shadow 'RadarTrackedObjectStamped (find-package "AINSTEIN_RADAR_MSGS")))
(unless (find-package "AINSTEIN_RADAR_MSGS::RADARTRACKEDOBJECTSTAMPED")
  (make-package "AINSTEIN_RADAR_MSGS::RADARTRACKEDOBJECTSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude RadarTrackedObjectStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ainstein_radar_msgs::RadarTrackedObjectStamped
  :super ros::object
  :slots (_header _object ))

(defmethod ainstein_radar_msgs::RadarTrackedObjectStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:object __object) (instance ainstein_radar_msgs::RadarTrackedObject :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _object __object)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:object
   (&rest __object)
   (if (keywordp (car __object))
       (send* _object __object)
     (progn
       (if __object (setq _object (car __object)))
       _object)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ainstein_radar_msgs/RadarTrackedObject _object
    (send _object :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ainstein_radar_msgs/RadarTrackedObject _object
       (send _object :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ainstein_radar_msgs/RadarTrackedObject _object
     (send _object :deserialize buf ptr-) (incf ptr- (send _object :serialization-length))
   ;;
   self)
  )

(setf (get ainstein_radar_msgs::RadarTrackedObjectStamped :md5sum-) "f602f4531922144f087b6812eed02f3e")
(setf (get ainstein_radar_msgs::RadarTrackedObjectStamped :datatype-) "ainstein_radar_msgs/RadarTrackedObjectStamped")
(setf (get ainstein_radar_msgs::RadarTrackedObjectStamped :definition-)
      "# This message describes a tracked object with a timestamp.

std_msgs/Header header

RadarTrackedObject object

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: ainstein_radar_msgs/RadarTrackedObject
# This message describes a tracked object from a RADAR sensor.

uint16 id                    # Unique object identifier

geometry_msgs/Pose pose      # Cartesian position and orientation
geometry_msgs/Twist velocity # Cartesian linear and angular velocity (twist)

BoundingBox box              # Bounding box of associated raw detections
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: ainstein_radar_msgs/BoundingBox
# BoundingBox represents a oriented bounding box.
geometry_msgs/Pose pose
geometry_msgs/Vector3 dimensions  # size of bounding box (x, y, z)
# You can use this field to hold value such as likelihood
float32 value
uint32 label
")



(provide :ainstein_radar_msgs/RadarTrackedObjectStamped "f602f4531922144f087b6812eed02f3e")


