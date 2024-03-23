;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_drivers::O79NetworkParams)
  (if (not (find-package "AINSTEIN_RADAR_DRIVERS"))
    (make-package "AINSTEIN_RADAR_DRIVERS"))
  (shadow 'O79NetworkParams (find-package "AINSTEIN_RADAR_DRIVERS")))
(unless (find-package "AINSTEIN_RADAR_DRIVERS::O79NETWORKPARAMS")
  (make-package "AINSTEIN_RADAR_DRIVERS::O79NETWORKPARAMS"))

(in-package "ROS")
;;//! \htmlinclude O79NetworkParams.msg.html


(defclass ainstein_radar_drivers::O79NetworkParams
  :super ros::object
  :slots (_ip _netmask _gateway _host_ip _host_port ))

(defmethod ainstein_radar_drivers::O79NetworkParams
  (:init
   (&key
    ((:ip __ip) "")
    ((:netmask __netmask) "")
    ((:gateway __gateway) "")
    ((:host_ip __host_ip) "")
    ((:host_port __host_port) 0)
    )
   (send-super :init)
   (setq _ip (string __ip))
   (setq _netmask (string __netmask))
   (setq _gateway (string __gateway))
   (setq _host_ip (string __host_ip))
   (setq _host_port (round __host_port))
   self)
  (:ip
   (&optional __ip)
   (if __ip (setq _ip __ip)) _ip)
  (:netmask
   (&optional __netmask)
   (if __netmask (setq _netmask __netmask)) _netmask)
  (:gateway
   (&optional __gateway)
   (if __gateway (setq _gateway __gateway)) _gateway)
  (:host_ip
   (&optional __host_ip)
   (if __host_ip (setq _host_ip __host_ip)) _host_ip)
  (:host_port
   (&optional __host_port)
   (if __host_port (setq _host_port __host_port)) _host_port)
  (:serialization-length
   ()
   (+
    ;; string _ip
    4 (length _ip)
    ;; string _netmask
    4 (length _netmask)
    ;; string _gateway
    4 (length _gateway)
    ;; string _host_ip
    4 (length _host_ip)
    ;; uint16 _host_port
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _ip
       (write-long (length _ip) s) (princ _ip s)
     ;; string _netmask
       (write-long (length _netmask) s) (princ _netmask s)
     ;; string _gateway
       (write-long (length _gateway) s) (princ _gateway s)
     ;; string _host_ip
       (write-long (length _host_ip) s) (princ _host_ip s)
     ;; uint16 _host_port
       (write-word _host_port s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _ip
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _ip (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _netmask
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _netmask (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _gateway
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _gateway (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _host_ip
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _host_ip (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _host_port
     (setq _host_port (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get ainstein_radar_drivers::O79NetworkParams :md5sum-) "a69287f037293465b761a7fa4a733b65")
(setf (get ainstein_radar_drivers::O79NetworkParams :datatype-) "ainstein_radar_drivers/O79NetworkParams")
(setf (get ainstein_radar_drivers::O79NetworkParams :definition-)
      "# This message describes the O-79 imaging radar network parameters.

string ip           # Radar IP address
string netmask      # Radar network mask
string gateway      # Radar network gateway
string host_ip      # Host PC IP address
uint16 host_port    # Host PC port

")



(provide :ainstein_radar_drivers/O79NetworkParams "a69287f037293465b761a7fa4a733b65")


