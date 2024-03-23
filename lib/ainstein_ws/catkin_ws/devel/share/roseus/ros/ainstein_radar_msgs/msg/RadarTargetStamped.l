;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_msgs::RadarTargetStamped)
  (if (not (find-package "AINSTEIN_RADAR_MSGS"))
    (make-package "AINSTEIN_RADAR_MSGS"))
  (shadow 'RadarTargetStamped (find-package "AINSTEIN_RADAR_MSGS")))
(unless (find-package "AINSTEIN_RADAR_MSGS::RADARTARGETSTAMPED")
  (make-package "AINSTEIN_RADAR_MSGS::RADARTARGETSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude RadarTargetStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ainstein_radar_msgs::RadarTargetStamped
  :super ros::object
  :slots (_header _target ))

(defmethod ainstein_radar_msgs::RadarTargetStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:target __target) (instance ainstein_radar_msgs::RadarTarget :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _target __target)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:target
   (&rest __target)
   (if (keywordp (car __target))
       (send* _target __target)
     (progn
       (if __target (setq _target (car __target)))
       _target)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ainstein_radar_msgs/RadarTarget _target
    (send _target :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ainstein_radar_msgs/RadarTarget _target
       (send _target :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ainstein_radar_msgs/RadarTarget _target
     (send _target :deserialize buf ptr-) (incf ptr- (send _target :serialization-length))
   ;;
   self)
  )

(setf (get ainstein_radar_msgs::RadarTargetStamped :md5sum-) "b1fbe9d124fcb7889ff4a0fa4df5665a")
(setf (get ainstein_radar_msgs::RadarTargetStamped :datatype-) "ainstein_radar_msgs/RadarTargetStamped")
(setf (get ainstein_radar_msgs::RadarTargetStamped :definition-)
      "# This message describes a target (detection) from a RADAR sensor with a timestamp.

std_msgs/Header header

RadarTarget target

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
MSG: ainstein_radar_msgs/RadarTarget
# This message describes a target (detection) from a RADAR sensor.

uint16 target_id    # ID of the target, as set by the sensor
float64 snr         # Signal-to-noise ratio
float64 range       # Distance from sensor to target along sensor x-axis
float64 speed       # Speed (range rate of change) of target along sensor x-axis
float64 azimuth     # Angle of target relative to sensor within x-y plane
float64 elevation   # Angle of target relative to sensor within y-z plane

")



(provide :ainstein_radar_msgs/RadarTargetStamped "b1fbe9d124fcb7889ff4a0fa4df5665a")


