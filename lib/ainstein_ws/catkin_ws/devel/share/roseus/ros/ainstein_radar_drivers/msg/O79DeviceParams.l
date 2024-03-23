;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_drivers::O79DeviceParams)
  (if (not (find-package "AINSTEIN_RADAR_DRIVERS"))
    (make-package "AINSTEIN_RADAR_DRIVERS"))
  (shadow 'O79DeviceParams (find-package "AINSTEIN_RADAR_DRIVERS")))
(unless (find-package "AINSTEIN_RADAR_DRIVERS::O79DEVICEPARAMS")
  (make-package "AINSTEIN_RADAR_DRIVERS::O79DEVICEPARAMS"))

(in-package "ROS")
;;//! \htmlinclude O79DeviceParams.msg.html


(defclass ainstein_radar_drivers::O79DeviceParams
  :super ros::object
  :slots (_fw_version _can_id _serial_no _mac_address ))

(defmethod ainstein_radar_drivers::O79DeviceParams
  (:init
   (&key
    ((:fw_version __fw_version) "")
    ((:can_id __can_id) "")
    ((:serial_no __serial_no) "")
    ((:mac_address __mac_address) "")
    )
   (send-super :init)
   (setq _fw_version (string __fw_version))
   (setq _can_id (string __can_id))
   (setq _serial_no (string __serial_no))
   (setq _mac_address (string __mac_address))
   self)
  (:fw_version
   (&optional __fw_version)
   (if __fw_version (setq _fw_version __fw_version)) _fw_version)
  (:can_id
   (&optional __can_id)
   (if __can_id (setq _can_id __can_id)) _can_id)
  (:serial_no
   (&optional __serial_no)
   (if __serial_no (setq _serial_no __serial_no)) _serial_no)
  (:mac_address
   (&optional __mac_address)
   (if __mac_address (setq _mac_address __mac_address)) _mac_address)
  (:serialization-length
   ()
   (+
    ;; string _fw_version
    4 (length _fw_version)
    ;; string _can_id
    4 (length _can_id)
    ;; string _serial_no
    4 (length _serial_no)
    ;; string _mac_address
    4 (length _mac_address)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _fw_version
       (write-long (length _fw_version) s) (princ _fw_version s)
     ;; string _can_id
       (write-long (length _can_id) s) (princ _can_id s)
     ;; string _serial_no
       (write-long (length _serial_no) s) (princ _serial_no s)
     ;; string _mac_address
       (write-long (length _mac_address) s) (princ _mac_address s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _fw_version
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fw_version (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _can_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _can_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _serial_no
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _serial_no (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _mac_address
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mac_address (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get ainstein_radar_drivers::O79DeviceParams :md5sum-) "9486679d9acc068b9eb160f4d0978a74")
(setf (get ainstein_radar_drivers::O79DeviceParams :datatype-) "ainstein_radar_drivers/O79DeviceParams")
(setf (get ainstein_radar_drivers::O79DeviceParams :definition-)
      "# This message describes the O-79 imaging radar device parameters.

string fw_version     # Firmware version
string can_id         # Radar CAN ID
string serial_no      # Radar serial number
string mac_address    # Radar MAC address
")



(provide :ainstein_radar_drivers/O79DeviceParams "9486679d9acc068b9eb160f4d0978a74")


