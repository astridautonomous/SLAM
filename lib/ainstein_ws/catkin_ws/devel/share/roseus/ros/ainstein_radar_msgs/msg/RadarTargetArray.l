;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_msgs::RadarTargetArray)
  (if (not (find-package "AINSTEIN_RADAR_MSGS"))
    (make-package "AINSTEIN_RADAR_MSGS"))
  (shadow 'RadarTargetArray (find-package "AINSTEIN_RADAR_MSGS")))
(unless (find-package "AINSTEIN_RADAR_MSGS::RADARTARGETARRAY")
  (make-package "AINSTEIN_RADAR_MSGS::RADARTARGETARRAY"))

(in-package "ROS")
;;//! \htmlinclude RadarTargetArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ainstein_radar_msgs::RadarTargetArray
  :super ros::object
  :slots (_header _targets ))

(defmethod ainstein_radar_msgs::RadarTargetArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:targets __targets) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _targets __targets)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:targets
   (&rest __targets)
   (if (keywordp (car __targets))
       (send* _targets __targets)
     (progn
       (if __targets (setq _targets (car __targets)))
       _targets)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ainstein_radar_msgs/RadarTarget[] _targets
    (apply #'+ (send-all _targets :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ainstein_radar_msgs/RadarTarget[] _targets
     (write-long (length _targets) s)
     (dolist (elem _targets)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ainstein_radar_msgs/RadarTarget[] _targets
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _targets (let (r) (dotimes (i n) (push (instance ainstein_radar_msgs::RadarTarget :init) r)) r))
     (dolist (elem- _targets)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ainstein_radar_msgs::RadarTargetArray :md5sum-) "e9ff18a480c0ec265f58b88134aeb493")
(setf (get ainstein_radar_msgs::RadarTargetArray :datatype-) "ainstein_radar_msgs/RadarTargetArray")
(setf (get ainstein_radar_msgs::RadarTargetArray :definition-)
      "# This message describes an array of targets with a timestamp.

std_msgs/Header header

RadarTarget[] targets

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



(provide :ainstein_radar_msgs/RadarTargetArray "e9ff18a480c0ec265f58b88134aeb493")


