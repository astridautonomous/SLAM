;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_drivers::O79TrackingParams)
  (if (not (find-package "AINSTEIN_RADAR_DRIVERS"))
    (make-package "AINSTEIN_RADAR_DRIVERS"))
  (shadow 'O79TrackingParams (find-package "AINSTEIN_RADAR_DRIVERS")))
(unless (find-package "AINSTEIN_RADAR_DRIVERS::O79TRACKINGPARAMS")
  (make-package "AINSTEIN_RADAR_DRIVERS::O79TRACKINGPARAMS"))

(in-package "ROS")
;;//! \htmlinclude O79TrackingParams.msg.html


(defclass ainstein_radar_drivers::O79TrackingParams
  :super ros::object
  :slots (_update_rate _min_time _timeout _confidence_level _proc_noise_speed _proc_noise_azim _proc_noise_elev _min_range _max_range _proc_noise_vel_x _proc_noise_vel_y _proc_noise_vel_z _meas_noise_speed _meas_noise_pos _filter_type ))

(defmethod ainstein_radar_drivers::O79TrackingParams
  (:init
   (&key
    ((:update_rate __update_rate) 0.0)
    ((:min_time __min_time) 0.0)
    ((:timeout __timeout) 0.0)
    ((:confidence_level __confidence_level) 0.0)
    ((:proc_noise_speed __proc_noise_speed) 0.0)
    ((:proc_noise_azim __proc_noise_azim) 0.0)
    ((:proc_noise_elev __proc_noise_elev) 0.0)
    ((:min_range __min_range) 0.0)
    ((:max_range __max_range) 0.0)
    ((:proc_noise_vel_x __proc_noise_vel_x) 0.0)
    ((:proc_noise_vel_y __proc_noise_vel_y) 0.0)
    ((:proc_noise_vel_z __proc_noise_vel_z) 0.0)
    ((:meas_noise_speed __meas_noise_speed) 0.0)
    ((:meas_noise_pos __meas_noise_pos) 0.0)
    ((:filter_type __filter_type) 0)
    )
   (send-super :init)
   (setq _update_rate (float __update_rate))
   (setq _min_time (float __min_time))
   (setq _timeout (float __timeout))
   (setq _confidence_level (float __confidence_level))
   (setq _proc_noise_speed (float __proc_noise_speed))
   (setq _proc_noise_azim (float __proc_noise_azim))
   (setq _proc_noise_elev (float __proc_noise_elev))
   (setq _min_range (float __min_range))
   (setq _max_range (float __max_range))
   (setq _proc_noise_vel_x (float __proc_noise_vel_x))
   (setq _proc_noise_vel_y (float __proc_noise_vel_y))
   (setq _proc_noise_vel_z (float __proc_noise_vel_z))
   (setq _meas_noise_speed (float __meas_noise_speed))
   (setq _meas_noise_pos (float __meas_noise_pos))
   (setq _filter_type (round __filter_type))
   self)
  (:update_rate
   (&optional __update_rate)
   (if __update_rate (setq _update_rate __update_rate)) _update_rate)
  (:min_time
   (&optional __min_time)
   (if __min_time (setq _min_time __min_time)) _min_time)
  (:timeout
   (&optional __timeout)
   (if __timeout (setq _timeout __timeout)) _timeout)
  (:confidence_level
   (&optional __confidence_level)
   (if __confidence_level (setq _confidence_level __confidence_level)) _confidence_level)
  (:proc_noise_speed
   (&optional __proc_noise_speed)
   (if __proc_noise_speed (setq _proc_noise_speed __proc_noise_speed)) _proc_noise_speed)
  (:proc_noise_azim
   (&optional __proc_noise_azim)
   (if __proc_noise_azim (setq _proc_noise_azim __proc_noise_azim)) _proc_noise_azim)
  (:proc_noise_elev
   (&optional __proc_noise_elev)
   (if __proc_noise_elev (setq _proc_noise_elev __proc_noise_elev)) _proc_noise_elev)
  (:min_range
   (&optional __min_range)
   (if __min_range (setq _min_range __min_range)) _min_range)
  (:max_range
   (&optional __max_range)
   (if __max_range (setq _max_range __max_range)) _max_range)
  (:proc_noise_vel_x
   (&optional __proc_noise_vel_x)
   (if __proc_noise_vel_x (setq _proc_noise_vel_x __proc_noise_vel_x)) _proc_noise_vel_x)
  (:proc_noise_vel_y
   (&optional __proc_noise_vel_y)
   (if __proc_noise_vel_y (setq _proc_noise_vel_y __proc_noise_vel_y)) _proc_noise_vel_y)
  (:proc_noise_vel_z
   (&optional __proc_noise_vel_z)
   (if __proc_noise_vel_z (setq _proc_noise_vel_z __proc_noise_vel_z)) _proc_noise_vel_z)
  (:meas_noise_speed
   (&optional __meas_noise_speed)
   (if __meas_noise_speed (setq _meas_noise_speed __meas_noise_speed)) _meas_noise_speed)
  (:meas_noise_pos
   (&optional __meas_noise_pos)
   (if __meas_noise_pos (setq _meas_noise_pos __meas_noise_pos)) _meas_noise_pos)
  (:filter_type
   (&optional __filter_type)
   (if __filter_type (setq _filter_type __filter_type)) _filter_type)
  (:serialization-length
   ()
   (+
    ;; float32 _update_rate
    4
    ;; float32 _min_time
    4
    ;; float32 _timeout
    4
    ;; float32 _confidence_level
    4
    ;; float32 _proc_noise_speed
    4
    ;; float32 _proc_noise_azim
    4
    ;; float32 _proc_noise_elev
    4
    ;; float32 _min_range
    4
    ;; float32 _max_range
    4
    ;; float32 _proc_noise_vel_x
    4
    ;; float32 _proc_noise_vel_y
    4
    ;; float32 _proc_noise_vel_z
    4
    ;; float32 _meas_noise_speed
    4
    ;; float32 _meas_noise_pos
    4
    ;; int8 _filter_type
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _update_rate
       (sys::poke _update_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _min_time
       (sys::poke _min_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _timeout
       (sys::poke _timeout (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _confidence_level
       (sys::poke _confidence_level (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _proc_noise_speed
       (sys::poke _proc_noise_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _proc_noise_azim
       (sys::poke _proc_noise_azim (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _proc_noise_elev
       (sys::poke _proc_noise_elev (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _min_range
       (sys::poke _min_range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_range
       (sys::poke _max_range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _proc_noise_vel_x
       (sys::poke _proc_noise_vel_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _proc_noise_vel_y
       (sys::poke _proc_noise_vel_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _proc_noise_vel_z
       (sys::poke _proc_noise_vel_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _meas_noise_speed
       (sys::poke _meas_noise_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _meas_noise_pos
       (sys::poke _meas_noise_pos (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8 _filter_type
       (write-byte _filter_type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _update_rate
     (setq _update_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _min_time
     (setq _min_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _timeout
     (setq _timeout (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _confidence_level
     (setq _confidence_level (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _proc_noise_speed
     (setq _proc_noise_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _proc_noise_azim
     (setq _proc_noise_azim (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _proc_noise_elev
     (setq _proc_noise_elev (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _min_range
     (setq _min_range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_range
     (setq _max_range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _proc_noise_vel_x
     (setq _proc_noise_vel_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _proc_noise_vel_y
     (setq _proc_noise_vel_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _proc_noise_vel_z
     (setq _proc_noise_vel_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _meas_noise_speed
     (setq _meas_noise_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _meas_noise_pos
     (setq _meas_noise_pos (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8 _filter_type
     (setq _filter_type (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _filter_type 127) (setq _filter_type (- _filter_type 256)))
   ;;
   self)
  )

(setf (get ainstein_radar_drivers::O79TrackingParams :md5sum-) "8794997c1f9ccf549a183253ff0fcb2e")
(setf (get ainstein_radar_drivers::O79TrackingParams :datatype-) "ainstein_radar_drivers/O79TrackingParams")
(setf (get ainstein_radar_drivers::O79TrackingParams :definition-)
      "# This message describes the O-79 imaging radar tracking filter parameters.

float32 update_rate
float32 min_time
float32 timeout
float32 confidence_level
float32 proc_noise_speed
float32 proc_noise_azim
float32 proc_noise_elev
float32 min_range
float32 max_range
float32 proc_noise_vel_x
float32 proc_noise_vel_y
float32 proc_noise_vel_z
float32 meas_noise_speed
float32 meas_noise_pos
int8 filter_type
")



(provide :ainstein_radar_drivers/O79TrackingParams "8794997c1f9ccf549a183253ff0fcb2e")


