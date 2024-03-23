;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_drivers::WayvAirConfiguration)
  (if (not (find-package "AINSTEIN_RADAR_DRIVERS"))
    (make-package "AINSTEIN_RADAR_DRIVERS"))
  (shadow 'WayvAirConfiguration (find-package "AINSTEIN_RADAR_DRIVERS")))
(unless (find-package "AINSTEIN_RADAR_DRIVERS::WAYVAIRCONFIGURATION")
  (make-package "AINSTEIN_RADAR_DRIVERS::WAYVAIRCONFIGURATION"))

(in-package "ROS")
;;//! \htmlinclude WayvAirConfiguration.msg.html


(defclass ainstein_radar_drivers::WayvAirConfiguration
  :super ros::object
  :slots (_fw_ver _sbl_ver _id_485 _baud_485 _server_ip _server_port _wifi_name _wifi_pwd _con_wifi_name _con_wifi_pwd _dev_id _wifi_mode _sys_mode _radio_switch _radio_time _radar_conf _radar_config_len ))

(defmethod ainstein_radar_drivers::WayvAirConfiguration
  (:init
   (&key
    ((:fw_ver __fw_ver) "")
    ((:sbl_ver __sbl_ver) "")
    ((:id_485 __id_485) 0)
    ((:baud_485 __baud_485) 0)
    ((:server_ip __server_ip) "")
    ((:server_port __server_port) 0)
    ((:wifi_name __wifi_name) "")
    ((:wifi_pwd __wifi_pwd) "")
    ((:con_wifi_name __con_wifi_name) "")
    ((:con_wifi_pwd __con_wifi_pwd) "")
    ((:dev_id __dev_id) "")
    ((:wifi_mode __wifi_mode) 0)
    ((:sys_mode __sys_mode) 0)
    ((:radio_switch __radio_switch) 0)
    ((:radio_time __radio_time) 0)
    ((:radar_conf __radar_conf) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:radar_config_len __radar_config_len) 0)
    )
   (send-super :init)
   (setq _fw_ver (string __fw_ver))
   (setq _sbl_ver (string __sbl_ver))
   (setq _id_485 (round __id_485))
   (setq _baud_485 (round __baud_485))
   (setq _server_ip (string __server_ip))
   (setq _server_port (round __server_port))
   (setq _wifi_name (string __wifi_name))
   (setq _wifi_pwd (string __wifi_pwd))
   (setq _con_wifi_name (string __con_wifi_name))
   (setq _con_wifi_pwd (string __con_wifi_pwd))
   (setq _dev_id (string __dev_id))
   (setq _wifi_mode (round __wifi_mode))
   (setq _sys_mode (round __sys_mode))
   (setq _radio_switch (round __radio_switch))
   (setq _radio_time (round __radio_time))
   (setq _radar_conf __radar_conf)
   (setq _radar_config_len (round __radar_config_len))
   self)
  (:fw_ver
   (&optional __fw_ver)
   (if __fw_ver (setq _fw_ver __fw_ver)) _fw_ver)
  (:sbl_ver
   (&optional __sbl_ver)
   (if __sbl_ver (setq _sbl_ver __sbl_ver)) _sbl_ver)
  (:id_485
   (&optional __id_485)
   (if __id_485 (setq _id_485 __id_485)) _id_485)
  (:baud_485
   (&optional __baud_485)
   (if __baud_485 (setq _baud_485 __baud_485)) _baud_485)
  (:server_ip
   (&optional __server_ip)
   (if __server_ip (setq _server_ip __server_ip)) _server_ip)
  (:server_port
   (&optional __server_port)
   (if __server_port (setq _server_port __server_port)) _server_port)
  (:wifi_name
   (&optional __wifi_name)
   (if __wifi_name (setq _wifi_name __wifi_name)) _wifi_name)
  (:wifi_pwd
   (&optional __wifi_pwd)
   (if __wifi_pwd (setq _wifi_pwd __wifi_pwd)) _wifi_pwd)
  (:con_wifi_name
   (&optional __con_wifi_name)
   (if __con_wifi_name (setq _con_wifi_name __con_wifi_name)) _con_wifi_name)
  (:con_wifi_pwd
   (&optional __con_wifi_pwd)
   (if __con_wifi_pwd (setq _con_wifi_pwd __con_wifi_pwd)) _con_wifi_pwd)
  (:dev_id
   (&optional __dev_id)
   (if __dev_id (setq _dev_id __dev_id)) _dev_id)
  (:wifi_mode
   (&optional __wifi_mode)
   (if __wifi_mode (setq _wifi_mode __wifi_mode)) _wifi_mode)
  (:sys_mode
   (&optional __sys_mode)
   (if __sys_mode (setq _sys_mode __sys_mode)) _sys_mode)
  (:radio_switch
   (&optional __radio_switch)
   (if __radio_switch (setq _radio_switch __radio_switch)) _radio_switch)
  (:radio_time
   (&optional __radio_time)
   (if __radio_time (setq _radio_time __radio_time)) _radio_time)
  (:radar_conf
   (&optional __radar_conf)
   (if __radar_conf (setq _radar_conf __radar_conf)) _radar_conf)
  (:radar_config_len
   (&optional __radar_config_len)
   (if __radar_config_len (setq _radar_config_len __radar_config_len)) _radar_config_len)
  (:serialization-length
   ()
   (+
    ;; string _fw_ver
    4 (length _fw_ver)
    ;; string _sbl_ver
    4 (length _sbl_ver)
    ;; uint16 _id_485
    2
    ;; uint32 _baud_485
    4
    ;; string _server_ip
    4 (length _server_ip)
    ;; uint16 _server_port
    2
    ;; string _wifi_name
    4 (length _wifi_name)
    ;; string _wifi_pwd
    4 (length _wifi_pwd)
    ;; string _con_wifi_name
    4 (length _con_wifi_name)
    ;; string _con_wifi_pwd
    4 (length _con_wifi_pwd)
    ;; string _dev_id
    4 (length _dev_id)
    ;; uint16 _wifi_mode
    2
    ;; uint16 _sys_mode
    2
    ;; uint16 _radio_switch
    2
    ;; uint16 _radio_time
    2
    ;; string[] _radar_conf
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _radar_conf)) 4
    ;; uint16 _radar_config_len
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _fw_ver
       (write-long (length _fw_ver) s) (princ _fw_ver s)
     ;; string _sbl_ver
       (write-long (length _sbl_ver) s) (princ _sbl_ver s)
     ;; uint16 _id_485
       (write-word _id_485 s)
     ;; uint32 _baud_485
       (write-long _baud_485 s)
     ;; string _server_ip
       (write-long (length _server_ip) s) (princ _server_ip s)
     ;; uint16 _server_port
       (write-word _server_port s)
     ;; string _wifi_name
       (write-long (length _wifi_name) s) (princ _wifi_name s)
     ;; string _wifi_pwd
       (write-long (length _wifi_pwd) s) (princ _wifi_pwd s)
     ;; string _con_wifi_name
       (write-long (length _con_wifi_name) s) (princ _con_wifi_name s)
     ;; string _con_wifi_pwd
       (write-long (length _con_wifi_pwd) s) (princ _con_wifi_pwd s)
     ;; string _dev_id
       (write-long (length _dev_id) s) (princ _dev_id s)
     ;; uint16 _wifi_mode
       (write-word _wifi_mode s)
     ;; uint16 _sys_mode
       (write-word _sys_mode s)
     ;; uint16 _radio_switch
       (write-word _radio_switch s)
     ;; uint16 _radio_time
       (write-word _radio_time s)
     ;; string[] _radar_conf
     (write-long (length _radar_conf) s)
     (dolist (elem _radar_conf)
       (write-long (length elem) s) (princ elem s)
       )
     ;; uint16 _radar_config_len
       (write-word _radar_config_len s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _fw_ver
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fw_ver (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _sbl_ver
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sbl_ver (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _id_485
     (setq _id_485 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint32 _baud_485
     (setq _baud_485 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _server_ip
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _server_ip (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _server_port
     (setq _server_port (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; string _wifi_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _wifi_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _wifi_pwd
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _wifi_pwd (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _con_wifi_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _con_wifi_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _con_wifi_pwd
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _con_wifi_pwd (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _dev_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _dev_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _wifi_mode
     (setq _wifi_mode (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _sys_mode
     (setq _sys_mode (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _radio_switch
     (setq _radio_switch (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _radio_time
     (setq _radio_time (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; string[] _radar_conf
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _radar_conf (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _radar_conf i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; uint16 _radar_config_len
     (setq _radar_config_len (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get ainstein_radar_drivers::WayvAirConfiguration :md5sum-) "697324bcda4e9dd0d2b06e834f223a42")
(setf (get ainstein_radar_drivers::WayvAirConfiguration :datatype-) "ainstein_radar_drivers/WayvAirConfiguration")
(setf (get ainstein_radar_drivers::WayvAirConfiguration :definition-)
      "# This message describes the Wayv Air radar configuration parameters.
string fw_ver           # Firmware Version
string sbl_ver          # Bootloader Version
uint16 id_485           # 485 ID / Radar Comm ID
uint32 baud_485         # Serial Baud Rate
string server_ip        # Server IP address for Station Mode
uint16 server_port      # Server Port for Station Mode
string wifi_name        # WAYV (AP) broadcast Wifi Name
string wifi_pwd         # WAYV (AP) Broadcast Wifi Password
string con_wifi_name    # Station Mode Wifi Name
string con_wifi_pwd     # Station Mode Wifi Password
string dev_id           # Device Serial ID
uint16 wifi_mode        # AP mode (0) or Station mode(1)
uint16 sys_mode         # WAYV Operating Mode - Normal(0) - TLV(2) - TLV_Wifi(4)
uint16 radio_switch     # Radio Inactive (0) - Radio Inactive (1)
uint16 radio_time       #
string[] radar_conf       # Radar Configuration String
uint16 radar_config_len # Number of Radar Config Entries
")



(provide :ainstein_radar_drivers/WayvAirConfiguration "697324bcda4e9dd0d2b06e834f223a42")


