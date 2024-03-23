;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_msgs::RadarAlarmArray)
  (if (not (find-package "AINSTEIN_RADAR_MSGS"))
    (make-package "AINSTEIN_RADAR_MSGS"))
  (shadow 'RadarAlarmArray (find-package "AINSTEIN_RADAR_MSGS")))
(unless (find-package "AINSTEIN_RADAR_MSGS::RADARALARMARRAY")
  (make-package "AINSTEIN_RADAR_MSGS::RADARALARMARRAY"))

(in-package "ROS")
;;//! \htmlinclude RadarAlarmArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ainstein_radar_msgs::RadarAlarmArray
  :super ros::object
  :slots (_header _alarms ))

(defmethod ainstein_radar_msgs::RadarAlarmArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:alarms __alarms) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _alarms __alarms)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:alarms
   (&rest __alarms)
   (if (keywordp (car __alarms))
       (send* _alarms __alarms)
     (progn
       (if __alarms (setq _alarms (car __alarms)))
       _alarms)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ainstein_radar_msgs/RadarAlarm[] _alarms
    (apply #'+ (send-all _alarms :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ainstein_radar_msgs/RadarAlarm[] _alarms
     (write-long (length _alarms) s)
     (dolist (elem _alarms)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ainstein_radar_msgs/RadarAlarm[] _alarms
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _alarms (let (r) (dotimes (i n) (push (instance ainstein_radar_msgs::RadarAlarm :init) r)) r))
     (dolist (elem- _alarms)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ainstein_radar_msgs::RadarAlarmArray :md5sum-) "a2ed2b28cdaf4bd421182c41d9016e57")
(setf (get ainstein_radar_msgs::RadarAlarmArray :datatype-) "ainstein_radar_msgs/RadarAlarmArray")
(setf (get ainstein_radar_msgs::RadarAlarmArray :definition-)
      "# This message describes an array of alarms with a timestamp.

std_msgs/Header header

RadarAlarm[] alarms

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
MSG: ainstein_radar_msgs/RadarAlarm
# This message describes alarms (eg BSD) from a RADAR sensor.

bool LCA_alarm    # Lane Change Assist alarm
bool CVW_alarm    # Collision (Vehicle?) Warning alarm
bool BSD_alarm    # Blind Spot Detection alarm

")



(provide :ainstein_radar_msgs/RadarAlarmArray "a2ed2b28cdaf4bd421182c41d9016e57")


