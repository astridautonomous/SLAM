;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_msgs::RadarAlarm)
  (if (not (find-package "AINSTEIN_RADAR_MSGS"))
    (make-package "AINSTEIN_RADAR_MSGS"))
  (shadow 'RadarAlarm (find-package "AINSTEIN_RADAR_MSGS")))
(unless (find-package "AINSTEIN_RADAR_MSGS::RADARALARM")
  (make-package "AINSTEIN_RADAR_MSGS::RADARALARM"))

(in-package "ROS")
;;//! \htmlinclude RadarAlarm.msg.html


(defclass ainstein_radar_msgs::RadarAlarm
  :super ros::object
  :slots (_LCA_alarm _CVW_alarm _BSD_alarm ))

(defmethod ainstein_radar_msgs::RadarAlarm
  (:init
   (&key
    ((:LCA_alarm __LCA_alarm) nil)
    ((:CVW_alarm __CVW_alarm) nil)
    ((:BSD_alarm __BSD_alarm) nil)
    )
   (send-super :init)
   (setq _LCA_alarm __LCA_alarm)
   (setq _CVW_alarm __CVW_alarm)
   (setq _BSD_alarm __BSD_alarm)
   self)
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
   ;; bool _LCA_alarm
     (setq _LCA_alarm (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _CVW_alarm
     (setq _CVW_alarm (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _BSD_alarm
     (setq _BSD_alarm (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ainstein_radar_msgs::RadarAlarm :md5sum-) "bf40054820bd713d25eca0cd48632dd2")
(setf (get ainstein_radar_msgs::RadarAlarm :datatype-) "ainstein_radar_msgs/RadarAlarm")
(setf (get ainstein_radar_msgs::RadarAlarm :definition-)
      "# This message describes alarms (eg BSD) from a RADAR sensor.

bool LCA_alarm    # Lane Change Assist alarm
bool CVW_alarm    # Collision (Vehicle?) Warning alarm
bool BSD_alarm    # Blind Spot Detection alarm

")



(provide :ainstein_radar_msgs/RadarAlarm "bf40054820bd713d25eca0cd48632dd2")


