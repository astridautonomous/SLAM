;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_msgs::TwistArray)
  (if (not (find-package "AINSTEIN_RADAR_MSGS"))
    (make-package "AINSTEIN_RADAR_MSGS"))
  (shadow 'TwistArray (find-package "AINSTEIN_RADAR_MSGS")))
(unless (find-package "AINSTEIN_RADAR_MSGS::TWISTARRAY")
  (make-package "AINSTEIN_RADAR_MSGS::TWISTARRAY"))

(in-package "ROS")
;;//! \htmlinclude TwistArray.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ainstein_radar_msgs::TwistArray
  :super ros::object
  :slots (_header _velocities ))

(defmethod ainstein_radar_msgs::TwistArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:velocities __velocities) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _velocities __velocities)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:velocities
   (&rest __velocities)
   (if (keywordp (car __velocities))
       (send* _velocities __velocities)
     (progn
       (if __velocities (setq _velocities (car __velocities)))
       _velocities)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Twist[] _velocities
    (apply #'+ (send-all _velocities :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Twist[] _velocities
     (write-long (length _velocities) s)
     (dolist (elem _velocities)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Twist[] _velocities
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _velocities (let (r) (dotimes (i n) (push (instance geometry_msgs::Twist :init) r)) r))
     (dolist (elem- _velocities)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ainstein_radar_msgs::TwistArray :md5sum-) "99d5a4212addb6ebc7a7ca0c92f09c0a")
(setf (get ainstein_radar_msgs::TwistArray :datatype-) "ainstein_radar_msgs/TwistArray")
(setf (get ainstein_radar_msgs::TwistArray :definition-)
      "# This message describes an array of targets with a timestamp.

std_msgs/Header header

geometry_msgs/Twist[] velocities

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
")



(provide :ainstein_radar_msgs/TwistArray "99d5a4212addb6ebc7a7ca0c92f09c0a")


