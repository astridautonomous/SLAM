; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_drivers-msg)


;//! \htmlinclude O79NetworkParams.msg.html

(cl:defclass <O79NetworkParams> (roslisp-msg-protocol:ros-message)
  ((ip
    :reader ip
    :initarg :ip
    :type cl:string
    :initform "")
   (netmask
    :reader netmask
    :initarg :netmask
    :type cl:string
    :initform "")
   (gateway
    :reader gateway
    :initarg :gateway
    :type cl:string
    :initform "")
   (host_ip
    :reader host_ip
    :initarg :host_ip
    :type cl:string
    :initform "")
   (host_port
    :reader host_port
    :initarg :host_port
    :type cl:fixnum
    :initform 0))
)

(cl:defclass O79NetworkParams (<O79NetworkParams>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <O79NetworkParams>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'O79NetworkParams)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_drivers-msg:<O79NetworkParams> is deprecated: use ainstein_radar_drivers-msg:O79NetworkParams instead.")))

(cl:ensure-generic-function 'ip-val :lambda-list '(m))
(cl:defmethod ip-val ((m <O79NetworkParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:ip-val is deprecated.  Use ainstein_radar_drivers-msg:ip instead.")
  (ip m))

(cl:ensure-generic-function 'netmask-val :lambda-list '(m))
(cl:defmethod netmask-val ((m <O79NetworkParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:netmask-val is deprecated.  Use ainstein_radar_drivers-msg:netmask instead.")
  (netmask m))

(cl:ensure-generic-function 'gateway-val :lambda-list '(m))
(cl:defmethod gateway-val ((m <O79NetworkParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:gateway-val is deprecated.  Use ainstein_radar_drivers-msg:gateway instead.")
  (gateway m))

(cl:ensure-generic-function 'host_ip-val :lambda-list '(m))
(cl:defmethod host_ip-val ((m <O79NetworkParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:host_ip-val is deprecated.  Use ainstein_radar_drivers-msg:host_ip instead.")
  (host_ip m))

(cl:ensure-generic-function 'host_port-val :lambda-list '(m))
(cl:defmethod host_port-val ((m <O79NetworkParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:host_port-val is deprecated.  Use ainstein_radar_drivers-msg:host_port instead.")
  (host_port m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <O79NetworkParams>) ostream)
  "Serializes a message object of type '<O79NetworkParams>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'ip))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'ip))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'netmask))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'netmask))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'gateway))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'gateway))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'host_ip))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'host_ip))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'host_port)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'host_port)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <O79NetworkParams>) istream)
  "Deserializes a message object of type '<O79NetworkParams>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ip) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'ip) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'netmask) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'netmask) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gateway) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'gateway) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'host_ip) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'host_ip) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'host_port)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'host_port)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<O79NetworkParams>)))
  "Returns string type for a message object of type '<O79NetworkParams>"
  "ainstein_radar_drivers/O79NetworkParams")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'O79NetworkParams)))
  "Returns string type for a message object of type 'O79NetworkParams"
  "ainstein_radar_drivers/O79NetworkParams")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<O79NetworkParams>)))
  "Returns md5sum for a message object of type '<O79NetworkParams>"
  "a69287f037293465b761a7fa4a733b65")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'O79NetworkParams)))
  "Returns md5sum for a message object of type 'O79NetworkParams"
  "a69287f037293465b761a7fa4a733b65")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<O79NetworkParams>)))
  "Returns full string definition for message of type '<O79NetworkParams>"
  (cl:format cl:nil "# This message describes the O-79 imaging radar network parameters.~%~%string ip           # Radar IP address~%string netmask      # Radar network mask~%string gateway      # Radar network gateway~%string host_ip      # Host PC IP address~%uint16 host_port    # Host PC port~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'O79NetworkParams)))
  "Returns full string definition for message of type 'O79NetworkParams"
  (cl:format cl:nil "# This message describes the O-79 imaging radar network parameters.~%~%string ip           # Radar IP address~%string netmask      # Radar network mask~%string gateway      # Radar network gateway~%string host_ip      # Host PC IP address~%uint16 host_port    # Host PC port~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <O79NetworkParams>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'ip))
     4 (cl:length (cl:slot-value msg 'netmask))
     4 (cl:length (cl:slot-value msg 'gateway))
     4 (cl:length (cl:slot-value msg 'host_ip))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <O79NetworkParams>))
  "Converts a ROS message object to a list"
  (cl:list 'O79NetworkParams
    (cl:cons ':ip (ip msg))
    (cl:cons ':netmask (netmask msg))
    (cl:cons ':gateway (gateway msg))
    (cl:cons ':host_ip (host_ip msg))
    (cl:cons ':host_port (host_port msg))
))
