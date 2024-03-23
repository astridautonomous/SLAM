; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_drivers-msg)


;//! \htmlinclude O79TrackingParams.msg.html

(cl:defclass <O79TrackingParams> (roslisp-msg-protocol:ros-message)
  ((update_rate
    :reader update_rate
    :initarg :update_rate
    :type cl:float
    :initform 0.0)
   (min_time
    :reader min_time
    :initarg :min_time
    :type cl:float
    :initform 0.0)
   (timeout
    :reader timeout
    :initarg :timeout
    :type cl:float
    :initform 0.0)
   (confidence_level
    :reader confidence_level
    :initarg :confidence_level
    :type cl:float
    :initform 0.0)
   (proc_noise_speed
    :reader proc_noise_speed
    :initarg :proc_noise_speed
    :type cl:float
    :initform 0.0)
   (proc_noise_azim
    :reader proc_noise_azim
    :initarg :proc_noise_azim
    :type cl:float
    :initform 0.0)
   (proc_noise_elev
    :reader proc_noise_elev
    :initarg :proc_noise_elev
    :type cl:float
    :initform 0.0)
   (min_range
    :reader min_range
    :initarg :min_range
    :type cl:float
    :initform 0.0)
   (max_range
    :reader max_range
    :initarg :max_range
    :type cl:float
    :initform 0.0)
   (proc_noise_vel_x
    :reader proc_noise_vel_x
    :initarg :proc_noise_vel_x
    :type cl:float
    :initform 0.0)
   (proc_noise_vel_y
    :reader proc_noise_vel_y
    :initarg :proc_noise_vel_y
    :type cl:float
    :initform 0.0)
   (proc_noise_vel_z
    :reader proc_noise_vel_z
    :initarg :proc_noise_vel_z
    :type cl:float
    :initform 0.0)
   (meas_noise_speed
    :reader meas_noise_speed
    :initarg :meas_noise_speed
    :type cl:float
    :initform 0.0)
   (meas_noise_pos
    :reader meas_noise_pos
    :initarg :meas_noise_pos
    :type cl:float
    :initform 0.0)
   (filter_type
    :reader filter_type
    :initarg :filter_type
    :type cl:fixnum
    :initform 0))
)

(cl:defclass O79TrackingParams (<O79TrackingParams>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <O79TrackingParams>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'O79TrackingParams)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_drivers-msg:<O79TrackingParams> is deprecated: use ainstein_radar_drivers-msg:O79TrackingParams instead.")))

(cl:ensure-generic-function 'update_rate-val :lambda-list '(m))
(cl:defmethod update_rate-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:update_rate-val is deprecated.  Use ainstein_radar_drivers-msg:update_rate instead.")
  (update_rate m))

(cl:ensure-generic-function 'min_time-val :lambda-list '(m))
(cl:defmethod min_time-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:min_time-val is deprecated.  Use ainstein_radar_drivers-msg:min_time instead.")
  (min_time m))

(cl:ensure-generic-function 'timeout-val :lambda-list '(m))
(cl:defmethod timeout-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:timeout-val is deprecated.  Use ainstein_radar_drivers-msg:timeout instead.")
  (timeout m))

(cl:ensure-generic-function 'confidence_level-val :lambda-list '(m))
(cl:defmethod confidence_level-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:confidence_level-val is deprecated.  Use ainstein_radar_drivers-msg:confidence_level instead.")
  (confidence_level m))

(cl:ensure-generic-function 'proc_noise_speed-val :lambda-list '(m))
(cl:defmethod proc_noise_speed-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:proc_noise_speed-val is deprecated.  Use ainstein_radar_drivers-msg:proc_noise_speed instead.")
  (proc_noise_speed m))

(cl:ensure-generic-function 'proc_noise_azim-val :lambda-list '(m))
(cl:defmethod proc_noise_azim-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:proc_noise_azim-val is deprecated.  Use ainstein_radar_drivers-msg:proc_noise_azim instead.")
  (proc_noise_azim m))

(cl:ensure-generic-function 'proc_noise_elev-val :lambda-list '(m))
(cl:defmethod proc_noise_elev-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:proc_noise_elev-val is deprecated.  Use ainstein_radar_drivers-msg:proc_noise_elev instead.")
  (proc_noise_elev m))

(cl:ensure-generic-function 'min_range-val :lambda-list '(m))
(cl:defmethod min_range-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:min_range-val is deprecated.  Use ainstein_radar_drivers-msg:min_range instead.")
  (min_range m))

(cl:ensure-generic-function 'max_range-val :lambda-list '(m))
(cl:defmethod max_range-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:max_range-val is deprecated.  Use ainstein_radar_drivers-msg:max_range instead.")
  (max_range m))

(cl:ensure-generic-function 'proc_noise_vel_x-val :lambda-list '(m))
(cl:defmethod proc_noise_vel_x-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:proc_noise_vel_x-val is deprecated.  Use ainstein_radar_drivers-msg:proc_noise_vel_x instead.")
  (proc_noise_vel_x m))

(cl:ensure-generic-function 'proc_noise_vel_y-val :lambda-list '(m))
(cl:defmethod proc_noise_vel_y-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:proc_noise_vel_y-val is deprecated.  Use ainstein_radar_drivers-msg:proc_noise_vel_y instead.")
  (proc_noise_vel_y m))

(cl:ensure-generic-function 'proc_noise_vel_z-val :lambda-list '(m))
(cl:defmethod proc_noise_vel_z-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:proc_noise_vel_z-val is deprecated.  Use ainstein_radar_drivers-msg:proc_noise_vel_z instead.")
  (proc_noise_vel_z m))

(cl:ensure-generic-function 'meas_noise_speed-val :lambda-list '(m))
(cl:defmethod meas_noise_speed-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:meas_noise_speed-val is deprecated.  Use ainstein_radar_drivers-msg:meas_noise_speed instead.")
  (meas_noise_speed m))

(cl:ensure-generic-function 'meas_noise_pos-val :lambda-list '(m))
(cl:defmethod meas_noise_pos-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:meas_noise_pos-val is deprecated.  Use ainstein_radar_drivers-msg:meas_noise_pos instead.")
  (meas_noise_pos m))

(cl:ensure-generic-function 'filter_type-val :lambda-list '(m))
(cl:defmethod filter_type-val ((m <O79TrackingParams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_drivers-msg:filter_type-val is deprecated.  Use ainstein_radar_drivers-msg:filter_type instead.")
  (filter_type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <O79TrackingParams>) ostream)
  "Serializes a message object of type '<O79TrackingParams>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'update_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'min_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'timeout))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'confidence_level))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'proc_noise_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'proc_noise_azim))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'proc_noise_elev))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'min_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'proc_noise_vel_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'proc_noise_vel_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'proc_noise_vel_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'meas_noise_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'meas_noise_pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'filter_type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <O79TrackingParams>) istream)
  "Deserializes a message object of type '<O79TrackingParams>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'update_rate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'min_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timeout) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'confidence_level) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'proc_noise_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'proc_noise_azim) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'proc_noise_elev) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'min_range) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_range) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'proc_noise_vel_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'proc_noise_vel_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'proc_noise_vel_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'meas_noise_speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'meas_noise_pos) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filter_type) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<O79TrackingParams>)))
  "Returns string type for a message object of type '<O79TrackingParams>"
  "ainstein_radar_drivers/O79TrackingParams")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'O79TrackingParams)))
  "Returns string type for a message object of type 'O79TrackingParams"
  "ainstein_radar_drivers/O79TrackingParams")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<O79TrackingParams>)))
  "Returns md5sum for a message object of type '<O79TrackingParams>"
  "8794997c1f9ccf549a183253ff0fcb2e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'O79TrackingParams)))
  "Returns md5sum for a message object of type 'O79TrackingParams"
  "8794997c1f9ccf549a183253ff0fcb2e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<O79TrackingParams>)))
  "Returns full string definition for message of type '<O79TrackingParams>"
  (cl:format cl:nil "# This message describes the O-79 imaging radar tracking filter parameters.~%~%float32 update_rate~%float32 min_time~%float32 timeout~%float32 confidence_level~%float32 proc_noise_speed~%float32 proc_noise_azim~%float32 proc_noise_elev~%float32 min_range~%float32 max_range~%float32 proc_noise_vel_x~%float32 proc_noise_vel_y~%float32 proc_noise_vel_z~%float32 meas_noise_speed~%float32 meas_noise_pos~%int8 filter_type~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'O79TrackingParams)))
  "Returns full string definition for message of type 'O79TrackingParams"
  (cl:format cl:nil "# This message describes the O-79 imaging radar tracking filter parameters.~%~%float32 update_rate~%float32 min_time~%float32 timeout~%float32 confidence_level~%float32 proc_noise_speed~%float32 proc_noise_azim~%float32 proc_noise_elev~%float32 min_range~%float32 max_range~%float32 proc_noise_vel_x~%float32 proc_noise_vel_y~%float32 proc_noise_vel_z~%float32 meas_noise_speed~%float32 meas_noise_pos~%int8 filter_type~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <O79TrackingParams>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <O79TrackingParams>))
  "Converts a ROS message object to a list"
  (cl:list 'O79TrackingParams
    (cl:cons ':update_rate (update_rate msg))
    (cl:cons ':min_time (min_time msg))
    (cl:cons ':timeout (timeout msg))
    (cl:cons ':confidence_level (confidence_level msg))
    (cl:cons ':proc_noise_speed (proc_noise_speed msg))
    (cl:cons ':proc_noise_azim (proc_noise_azim msg))
    (cl:cons ':proc_noise_elev (proc_noise_elev msg))
    (cl:cons ':min_range (min_range msg))
    (cl:cons ':max_range (max_range msg))
    (cl:cons ':proc_noise_vel_x (proc_noise_vel_x msg))
    (cl:cons ':proc_noise_vel_y (proc_noise_vel_y msg))
    (cl:cons ':proc_noise_vel_z (proc_noise_vel_z msg))
    (cl:cons ':meas_noise_speed (meas_noise_speed msg))
    (cl:cons ':meas_noise_pos (meas_noise_pos msg))
    (cl:cons ':filter_type (filter_type msg))
))
