;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_msgs::RadarTarget)
  (if (not (find-package "AINSTEIN_RADAR_MSGS"))
    (make-package "AINSTEIN_RADAR_MSGS"))
  (shadow 'RadarTarget (find-package "AINSTEIN_RADAR_MSGS")))
(unless (find-package "AINSTEIN_RADAR_MSGS::RADARTARGET")
  (make-package "AINSTEIN_RADAR_MSGS::RADARTARGET"))

(in-package "ROS")
;;//! \htmlinclude RadarTarget.msg.html


(defclass ainstein_radar_msgs::RadarTarget
  :super ros::object
  :slots (_target_id _snr _range _speed _azimuth _elevation ))

(defmethod ainstein_radar_msgs::RadarTarget
  (:init
   (&key
    ((:target_id __target_id) 0)
    ((:snr __snr) 0.0)
    ((:range __range) 0.0)
    ((:speed __speed) 0.0)
    ((:azimuth __azimuth) 0.0)
    ((:elevation __elevation) 0.0)
    )
   (send-super :init)
   (setq _target_id (round __target_id))
   (setq _snr (float __snr))
   (setq _range (float __range))
   (setq _speed (float __speed))
   (setq _azimuth (float __azimuth))
   (setq _elevation (float __elevation))
   self)
  (:target_id
   (&optional __target_id)
   (if __target_id (setq _target_id __target_id)) _target_id)
  (:snr
   (&optional __snr)
   (if __snr (setq _snr __snr)) _snr)
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:azimuth
   (&optional __azimuth)
   (if __azimuth (setq _azimuth __azimuth)) _azimuth)
  (:elevation
   (&optional __elevation)
   (if __elevation (setq _elevation __elevation)) _elevation)
  (:serialization-length
   ()
   (+
    ;; uint16 _target_id
    2
    ;; float64 _snr
    8
    ;; float64 _range
    8
    ;; float64 _speed
    8
    ;; float64 _azimuth
    8
    ;; float64 _elevation
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _target_id
       (write-word _target_id s)
     ;; float64 _snr
       (sys::poke _snr (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _range
       (sys::poke _range (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _azimuth
       (sys::poke _azimuth (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _elevation
       (sys::poke _elevation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _target_id
     (setq _target_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _snr
     (setq _snr (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _range
     (setq _range (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _azimuth
     (setq _azimuth (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _elevation
     (setq _elevation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ainstein_radar_msgs::RadarTarget :md5sum-) "942d59f5ed2080c1747d5b79ce6dc1c0")
(setf (get ainstein_radar_msgs::RadarTarget :datatype-) "ainstein_radar_msgs/RadarTarget")
(setf (get ainstein_radar_msgs::RadarTarget :definition-)
      "# This message describes a target (detection) from a RADAR sensor.

uint16 target_id    # ID of the target, as set by the sensor
float64 snr         # Signal-to-noise ratio
float64 range       # Distance from sensor to target along sensor x-axis
float64 speed       # Speed (range rate of change) of target along sensor x-axis
float64 azimuth     # Angle of target relative to sensor within x-y plane
float64 elevation   # Angle of target relative to sensor within y-z plane

")



(provide :ainstein_radar_msgs/RadarTarget "942d59f5ed2080c1747d5b79ce6dc1c0")


