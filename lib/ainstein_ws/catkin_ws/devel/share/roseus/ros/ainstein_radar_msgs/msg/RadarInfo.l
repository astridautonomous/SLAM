;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_msgs::RadarInfo)
  (if (not (find-package "AINSTEIN_RADAR_MSGS"))
    (make-package "AINSTEIN_RADAR_MSGS"))
  (shadow 'RadarInfo (find-package "AINSTEIN_RADAR_MSGS")))
(unless (find-package "AINSTEIN_RADAR_MSGS::RADARINFO")
  (make-package "AINSTEIN_RADAR_MSGS::RADARINFO"))

(in-package "ROS")
;;//! \htmlinclude RadarInfo.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ainstein_radar_msgs::RadarInfo
  :super ros::object
  :slots (_header _update_rate _max_num_targets _range_min _range_max _speed_min _speed_max _azimuth_min _azimuth_max _elevation_min _elevation_max _range_resolution _range_accuracy _speed_resolution _speed_accuracy _azimuth_resolution _azimuth_accuracy _elevation_resolution _elevation_accuracy ))

(defmethod ainstein_radar_msgs::RadarInfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:update_rate __update_rate) 0.0)
    ((:max_num_targets __max_num_targets) 0)
    ((:range_min __range_min) 0.0)
    ((:range_max __range_max) 0.0)
    ((:speed_min __speed_min) 0.0)
    ((:speed_max __speed_max) 0.0)
    ((:azimuth_min __azimuth_min) 0.0)
    ((:azimuth_max __azimuth_max) 0.0)
    ((:elevation_min __elevation_min) 0.0)
    ((:elevation_max __elevation_max) 0.0)
    ((:range_resolution __range_resolution) 0.0)
    ((:range_accuracy __range_accuracy) 0.0)
    ((:speed_resolution __speed_resolution) 0.0)
    ((:speed_accuracy __speed_accuracy) 0.0)
    ((:azimuth_resolution __azimuth_resolution) 0.0)
    ((:azimuth_accuracy __azimuth_accuracy) 0.0)
    ((:elevation_resolution __elevation_resolution) 0.0)
    ((:elevation_accuracy __elevation_accuracy) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _update_rate (float __update_rate))
   (setq _max_num_targets (round __max_num_targets))
   (setq _range_min (float __range_min))
   (setq _range_max (float __range_max))
   (setq _speed_min (float __speed_min))
   (setq _speed_max (float __speed_max))
   (setq _azimuth_min (float __azimuth_min))
   (setq _azimuth_max (float __azimuth_max))
   (setq _elevation_min (float __elevation_min))
   (setq _elevation_max (float __elevation_max))
   (setq _range_resolution (float __range_resolution))
   (setq _range_accuracy (float __range_accuracy))
   (setq _speed_resolution (float __speed_resolution))
   (setq _speed_accuracy (float __speed_accuracy))
   (setq _azimuth_resolution (float __azimuth_resolution))
   (setq _azimuth_accuracy (float __azimuth_accuracy))
   (setq _elevation_resolution (float __elevation_resolution))
   (setq _elevation_accuracy (float __elevation_accuracy))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:update_rate
   (&optional __update_rate)
   (if __update_rate (setq _update_rate __update_rate)) _update_rate)
  (:max_num_targets
   (&optional __max_num_targets)
   (if __max_num_targets (setq _max_num_targets __max_num_targets)) _max_num_targets)
  (:range_min
   (&optional __range_min)
   (if __range_min (setq _range_min __range_min)) _range_min)
  (:range_max
   (&optional __range_max)
   (if __range_max (setq _range_max __range_max)) _range_max)
  (:speed_min
   (&optional __speed_min)
   (if __speed_min (setq _speed_min __speed_min)) _speed_min)
  (:speed_max
   (&optional __speed_max)
   (if __speed_max (setq _speed_max __speed_max)) _speed_max)
  (:azimuth_min
   (&optional __azimuth_min)
   (if __azimuth_min (setq _azimuth_min __azimuth_min)) _azimuth_min)
  (:azimuth_max
   (&optional __azimuth_max)
   (if __azimuth_max (setq _azimuth_max __azimuth_max)) _azimuth_max)
  (:elevation_min
   (&optional __elevation_min)
   (if __elevation_min (setq _elevation_min __elevation_min)) _elevation_min)
  (:elevation_max
   (&optional __elevation_max)
   (if __elevation_max (setq _elevation_max __elevation_max)) _elevation_max)
  (:range_resolution
   (&optional __range_resolution)
   (if __range_resolution (setq _range_resolution __range_resolution)) _range_resolution)
  (:range_accuracy
   (&optional __range_accuracy)
   (if __range_accuracy (setq _range_accuracy __range_accuracy)) _range_accuracy)
  (:speed_resolution
   (&optional __speed_resolution)
   (if __speed_resolution (setq _speed_resolution __speed_resolution)) _speed_resolution)
  (:speed_accuracy
   (&optional __speed_accuracy)
   (if __speed_accuracy (setq _speed_accuracy __speed_accuracy)) _speed_accuracy)
  (:azimuth_resolution
   (&optional __azimuth_resolution)
   (if __azimuth_resolution (setq _azimuth_resolution __azimuth_resolution)) _azimuth_resolution)
  (:azimuth_accuracy
   (&optional __azimuth_accuracy)
   (if __azimuth_accuracy (setq _azimuth_accuracy __azimuth_accuracy)) _azimuth_accuracy)
  (:elevation_resolution
   (&optional __elevation_resolution)
   (if __elevation_resolution (setq _elevation_resolution __elevation_resolution)) _elevation_resolution)
  (:elevation_accuracy
   (&optional __elevation_accuracy)
   (if __elevation_accuracy (setq _elevation_accuracy __elevation_accuracy)) _elevation_accuracy)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _update_rate
    8
    ;; uint16 _max_num_targets
    2
    ;; float64 _range_min
    8
    ;; float64 _range_max
    8
    ;; float64 _speed_min
    8
    ;; float64 _speed_max
    8
    ;; float64 _azimuth_min
    8
    ;; float64 _azimuth_max
    8
    ;; float64 _elevation_min
    8
    ;; float64 _elevation_max
    8
    ;; float64 _range_resolution
    8
    ;; float64 _range_accuracy
    8
    ;; float64 _speed_resolution
    8
    ;; float64 _speed_accuracy
    8
    ;; float64 _azimuth_resolution
    8
    ;; float64 _azimuth_accuracy
    8
    ;; float64 _elevation_resolution
    8
    ;; float64 _elevation_accuracy
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _update_rate
       (sys::poke _update_rate (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint16 _max_num_targets
       (write-word _max_num_targets s)
     ;; float64 _range_min
       (sys::poke _range_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _range_max
       (sys::poke _range_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed_min
       (sys::poke _speed_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed_max
       (sys::poke _speed_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _azimuth_min
       (sys::poke _azimuth_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _azimuth_max
       (sys::poke _azimuth_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _elevation_min
       (sys::poke _elevation_min (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _elevation_max
       (sys::poke _elevation_max (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _range_resolution
       (sys::poke _range_resolution (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _range_accuracy
       (sys::poke _range_accuracy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed_resolution
       (sys::poke _speed_resolution (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed_accuracy
       (sys::poke _speed_accuracy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _azimuth_resolution
       (sys::poke _azimuth_resolution (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _azimuth_accuracy
       (sys::poke _azimuth_accuracy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _elevation_resolution
       (sys::poke _elevation_resolution (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _elevation_accuracy
       (sys::poke _elevation_accuracy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _update_rate
     (setq _update_rate (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint16 _max_num_targets
     (setq _max_num_targets (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _range_min
     (setq _range_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _range_max
     (setq _range_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed_min
     (setq _speed_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed_max
     (setq _speed_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _azimuth_min
     (setq _azimuth_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _azimuth_max
     (setq _azimuth_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _elevation_min
     (setq _elevation_min (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _elevation_max
     (setq _elevation_max (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _range_resolution
     (setq _range_resolution (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _range_accuracy
     (setq _range_accuracy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed_resolution
     (setq _speed_resolution (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed_accuracy
     (setq _speed_accuracy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _azimuth_resolution
     (setq _azimuth_resolution (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _azimuth_accuracy
     (setq _azimuth_accuracy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _elevation_resolution
     (setq _elevation_resolution (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _elevation_accuracy
     (setq _elevation_accuracy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ainstein_radar_msgs::RadarInfo :md5sum-) "517f7ed5e498f66b6af3caaa2c6f2059")
(setf (get ainstein_radar_msgs::RadarInfo :datatype-) "ainstein_radar_msgs/RadarInfo")
(setf (get ainstein_radar_msgs::RadarInfo :definition-)
      "# This message defines meta information for a radar sensor. It should
# be in a radar namespace on topic \"radar_info\" and accompanied by up
# to three radar topics named:
#
#   targets/raw      - raw (untracked) radar detections
#   targets/tracked  - tracked radar detections
#   alarms           - alarms based on detections, eg BSD
#
# In general, all Ainstein radars output raw detections and may also
# output tracked detections if trackign algorithms are implemented in
# firmware. Tracking from raw data is also available in ROS; see the
# ainstein_radar_filters package for more information. Most radars do
# not output alarms as this is specific to the automotive use case,
# however this message type is retained for the time being for backward
# compatibility.

#######################################################################
#                     Data acquisition info                           #
#######################################################################

# Time of data acquisition, radar coordinate frame ID
Header header    # Header timestamp should be acquisition time of data
                 # Header frame_id should be radar sensing frame
                 # origin of frame should be center of sensor
                 # +x should point radially outwards from the radar
                 # +y should point to complete a right-handed frame
                 # +z should point upwards

#######################################################################
#                    General sensor properties                        #
#######################################################################

# The nominal update rate of the sensor reported in Hz.
float64 update_rate

# The maximum number of detections (targets) the sensors can report.
uint16 max_num_targets

#######################################################################
#                    Physical sensing limits                          #
#######################################################################
# These are limits imposed by the antenna hardware and/or cutoffs set #
# in the detection processing firmware. They come from sensor data    #
# sheets and must be updated with each hardware revision as necessary.#
#######################################################################

# The minimum and maximum range, in meters, of detections (targets)
# reported by the sensor.
float64 range_min
float64 range_max

# The minimum and maximum speed, in meters per second, of detections
# (targets) reported by the sensor.
float64 speed_min
float64 speed_max

# The minimum and maximum azimuth angle, in degrees.
float64 azimuth_min
float64 azimuth_max

# The minimum and maximum azimuth angle, in degrees.
float64 elevation_min
float64 elevation_max

#######################################################################
#                    Physical sensing precision                       #
#######################################################################
# These are also imposed by the antenna hardware and/or set in the    #
# detection processing firmware. They also come from sensor data      #
# sheets and must be updated with each hardware revision as necessary.#
#######################################################################

# Range resolution, in meters. The resolution is defined as the minimum
# distance between two objects which results in distinct detections.
float64 range_resolution

# Range accuracy, in meters. The accuracy is defined as the precision
# with which range of a detection is reported.
float64 range_accuracy

# Speed resolution, in meters per second. The resolution is defined as
# the minimum speed difference between two objects which results in
# distinct detections.
float64 speed_resolution

# Speed accuracy, in meters per second. The accuracy is defined as the
# precision with which speed of a detection is reported.
float64 speed_accuracy

# Azimuth angle resolution, in degrees. The resolution is defined as
# the minimum azimuth angle between two objects which results in
# distinct detections.
float64 azimuth_resolution

# Azimuth angle accuracy, in degrees. The accuracy is defined as the
# precision with which the azimuth angle of a detection is reported.
float64 azimuth_accuracy

# Elevation angle resolution, in degrees. The resolution is defined as
# the minimum elevation angle between two objects which results in
# distinct detections.
float64 elevation_resolution

# Elevation angle accuracy, in degrees. The accuracy is defined as the
# precision with which the elevation angle of a detection is reported.
float64 elevation_accuracy

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



(provide :ainstein_radar_msgs/RadarInfo "517f7ed5e498f66b6af3caaa2c6f2059")


