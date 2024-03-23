;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_msgs::RadarAlarmStamped)
  (if (not (find-package "AINSTEIN_RADAR_MSGS"))
    (make-package "AINSTEIN_RADAR_MSGS"))
  (shadow 'RadarAlarmStamped (find-package "AINSTEIN_RADAR_MSGS")))
(unless (find-package "AINSTEIN_RADAR_MSGS::RADARALARMSTAMPED")
  (make-package "AINSTEIN_RADAR_MSGS::RADARALARMSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude RadarAlarmStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ainstein_radar_msgs::RadarAlarmStamped
  :super ros::object
  :slots (_header _LCA_alarm _CVW_alarm _BSD_alarm ))

(defmethod ainstein_radar_msgs::RadarAlarmStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:LCA_alarm __LCA_alarm) nil)
    ((:CVW_alarm __CVW_alarm) nil)
    ((:BSD_alarm __BSD_alarm) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _LCA_alarm __LCA_alarm)
   (setq _CVW_alarm __CVW_alarm)
   (setq _BSD_alarm __BSD_alarm)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:LCA_alarm
   (&optional (__LCA_alarm :null))
   (if (not (eq __LCA_alarm :null)) (setq _LCA_alarm __LCA_alarm)) _LCA_alarm)
  (:CVW_alarm
   (&optional (__CVW_alarm :null))
   (if (not (eq __CVW_alarm :null)) (setq _CVW_alarm __CVW_alarm)) _CVW_alarm)
  (:BSD_alarm
   (&optional (__BSD_alarm :null))
   (if (not (eq __BSD_alarm :null)) (setq _BSD_alarm __BSD_alarm)) _BSD_alarm)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _LCA_alarm
    1
    ;; bool _CVW_alarm
    1
    ;; bool _BSD_alarm
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _LCA_alarm
       (if _LCA_alarm (write-byte -1 s) (write-byte 0 s))
     ;; bool _CVW_alarm
       (if _CVW_alarm (write-byte -1 s) (write-byte 0 s))
     ;; bool _BSD_alarm
       (if _BSD_alarm (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _LCA_alarm
     (setq _LCA_alarm (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _CVW_alarm
     (setq _CVW_alarm (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _BSD_alarm
     (setq _BSD_alarm (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ainstein_radar_msgs::RadarAlarmStamped :md5sum-) "c8302a7df5f42db7b8e1cc9a4e4b392a")
(setf (get ainstein_radar_msgs::RadarAlarmStamped :datatype-) "ainstein_radar_msgs/RadarAlarmStamped")
(setf (get ainstein_radar_msgs::RadarAlarmStamped :definition-)
      "# This message describes alarms (eg BSD) from a RADAR sensor.

std_msgs/Header header

bool LCA_alarm    # Lane Change Assist alarm
bool CVW_alarm    # Collision (Vehicle?) Warning alarm
bool BSD_alarm    # Blind Spot Detection alarm

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

")



(provide :ainstein_radar_msgs/RadarAlarmStamped "c8302a7df5f42db7b8e1cc9a4e4b392a")


