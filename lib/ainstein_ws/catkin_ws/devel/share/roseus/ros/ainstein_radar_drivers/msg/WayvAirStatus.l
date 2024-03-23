;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_drivers::WayvAirStatus)
  (if (not (find-package "AINSTEIN_RADAR_DRIVERS"))
    (make-package "AINSTEIN_RADAR_DRIVERS"))
  (shadow 'WayvAirStatus (find-package "AINSTEIN_RADAR_DRIVERS")))
(unless (find-package "AINSTEIN_RADAR_DRIVERS::WAYVAIRSTATUS")
  (make-package "AINSTEIN_RADAR_DRIVERS::WAYVAIRSTATUS"))

(in-package "ROS")
;;//! \htmlinclude WayvAirStatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ainstein_radar_drivers::WayvAirStatus
  :super ros::object
  :slots (_header _board_temp _tx_temps _pm_temp _voltage _power ))

(defmethod ainstein_radar_drivers::WayvAirStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:board_temp __board_temp) 0.0)
    ((:tx_temps __tx_temps) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pm_temp __pm_temp) 0.0)
    ((:voltage __voltage) 0.0)
    ((:power __power) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _board_temp (float __board_temp))
   (setq _tx_temps __tx_temps)
   (setq _pm_temp (float __pm_temp))
   (setq _voltage (float __voltage))
   (setq _power (float __power))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:board_temp
   (&optional __board_temp)
   (if __board_temp (setq _board_temp __board_temp)) _board_temp)
  (:tx_temps
   (&optional __tx_temps)
   (if __tx_temps (setq _tx_temps __tx_temps)) _tx_temps)
  (:pm_temp
   (&optional __pm_temp)
   (if __pm_temp (setq _pm_temp __pm_temp)) _pm_temp)
  (:voltage
   (&optional __voltage)
   (if __voltage (setq _voltage __voltage)) _voltage)
  (:power
   (&optional __power)
   (if __power (setq _power __power)) _power)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _board_temp
    4
    ;; float32[] _tx_temps
    (* 4    (length _tx_temps)) 4
    ;; float32 _pm_temp
    4
    ;; float32 _voltage
    4
    ;; float32 _power
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _board_temp
       (sys::poke _board_temp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _tx_temps
     (write-long (length _tx_temps) s)
     (dotimes (i (length _tx_temps))
       (sys::poke (elt _tx_temps i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _pm_temp
       (sys::poke _pm_temp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _voltage
       (sys::poke _voltage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _power
       (sys::poke _power (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _board_temp
     (setq _board_temp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _tx_temps
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tx_temps (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _tx_temps i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _pm_temp
     (setq _pm_temp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _voltage
     (setq _voltage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _power
     (setq _power (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ainstein_radar_drivers::WayvAirStatus :md5sum-) "fb442fd5018b46ec3791154842d3c373")
(setf (get ainstein_radar_drivers::WayvAirStatus :datatype-) "ainstein_radar_drivers/WayvAirStatus")
(setf (get ainstein_radar_drivers::WayvAirStatus :definition-)
      "# This message describes the Wayv Air radar device status.

std_msgs/Header header
float32 board_temp     # Board temperature, *C
float32[] tx_temps     # Tx temperatures, *C
float32 pm_temp        # PM temperature, *C
float32 voltage        # Voltage, V
float32 power          # Power, mW

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



(provide :ainstein_radar_drivers/WayvAirStatus "fb442fd5018b46ec3791154842d3c373")


