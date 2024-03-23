; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_msgs-msg)


;//! \htmlinclude RadarTarget.msg.html

(cl:defclass <RadarTarget> (roslisp-msg-protocol:ros-message)
  ((target_id
    :reader target_id
    :initarg :target_id
    :type cl:fixnum
    :initform 0)
   (snr
    :reader snr
    :initarg :snr
    :type cl:float
    :initform 0.0)
   (range
    :reader range
    :initarg :range
    :type cl:float
    :initform 0.0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (azimuth
    :reader azimuth
    :initarg :azimuth
    :type cl:float
    :initform 0.0)
   (elevation
    :reader elevation
    :initarg :elevation
    :type cl:float
    :initform 0.0))
)

(cl:defclass RadarTarget (<RadarTarget>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarTarget>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarTarget)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_msgs-msg:<RadarTarget> is deprecated: use ainstein_radar_msgs-msg:RadarTarget instead.")))

(cl:ensure-generic-function 'target_id-val :lambda-list '(m))
(cl:defmethod target_id-val ((m <RadarTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:target_id-val is deprecated.  Use ainstein_radar_msgs-msg:target_id instead.")
  (target_id m))

(cl:ensure-generic-function 'snr-val :lambda-list '(m))
(cl:defmethod snr-val ((m <RadarTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:snr-val is deprecated.  Use ainstein_radar_msgs-msg:snr instead.")
  (snr m))

(cl:ensure-generic-function 'range-val :lambda-list '(m))
(cl:defmethod range-val ((m <RadarTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:range-val is deprecated.  Use ainstein_radar_msgs-msg:range instead.")
  (range m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <RadarTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:speed-val is deprecated.  Use ainstein_radar_msgs-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'azimuth-val :lambda-list '(m))
(cl:defmethod azimuth-val ((m <RadarTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:azimuth-val is deprecated.  Use ainstein_radar_msgs-msg:azimuth instead.")
  (azimuth m))

(cl:ensure-generic-function 'elevation-val :lambda-list '(m))
(cl:defmethod elevation-val ((m <RadarTarget>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:elevation-val is deprecated.  Use ainstein_radar_msgs-msg:elevation instead.")
  (elevation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarTarget>) ostream)
  "Serializes a message object of type '<RadarTarget>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'target_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'target_id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'snr))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'azimuth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'elevation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarTarget>) istream)
  "Deserializes a message object of type '<RadarTarget>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'target_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'target_id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'snr) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'azimuth) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'elevation) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarTarget>)))
  "Returns string type for a message object of type '<RadarTarget>"
  "ainstein_radar_msgs/RadarTarget")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarTarget)))
  "Returns string type for a message object of type 'RadarTarget"
  "ainstein_radar_msgs/RadarTarget")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarTarget>)))
  "Returns md5sum for a message object of type '<RadarTarget>"
  "942d59f5ed2080c1747d5b79ce6dc1c0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarTarget)))
  "Returns md5sum for a message object of type 'RadarTarget"
  "942d59f5ed2080c1747d5b79ce6dc1c0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarTarget>)))
  "Returns full string definition for message of type '<RadarTarget>"
  (cl:format cl:nil "# This message describes a target (detection) from a RADAR sensor.~%~%uint16 target_id    # ID of the target, as set by the sensor~%float64 snr         # Signal-to-noise ratio~%float64 range       # Distance from sensor to target along sensor x-axis~%float64 speed       # Speed (range rate of change) of target along sensor x-axis~%float64 azimuth     # Angle of target relative to sensor within x-y plane~%float64 elevation   # Angle of target relative to sensor within y-z plane~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarTarget)))
  "Returns full string definition for message of type 'RadarTarget"
  (cl:format cl:nil "# This message describes a target (detection) from a RADAR sensor.~%~%uint16 target_id    # ID of the target, as set by the sensor~%float64 snr         # Signal-to-noise ratio~%float64 range       # Distance from sensor to target along sensor x-axis~%float64 speed       # Speed (range rate of change) of target along sensor x-axis~%float64 azimuth     # Angle of target relative to sensor within x-y plane~%float64 elevation   # Angle of target relative to sensor within y-z plane~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarTarget>))
  (cl:+ 0
     2
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarTarget>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarTarget
    (cl:cons ':target_id (target_id msg))
    (cl:cons ':snr (snr msg))
    (cl:cons ':range (range msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':azimuth (azimuth msg))
    (cl:cons ':elevation (elevation msg))
))
