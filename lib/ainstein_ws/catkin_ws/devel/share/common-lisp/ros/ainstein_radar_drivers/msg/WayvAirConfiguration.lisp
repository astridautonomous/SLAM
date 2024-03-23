; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_drivers-msg)


;//! \htmlinclude WayvAirConfiguration.msg.html

(cl:defclass <WayvAirConfiguration> (roslisp-msg-protocol:ros-message)
  ((fw_ver
    :reader fw_ver
    :initarg :fw_ver
    :type cl:string
    :initform "")
   (sbl_ver
    :reader sbl_ver
    :initarg :sbl_ver
    :type cl:string
    :initform "")
   (id_485
    :reader id_485
    :initarg :id_485
    :type cl:fixnum
    :initform 0)
   (baud_485
    :reader baud_485
    :initarg :baud_485
    :type cl:integer
    :initform 0)
   (server_ip
    :reader server_ip
    :initarg :server_ip
    :type cl:string
    :initform "")
   (server_port
    :reader server_port
    :initarg :server_port
    :type cl:fixnum
    :initform 0)
   (wifi_name
    :reader wifi_name
    :initarg :wifi_name
    :type cl:string
    :initform "")
   (wifi_pwd
    :reader wifi_pwd
    :initarg :wifi_pwd
    :type cl:string
    :initform "")
   (con_wifi_name
    :reader con_wifi_name
    :initarg :con_wifi_name
    :type cl:string
    :initform "")
   (con_wifi_pwd
    :reader con_wifi_pwd
    :initarg :con_wifi_pwd
    :type cl:string
    :initform "")
   (dev_id
    :reader dev_id
    :initarg :dev_id
    :type cl:string
    :initform "")
   (wifi_mode
    :reader wifi_mode
    :initarg :wifi_mode
    :type cl:fixnum
    :initform 0)
   (sys_mode
    :reader sys_mode
    :initarg :sys_mode
    :type cl:fixnum
    :initform 0)
   (radio_switch
    :reader radio_switch
    :initarg :radio_switch
    :type cl:fixnum
    :initform 0)
   (radio_time
    :reader radio_time
    :initarg :radio_time
    :type cl:fixnum
    :initform 0)
   (radar_conf
    :reader radar_conf
    :initarg :radar_conf
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (radar_config_len
    :reader radar_config_len
    :initarg :radar_config_len
    :type cl:fixnum
    :initform 0))
)

(cl:defclass WayvAirConfiguration (<WayvAirConfiguration>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WayvAirConfiguration>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WayvAirConfiguration)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_drivers-msg:<WayvAirConfiguration> is deprecated: use ainstein_radar_drivers-msg:WayvAirConfiguration instead.")))

(cl:ensure-generic-function 'fw_ver-val :lambda-list '(m))
(cl:defmethod fw_ver-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:fw_ver-val is deprecated.  Use ainstein_radar_drivers-msg:fw_ver instead.")
  (fw_ver m))

(cl:ensure-generic-function 'sbl_ver-val :lambda-list '(m))
(cl:defmethod sbl_ver-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:sbl_ver-val is deprecated.  Use ainstein_radar_drivers-msg:sbl_ver instead.")
  (sbl_ver m))

(cl:ensure-generic-function 'id_485-val :lambda-list '(m))
(cl:defmethod id_485-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:id_485-val is deprecated.  Use ainstein_radar_drivers-msg:id_485 instead.")
  (id_485 m))

(cl:ensure-generic-function 'baud_485-val :lambda-list '(m))
(cl:defmethod baud_485-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:baud_485-val is deprecated.  Use ainstein_radar_drivers-msg:baud_485 instead.")
  (baud_485 m))

(cl:ensure-generic-function 'server_ip-val :lambda-list '(m))
(cl:defmethod server_ip-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:server_ip-val is deprecated.  Use ainstein_radar_drivers-msg:server_ip instead.")
  (server_ip m))

(cl:ensure-generic-function 'server_port-val :lambda-list '(m))
(cl:defmethod server_port-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:server_port-val is deprecated.  Use ainstein_radar_drivers-msg:server_port instead.")
  (server_port m))

(cl:ensure-generic-function 'wifi_name-val :lambda-list '(m))
(cl:defmethod wifi_name-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:wifi_name-val is deprecated.  Use ainstein_radar_drivers-msg:wifi_name instead.")
  (wifi_name m))

(cl:ensure-generic-function 'wifi_pwd-val :lambda-list '(m))
(cl:defmethod wifi_pwd-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:wifi_pwd-val is deprecated.  Use ainstein_radar_drivers-msg:wifi_pwd instead.")
  (wifi_pwd m))

(cl:ensure-generic-function 'con_wifi_name-val :lambda-list '(m))
(cl:defmethod con_wifi_name-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:con_wifi_name-val is deprecated.  Use ainstein_radar_drivers-msg:con_wifi_name instead.")
  (con_wifi_name m))

(cl:ensure-generic-function 'con_wifi_pwd-val :lambda-list '(m))
(cl:defmethod con_wifi_pwd-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:con_wifi_pwd-val is deprecated.  Use ainstein_radar_drivers-msg:con_wifi_pwd instead.")
  (con_wifi_pwd m))

(cl:ensure-generic-function 'dev_id-val :lambda-list '(m))
(cl:defmethod dev_id-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:dev_id-val is deprecated.  Use ainstein_radar_drivers-msg:dev_id instead.")
  (dev_id m))

(cl:ensure-generic-function 'wifi_mode-val :lambda-list '(m))
(cl:defmethod wifi_mode-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:wifi_mode-val is deprecated.  Use ainstein_radar_drivers-msg:wifi_mode instead.")
  (wifi_mode m))

(cl:ensure-generic-function 'sys_mode-val :lambda-list '(m))
(cl:defmethod sys_mode-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:sys_mode-val is deprecated.  Use ainstein_radar_drivers-msg:sys_mode instead.")
  (sys_mode m))

(cl:ensure-generic-function 'radio_switch-val :lambda-list '(m))
(cl:defmethod radio_switch-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:radio_switch-val is deprecated.  Use ainstein_radar_drivers-msg:radio_switch instead.")
  (radio_switch m))

(cl:ensure-generic-function 'radio_time-val :lambda-list '(m))
(cl:defmethod radio_time-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:radio_time-val is deprecated.  Use ainstein_radar_drivers-msg:radio_time instead.")
  (radio_time m))

(cl:ensure-generic-function 'radar_conf-val :lambda-list '(m))
(cl:defmethod radar_conf-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:radar_conf-val is deprecated.  Use ainstein_radar_drivers-msg:radar_conf instead.")
  (radar_conf m))

(cl:ensure-generic-function 'radar_config_len-val :lambda-list '(m))
(cl:defmethod radar_config_len-val ((m <WayvAirConfiguration>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:radar_config_len-val is deprecated.  Use ainstein_radar_drivers-msg:radar_config_len instead.")
  (radar_config_len m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WayvAirConfiguration>) ostream)
  "Serializes a message object of type '<WayvAirConfiguration>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'fw_ver))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'fw_ver))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sbl_ver))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sbl_ver))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id_485)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id_485)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'baud_485)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'baud_485)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'baud_485)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'baud_485)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'server_ip))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'server_ip))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'server_port)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'server_port)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'wifi_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'wifi_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'wifi_pwd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'wifi_pwd))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'con_wifi_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'con_wifi_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'con_wifi_pwd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'con_wifi_pwd))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'dev_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'dev_id))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wifi_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wifi_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sys_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sys_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radio_switch)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'radio_switch)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radio_time)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'radio_time)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'radar_conf))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'radar_conf))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_config_len)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'radar_config_len)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WayvAirConfiguration>) istream)
  "Deserializes a message object of type '<WayvAirConfiguration>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fw_ver) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'fw_ver) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sbl_ver) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sbl_ver) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id_485)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id_485)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'baud_485)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'baud_485)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'baud_485)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'baud_485)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'server_ip) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'server_ip) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'server_port)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'server_port)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wifi_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'wifi_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wifi_pwd) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'wifi_pwd) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'con_wifi_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'con_wifi_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'con_wifi_pwd) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'con_wifi_pwd) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dev_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'dev_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'wifi_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'wifi_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sys_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sys_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radio_switch)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'radio_switch)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radio_time)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'radio_time)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'radar_conf) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'radar_conf)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radar_config_len)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'radar_config_len)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WayvAirConfiguration>)))
  "Returns string type for a message object of type '<WayvAirConfiguration>"
  "ainstein_radar_drivers/WayvAirConfiguration")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WayvAirConfiguration)))
  "Returns string type for a message object of type 'WayvAirConfiguration"
  "ainstein_radar_drivers/WayvAirConfiguration")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WayvAirConfiguration>)))
  "Returns md5sum for a message object of type '<WayvAirConfiguration>"
  "697324bcda4e9dd0d2b06e834f223a42")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WayvAirConfiguration)))
  "Returns md5sum for a message object of type 'WayvAirConfiguration"
  "697324bcda4e9dd0d2b06e834f223a42")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WayvAirConfiguration>)))
  "Returns full string definition for message of type '<WayvAirConfiguration>"
  (cl:format cl:nil "# This message describes the Wayv Air radar configuration parameters.~%string fw_ver           # Firmware Version~%string sbl_ver          # Bootloader Version~%uint16 id_485           # 485 ID / Radar Comm ID~%uint32 baud_485         # Serial Baud Rate~%string server_ip        # Server IP address for Station Mode~%uint16 server_port      # Server Port for Station Mode~%string wifi_name        # WAYV (AP) broadcast Wifi Name~%string wifi_pwd         # WAYV (AP) Broadcast Wifi Password~%string con_wifi_name    # Station Mode Wifi Name~%string con_wifi_pwd     # Station Mode Wifi Password~%string dev_id           # Device Serial ID~%uint16 wifi_mode        # AP mode (0) or Station mode(1)~%uint16 sys_mode         # WAYV Operating Mode - Normal(0) - TLV(2) - TLV_Wifi(4)~%uint16 radio_switch     # Radio Inactive (0) - Radio Inactive (1)~%uint16 radio_time       #~%string[] radar_conf       # Radar Configuration String~%uint16 radar_config_len # Number of Radar Config Entries~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WayvAirConfiguration)))
  "Returns full string definition for message of type 'WayvAirConfiguration"
  (cl:format cl:nil "# This message describes the Wayv Air radar configuration parameters.~%string fw_ver           # Firmware Version~%string sbl_ver          # Bootloader Version~%uint16 id_485           # 485 ID / Radar Comm ID~%uint32 baud_485         # Serial Baud Rate~%string server_ip        # Server IP address for Station Mode~%uint16 server_port      # Server Port for Station Mode~%string wifi_name        # WAYV (AP) broadcast Wifi Name~%string wifi_pwd         # WAYV (AP) Broadcast Wifi Password~%string con_wifi_name    # Station Mode Wifi Name~%string con_wifi_pwd     # Station Mode Wifi Password~%string dev_id           # Device Serial ID~%uint16 wifi_mode        # AP mode (0) or Station mode(1)~%uint16 sys_mode         # WAYV Operating Mode - Normal(0) - TLV(2) - TLV_Wifi(4)~%uint16 radio_switch     # Radio Inactive (0) - Radio Inactive (1)~%uint16 radio_time       #~%string[] radar_conf       # Radar Configuration String~%uint16 radar_config_len # Number of Radar Config Entries~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WayvAirConfiguration>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'fw_ver))
     4 (cl:length (cl:slot-value msg 'sbl_ver))
     2
     4
     4 (cl:length (cl:slot-value msg 'server_ip))
     2
     4 (cl:length (cl:slot-value msg 'wifi_name))
     4 (cl:length (cl:slot-value msg 'wifi_pwd))
     4 (cl:length (cl:slot-value msg 'con_wifi_name))
     4 (cl:length (cl:slot-value msg 'con_wifi_pwd))
     4 (cl:length (cl:slot-value msg 'dev_id))
     2
     2
     2
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'radar_conf) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WayvAirConfiguration>))
  "Converts a ROS message object to a list"
  (cl:list 'WayvAirConfiguration
    (cl:cons ':fw_ver (fw_ver msg))
    (cl:cons ':sbl_ver (sbl_ver msg))
    (cl:cons ':id_485 (id_485 msg))
    (cl:cons ':baud_485 (baud_485 msg))
    (cl:cons ':server_ip (server_ip msg))
    (cl:cons ':server_port (server_port msg))
    (cl:cons ':wifi_name (wifi_name msg))
    (cl:cons ':wifi_pwd (wifi_pwd msg))
    (cl:cons ':con_wifi_name (con_wifi_name msg))
    (cl:cons ':con_wifi_pwd (con_wifi_pwd msg))
    (cl:cons ':dev_id (dev_id msg))
    (cl:cons ':wifi_mode (wifi_mode msg))
    (cl:cons ':sys_mode (sys_mode msg))
    (cl:cons ':radio_switch (radio_switch msg))
    (cl:cons ':radio_time (radio_time msg))
    (cl:cons ':radar_conf (radar_conf msg))
    (cl:cons ':radar_config_len (radar_config_len msg))
))
