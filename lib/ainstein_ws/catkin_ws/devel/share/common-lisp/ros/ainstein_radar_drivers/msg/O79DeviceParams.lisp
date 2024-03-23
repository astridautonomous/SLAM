; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_drivers-msg)


;//! \htmlinclude O79DeviceParams.msg.html

(cl:defclass <O79DeviceParams> (roslisp-msg-protocol:ros-message)
  ((fw_version
    :reader fw_version
    :initarg :fw_version
    :type cl:string
    :initform "")
   (can_id
    :reader can_id
    :initarg :can_id
    :type cl:string
    :initform "")
   (serial_no
    :reader serial_no
    :initarg :serial_no
    :type cl:string
    :initform "")
   (mac_address
    :reader mac_address
    :initarg :mac_address
    :type cl:string
    :initform ""))
)

(cl:defclass O79DeviceParams (<O79DeviceParams>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <O79DeviceParams>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'O79DeviceParams)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_drivers-msg:<O79DeviceParams> is deprecated: use ainstein_radar_drivers-msg:O79DeviceParams instead.")))

(cl:ensure-generic-function 'fw_version-val :lambda-list '(m))
(cl:defmethod fw_version-val ((m <O79DeviceParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:fw_version-val is deprecated.  Use ainstein_radar_drivers-msg:fw_version instead.")
  (fw_version m))

(cl:ensure-generic-function 'can_id-val :lambda-list '(m))
(cl:defmethod can_id-val ((m <O79DeviceParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:can_id-val is deprecated.  Use ainstein_radar_drivers-msg:can_id instead.")
  (can_id m))

(cl:ensure-generic-function 'serial_no-val :lambda-list '(m))
(cl:defmethod serial_no-val ((m <O79DeviceParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:serial_no-val is deprecated.  Use ainstein_radar_drivers-msg:serial_no instead.")
  (serial_no m))

(cl:ensure-generic-function 'mac_address-val :lambda-list '(m))
(cl:defmethod mac_address-val ((m <O79DeviceParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:mac_address-val is deprecated.  Use ainstein_radar_drivers-msg:mac_address instead.")
  (mac_address m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <O79DeviceParams>) ostream)
  "Serializes a message object of type '<O79DeviceParams>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'fw_version))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'fw_version))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'can_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'can_id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'serial_no))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'serial_no))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mac_address))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mac_address))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <O79DeviceParams>) istream)
  "Deserializes a message object of type '<O79DeviceParams>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fw_version) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'fw_version) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'can_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'can_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'serial_no) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'serial_no) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mac_address) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mac_address) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<O79DeviceParams>)))
  "Returns string type for a message object of type '<O79DeviceParams>"
  "ainstein_radar_drivers/O79DeviceParams")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'O79DeviceParams)))
  "Returns string type for a message object of type 'O79DeviceParams"
  "ainstein_radar_drivers/O79DeviceParams")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<O79DeviceParams>)))
  "Returns md5sum for a message object of type '<O79DeviceParams>"
  "9486679d9acc068b9eb160f4d0978a74")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'O79DeviceParams)))
  "Returns md5sum for a message object of type 'O79DeviceParams"
  "9486679d9acc068b9eb160f4d0978a74")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<O79DeviceParams>)))
  "Returns full string definition for message of type '<O79DeviceParams>"
  (cl:format cl:nil "# This message describes the O-79 imaging radar device parameters.~%~%string fw_version     # Firmware version~%string can_id         # Radar CAN ID~%string serial_no      # Radar serial number~%string mac_address    # Radar MAC address~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'O79DeviceParams)))
  "Returns full string definition for message of type 'O79DeviceParams"
  (cl:format cl:nil "# This message describes the O-79 imaging radar device parameters.~%~%string fw_version     # Firmware version~%string can_id         # Radar CAN ID~%string serial_no      # Radar serial number~%string mac_address    # Radar MAC address~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <O79DeviceParams>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'fw_version))
     4 (cl:length (cl:slot-value msg 'can_id))
     4 (cl:length (cl:slot-value msg 'serial_no))
     4 (cl:length (cl:slot-value msg 'mac_address))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <O79DeviceParams>))
  "Converts a ROS message object to a list"
  (cl:list 'O79DeviceParams
    (cl:cons ':fw_version (fw_version msg))
    (cl:cons ':can_id (can_id msg))
    (cl:cons ':serial_no (serial_no msg))
    (cl:cons ':mac_address (mac_address msg))
))
