; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_drivers-msg)


;//! \htmlinclude WayvAirStatus.msg.html

(cl:defclass <WayvAirStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (board_temp
    :reader board_temp
    :initarg :board_temp
    :type cl:float
    :initform 0.0)
   (tx_temps
    :reader tx_temps
    :initarg :tx_temps
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (pm_temp
    :reader pm_temp
    :initarg :pm_temp
    :type cl:float
    :initform 0.0)
   (voltage
    :reader voltage
    :initarg :voltage
    :type cl:float
    :initform 0.0)
   (power
    :reader power
    :initarg :power
    :type cl:float
    :initform 0.0))
)

(cl:defclass WayvAirStatus (<WayvAirStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WayvAirStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WayvAirStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_drivers-msg:<WayvAirStatus> is deprecated: use ainstein_radar_drivers-msg:WayvAirStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <WayvAirStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:header-val is deprecated.  Use ainstein_radar_drivers-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'board_temp-val :lambda-list '(m))
(cl:defmethod board_temp-val ((m <WayvAirStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:board_temp-val is deprecated.  Use ainstein_radar_drivers-msg:board_temp instead.")
  (board_temp m))

(cl:ensure-generic-function 'tx_temps-val :lambda-list '(m))
(cl:defmethod tx_temps-val ((m <WayvAirStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:tx_temps-val is deprecated.  Use ainstein_radar_drivers-msg:tx_temps instead.")
  (tx_temps m))

(cl:ensure-generic-function 'pm_temp-val :lambda-list '(m))
(cl:defmethod pm_temp-val ((m <WayvAirStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:pm_temp-val is deprecated.  Use ainstein_radar_drivers-msg:pm_temp instead.")
  (pm_temp m))

(cl:ensure-generic-function 'voltage-val :lambda-list '(m))
(cl:defmethod voltage-val ((m <WayvAirStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:voltage-val is deprecated.  Use ainstein_radar_drivers-msg:voltage instead.")
  (voltage m))

(cl:ensure-generic-function 'power-val :lambda-list '(m))
(cl:defmethod power-val ((m <WayvAirStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:power-val is deprecated.  Use ainstein_radar_drivers-msg:power instead.")
  (power m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WayvAirStatus>) ostream)
  "Serializes a message object of type '<WayvAirStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'board_temp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'tx_temps))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'tx_temps))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pm_temp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'power))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WayvAirStatus>) istream)
  "Deserializes a message object of type '<WayvAirStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'board_temp) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'tx_temps) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'tx_temps)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pm_temp) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'voltage) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'power) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WayvAirStatus>)))
  "Returns string type for a message object of type '<WayvAirStatus>"
  "ainstein_radar_drivers/WayvAirStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WayvAirStatus)))
  "Returns string type for a message object of type 'WayvAirStatus"
  "ainstein_radar_drivers/WayvAirStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WayvAirStatus>)))
  "Returns md5sum for a message object of type '<WayvAirStatus>"
  "fb442fd5018b46ec3791154842d3c373")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WayvAirStatus)))
  "Returns md5sum for a message object of type 'WayvAirStatus"
  "fb442fd5018b46ec3791154842d3c373")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WayvAirStatus>)))
  "Returns full string definition for message of type '<WayvAirStatus>"
  (cl:format cl:nil "# This message describes the Wayv Air radar device status.~%~%std_msgs/Header header~%float32 board_temp     # Board temperature, *C~%float32[] tx_temps     # Tx temperatures, *C~%float32 pm_temp        # PM temperature, *C~%float32 voltage        # Voltage, V~%float32 power          # Power, mW~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WayvAirStatus)))
  "Returns full string definition for message of type 'WayvAirStatus"
  (cl:format cl:nil "# This message describes the Wayv Air radar device status.~%~%std_msgs/Header header~%float32 board_temp     # Board temperature, *C~%float32[] tx_temps     # Tx temperatures, *C~%float32 pm_temp        # PM temperature, *C~%float32 voltage        # Voltage, V~%float32 power          # Power, mW~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WayvAirStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'tx_temps) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WayvAirStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'WayvAirStatus
    (cl:cons ':header (header msg))
    (cl:cons ':board_temp (board_temp msg))
    (cl:cons ':tx_temps (tx_temps msg))
    (cl:cons ':pm_temp (pm_temp msg))
    (cl:cons ':voltage (voltage msg))
    (cl:cons ':power (power msg))
))
