; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_msgs-msg)


;//! \htmlinclude RadarInfo.msg.html

(cl:defclass <RadarInfo> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (update_rate
    :reader update_rate
    :initarg :update_rate
    :type cl:float
    :initform 0.0)
   (max_num_targets
    :reader max_num_targets
    :initarg :max_num_targets
    :type cl:fixnum
    :initform 0)
   (range_min
    :reader range_min
    :initarg :range_min
    :type cl:float
    :initform 0.0)
   (range_max
    :reader range_max
    :initarg :range_max
    :type cl:float
    :initform 0.0)
   (speed_min
    :reader speed_min
    :initarg :speed_min
    :type cl:float
    :initform 0.0)
   (speed_max
    :reader speed_max
    :initarg :speed_max
    :type cl:float
    :initform 0.0)
   (azimuth_min
    :reader azimuth_min
    :initarg :azimuth_min
    :type cl:float
    :initform 0.0)
   (azimuth_max
    :reader azimuth_max
    :initarg :azimuth_max
    :type cl:float
    :initform 0.0)
   (elevation_min
    :reader elevation_min
    :initarg :elevation_min
    :type cl:float
    :initform 0.0)
   (elevation_max
    :reader elevation_max
    :initarg :elevation_max
    :type cl:float
    :initform 0.0)
   (range_resolution
    :reader range_resolution
    :initarg :range_resolution
    :type cl:float
    :initform 0.0)
   (range_accuracy
    :reader range_accuracy
    :initarg :range_accuracy
    :type cl:float
    :initform 0.0)
   (speed_resolution
    :reader speed_resolution
    :initarg :speed_resolution
    :type cl:float
    :initform 0.0)
   (speed_accuracy
    :reader speed_accuracy
    :initarg :speed_accuracy
    :type cl:float
    :initform 0.0)
   (azimuth_resolution
    :reader azimuth_resolution
    :initarg :azimuth_resolution
    :type cl:float
    :initform 0.0)
   (azimuth_accuracy
    :reader azimuth_accuracy
    :initarg :azimuth_accuracy
    :type cl:float
    :initform 0.0)
   (elevation_resolution
    :reader elevation_resolution
    :initarg :elevation_resolution
    :type cl:float
    :initform 0.0)
   (elevation_accuracy
    :reader elevation_accuracy
    :initarg :elevation_accuracy
    :type cl:float
    :initform 0.0))
)

(cl:defclass RadarInfo (<RadarInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_msgs-msg:<RadarInfo> is deprecated: use ainstein_radar_msgs-msg:RadarInfo instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:header-val is deprecated.  Use ainstein_radar_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'update_rate-val :lambda-list '(m))
(cl:defmethod update_rate-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:update_rate-val is deprecated.  Use ainstein_radar_msgs-msg:update_rate instead.")
  (update_rate m))

(cl:ensure-generic-function 'max_num_targets-val :lambda-list '(m))
(cl:defmethod max_num_targets-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:max_num_targets-val is deprecated.  Use ainstein_radar_msgs-msg:max_num_targets instead.")
  (max_num_targets m))

(cl:ensure-generic-function 'range_min-val :lambda-list '(m))
(cl:defmethod range_min-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:range_min-val is deprecated.  Use ainstein_radar_msgs-msg:range_min instead.")
  (range_min m))

(cl:ensure-generic-function 'range_max-val :lambda-list '(m))
(cl:defmethod range_max-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:range_max-val is deprecated.  Use ainstein_radar_msgs-msg:range_max instead.")
  (range_max m))

(cl:ensure-generic-function 'speed_min-val :lambda-list '(m))
(cl:defmethod speed_min-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:speed_min-val is deprecated.  Use ainstein_radar_msgs-msg:speed_min instead.")
  (speed_min m))

(cl:ensure-generic-function 'speed_max-val :lambda-list '(m))
(cl:defmethod speed_max-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:speed_max-val is deprecated.  Use ainstein_radar_msgs-msg:speed_max instead.")
  (speed_max m))

(cl:ensure-generic-function 'azimuth_min-val :lambda-list '(m))
(cl:defmethod azimuth_min-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:azimuth_min-val is deprecated.  Use ainstein_radar_msgs-msg:azimuth_min instead.")
  (azimuth_min m))

(cl:ensure-generic-function 'azimuth_max-val :lambda-list '(m))
(cl:defmethod azimuth_max-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:azimuth_max-val is deprecated.  Use ainstein_radar_msgs-msg:azimuth_max instead.")
  (azimuth_max m))

(cl:ensure-generic-function 'elevation_min-val :lambda-list '(m))
(cl:defmethod elevation_min-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:elevation_min-val is deprecated.  Use ainstein_radar_msgs-msg:elevation_min instead.")
  (elevation_min m))

(cl:ensure-generic-function 'elevation_max-val :lambda-list '(m))
(cl:defmethod elevation_max-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:elevation_max-val is deprecated.  Use ainstein_radar_msgs-msg:elevation_max instead.")
  (elevation_max m))

(cl:ensure-generic-function 'range_resolution-val :lambda-list '(m))
(cl:defmethod range_resolution-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:range_resolution-val is deprecated.  Use ainstein_radar_msgs-msg:range_resolution instead.")
  (range_resolution m))

(cl:ensure-generic-function 'range_accuracy-val :lambda-list '(m))
(cl:defmethod range_accuracy-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:range_accuracy-val is deprecated.  Use ainstein_radar_msgs-msg:range_accuracy instead.")
  (range_accuracy m))

(cl:ensure-generic-function 'speed_resolution-val :lambda-list '(m))
(cl:defmethod speed_resolution-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:speed_resolution-val is deprecated.  Use ainstein_radar_msgs-msg:speed_resolution instead.")
  (speed_resolution m))

(cl:ensure-generic-function 'speed_accuracy-val :lambda-list '(m))
(cl:defmethod speed_accuracy-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:speed_accuracy-val is deprecated.  Use ainstein_radar_msgs-msg:speed_accuracy instead.")
  (speed_accuracy m))

(cl:ensure-generic-function 'azimuth_resolution-val :lambda-list '(m))
(cl:defmethod azimuth_resolution-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:azimuth_resolution-val is deprecated.  Use ainstein_radar_msgs-msg:azimuth_resolution instead.")
  (azimuth_resolution m))

(cl:ensure-generic-function 'azimuth_accuracy-val :lambda-list '(m))
(cl:defmethod azimuth_accuracy-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:azimuth_accuracy-val is deprecated.  Use ainstein_radar_msgs-msg:azimuth_accuracy instead.")
  (azimuth_accuracy m))

(cl:ensure-generic-function 'elevation_resolution-val :lambda-list '(m))
(cl:defmethod elevation_resolution-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:elevation_resolution-val is deprecated.  Use ainstein_radar_msgs-msg:elevation_resolution instead.")
  (elevation_resolution m))

(cl:ensure-generic-function 'elevation_accuracy-val :lambda-list '(m))
(cl:defmethod elevation_accuracy-val ((m <RadarInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:elevation_accuracy-val is deprecated.  Use ainstein_radar_msgs-msg:elevation_accuracy instead.")
  (elevation_accuracy m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarInfo>) ostream)
  "Serializes a message object of type '<RadarInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'update_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_num_targets)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_num_targets)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'range_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'range_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'speed_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'speed_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'azimuth_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'azimuth_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'elevation_min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'elevation_max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'range_resolution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'range_accuracy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'speed_resolution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'speed_accuracy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'azimuth_resolution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'azimuth_accuracy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'elevation_resolution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'elevation_accuracy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarInfo>) istream)
  "Deserializes a message object of type '<RadarInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'update_rate) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_num_targets)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_num_targets)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range_min) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range_max) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed_min) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed_max) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'azimuth_min) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'azimuth_max) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'elevation_min) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'elevation_max) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range_resolution) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range_accuracy) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed_resolution) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed_accuracy) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'azimuth_resolution) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'azimuth_accuracy) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'elevation_resolution) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'elevation_accuracy) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarInfo>)))
  "Returns string type for a message object of type '<RadarInfo>"
  "ainstein_radar_msgs/RadarInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarInfo)))
  "Returns string type for a message object of type 'RadarInfo"
  "ainstein_radar_msgs/RadarInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarInfo>)))
  "Returns md5sum for a message object of type '<RadarInfo>"
  "517f7ed5e498f66b6af3caaa2c6f2059")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarInfo)))
  "Returns md5sum for a message object of type 'RadarInfo"
  "517f7ed5e498f66b6af3caaa2c6f2059")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarInfo>)))
  "Returns full string definition for message of type '<RadarInfo>"
  (cl:format cl:nil "# This message defines meta information for a radar sensor. It should~%# be in a radar namespace on topic \"radar_info\" and accompanied by up~%# to three radar topics named:~%#~%#   targets/raw      - raw (untracked) radar detections~%#   targets/tracked  - tracked radar detections~%#   alarms           - alarms based on detections, eg BSD~%#~%# In general, all Ainstein radars output raw detections and may also~%# output tracked detections if trackign algorithms are implemented in~%# firmware. Tracking from raw data is also available in ROS; see the~%# ainstein_radar_filters package for more information. Most radars do~%# not output alarms as this is specific to the automotive use case,~%# however this message type is retained for the time being for backward~%# compatibility.~%~%#######################################################################~%#                     Data acquisition info                           #~%#######################################################################~%~%# Time of data acquisition, radar coordinate frame ID~%Header header    # Header timestamp should be acquisition time of data~%                 # Header frame_id should be radar sensing frame~%                 # origin of frame should be center of sensor~%                 # +x should point radially outwards from the radar~%                 # +y should point to complete a right-handed frame~%                 # +z should point upwards~%~%#######################################################################~%#                    General sensor properties                        #~%#######################################################################~%~%# The nominal update rate of the sensor reported in Hz.~%float64 update_rate~%~%# The maximum number of detections (targets) the sensors can report.~%uint16 max_num_targets~%~%#######################################################################~%#                    Physical sensing limits                          #~%#######################################################################~%# These are limits imposed by the antenna hardware and/or cutoffs set #~%# in the detection processing firmware. They come from sensor data    #~%# sheets and must be updated with each hardware revision as necessary.#~%#######################################################################~%~%# The minimum and maximum range, in meters, of detections (targets)~%# reported by the sensor.~%float64 range_min~%float64 range_max~%~%# The minimum and maximum speed, in meters per second, of detections~%# (targets) reported by the sensor.~%float64 speed_min~%float64 speed_max~%~%# The minimum and maximum azimuth angle, in degrees.~%float64 azimuth_min~%float64 azimuth_max~%~%# The minimum and maximum azimuth angle, in degrees.~%float64 elevation_min~%float64 elevation_max~%~%#######################################################################~%#                    Physical sensing precision                       #~%#######################################################################~%# These are also imposed by the antenna hardware and/or set in the    #~%# detection processing firmware. They also come from sensor data      #~%# sheets and must be updated with each hardware revision as necessary.#~%#######################################################################~%~%# Range resolution, in meters. The resolution is defined as the minimum~%# distance between two objects which results in distinct detections.~%float64 range_resolution~%~%# Range accuracy, in meters. The accuracy is defined as the precision~%# with which range of a detection is reported.~%float64 range_accuracy~%~%# Speed resolution, in meters per second. The resolution is defined as~%# the minimum speed difference between two objects which results in~%# distinct detections.~%float64 speed_resolution~%~%# Speed accuracy, in meters per second. The accuracy is defined as the~%# precision with which speed of a detection is reported.~%float64 speed_accuracy~%~%# Azimuth angle resolution, in degrees. The resolution is defined as~%# the minimum azimuth angle between two objects which results in~%# distinct detections.~%float64 azimuth_resolution~%~%# Azimuth angle accuracy, in degrees. The accuracy is defined as the~%# precision with which the azimuth angle of a detection is reported.~%float64 azimuth_accuracy~%~%# Elevation angle resolution, in degrees. The resolution is defined as~%# the minimum elevation angle between two objects which results in~%# distinct detections.~%float64 elevation_resolution~%~%# Elevation angle accuracy, in degrees. The accuracy is defined as the~%# precision with which the elevation angle of a detection is reported.~%float64 elevation_accuracy~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarInfo)))
  "Returns full string definition for message of type 'RadarInfo"
  (cl:format cl:nil "# This message defines meta information for a radar sensor. It should~%# be in a radar namespace on topic \"radar_info\" and accompanied by up~%# to three radar topics named:~%#~%#   targets/raw      - raw (untracked) radar detections~%#   targets/tracked  - tracked radar detections~%#   alarms           - alarms based on detections, eg BSD~%#~%# In general, all Ainstein radars output raw detections and may also~%# output tracked detections if trackign algorithms are implemented in~%# firmware. Tracking from raw data is also available in ROS; see the~%# ainstein_radar_filters package for more information. Most radars do~%# not output alarms as this is specific to the automotive use case,~%# however this message type is retained for the time being for backward~%# compatibility.~%~%#######################################################################~%#                     Data acquisition info                           #~%#######################################################################~%~%# Time of data acquisition, radar coordinate frame ID~%Header header    # Header timestamp should be acquisition time of data~%                 # Header frame_id should be radar sensing frame~%                 # origin of frame should be center of sensor~%                 # +x should point radially outwards from the radar~%                 # +y should point to complete a right-handed frame~%                 # +z should point upwards~%~%#######################################################################~%#                    General sensor properties                        #~%#######################################################################~%~%# The nominal update rate of the sensor reported in Hz.~%float64 update_rate~%~%# The maximum number of detections (targets) the sensors can report.~%uint16 max_num_targets~%~%#######################################################################~%#                    Physical sensing limits                          #~%#######################################################################~%# These are limits imposed by the antenna hardware and/or cutoffs set #~%# in the detection processing firmware. They come from sensor data    #~%# sheets and must be updated with each hardware revision as necessary.#~%#######################################################################~%~%# The minimum and maximum range, in meters, of detections (targets)~%# reported by the sensor.~%float64 range_min~%float64 range_max~%~%# The minimum and maximum speed, in meters per second, of detections~%# (targets) reported by the sensor.~%float64 speed_min~%float64 speed_max~%~%# The minimum and maximum azimuth angle, in degrees.~%float64 azimuth_min~%float64 azimuth_max~%~%# The minimum and maximum azimuth angle, in degrees.~%float64 elevation_min~%float64 elevation_max~%~%#######################################################################~%#                    Physical sensing precision                       #~%#######################################################################~%# These are also imposed by the antenna hardware and/or set in the    #~%# detection processing firmware. They also come from sensor data      #~%# sheets and must be updated with each hardware revision as necessary.#~%#######################################################################~%~%# Range resolution, in meters. The resolution is defined as the minimum~%# distance between two objects which results in distinct detections.~%float64 range_resolution~%~%# Range accuracy, in meters. The accuracy is defined as the precision~%# with which range of a detection is reported.~%float64 range_accuracy~%~%# Speed resolution, in meters per second. The resolution is defined as~%# the minimum speed difference between two objects which results in~%# distinct detections.~%float64 speed_resolution~%~%# Speed accuracy, in meters per second. The accuracy is defined as the~%# precision with which speed of a detection is reported.~%float64 speed_accuracy~%~%# Azimuth angle resolution, in degrees. The resolution is defined as~%# the minimum azimuth angle between two objects which results in~%# distinct detections.~%float64 azimuth_resolution~%~%# Azimuth angle accuracy, in degrees. The accuracy is defined as the~%# precision with which the azimuth angle of a detection is reported.~%float64 azimuth_accuracy~%~%# Elevation angle resolution, in degrees. The resolution is defined as~%# the minimum elevation angle between two objects which results in~%# distinct detections.~%float64 elevation_resolution~%~%# Elevation angle accuracy, in degrees. The accuracy is defined as the~%# precision with which the elevation angle of a detection is reported.~%float64 elevation_accuracy~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     2
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarInfo
    (cl:cons ':header (header msg))
    (cl:cons ':update_rate (update_rate msg))
    (cl:cons ':max_num_targets (max_num_targets msg))
    (cl:cons ':range_min (range_min msg))
    (cl:cons ':range_max (range_max msg))
    (cl:cons ':speed_min (speed_min msg))
    (cl:cons ':speed_max (speed_max msg))
    (cl:cons ':azimuth_min (azimuth_min msg))
    (cl:cons ':azimuth_max (azimuth_max msg))
    (cl:cons ':elevation_min (elevation_min msg))
    (cl:cons ':elevation_max (elevation_max msg))
    (cl:cons ':range_resolution (range_resolution msg))
    (cl:cons ':range_accuracy (range_accuracy msg))
    (cl:cons ':speed_resolution (speed_resolution msg))
    (cl:cons ':speed_accuracy (speed_accuracy msg))
    (cl:cons ':azimuth_resolution (azimuth_resolution msg))
    (cl:cons ':azimuth_accuracy (azimuth_accuracy msg))
    (cl:cons ':elevation_resolution (elevation_resolution msg))
    (cl:cons ':elevation_accuracy (elevation_accuracy msg))
))
