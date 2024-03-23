; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_msgs-msg)


;//! \htmlinclude RadarTargetArray.msg.html

(cl:defclass <RadarTargetArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (targets
    :reader targets
    :initarg :targets
    :type (cl:vector ainstein_radar_msgs-msg:RadarTarget)
   :initform (cl:make-array 0 :element-type 'ainstein_radar_msgs-msg:RadarTarget :initial-element (cl:make-instance 'ainstein_radar_msgs-msg:RadarTarget))))
)

(cl:defclass RadarTargetArray (<RadarTargetArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarTargetArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarTargetArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_msgs-msg:<RadarTargetArray> is deprecated: use ainstein_radar_msgs-msg:RadarTargetArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RadarTargetArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:header-val is deprecated.  Use ainstein_radar_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'targets-val :lambda-list '(m))
(cl:defmethod targets-val ((m <RadarTargetArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:targets-val is deprecated.  Use ainstein_radar_msgs-msg:targets instead.")
  (targets m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarTargetArray>) ostream)
  "Serializes a message object of type '<RadarTargetArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'targets))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'targets))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarTargetArray>) istream)
  "Deserializes a message object of type '<RadarTargetArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'targets) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'targets)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ainstein_radar_msgs-msg:RadarTarget))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarTargetArray>)))
  "Returns string type for a message object of type '<RadarTargetArray>"
  "ainstein_radar_msgs/RadarTargetArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarTargetArray)))
  "Returns string type for a message object of type 'RadarTargetArray"
  "ainstein_radar_msgs/RadarTargetArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarTargetArray>)))
  "Returns md5sum for a message object of type '<RadarTargetArray>"
  "e9ff18a480c0ec265f58b88134aeb493")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarTargetArray)))
  "Returns md5sum for a message object of type 'RadarTargetArray"
  "e9ff18a480c0ec265f58b88134aeb493")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarTargetArray>)))
  "Returns full string definition for message of type '<RadarTargetArray>"
  (cl:format cl:nil "# This message describes an array of targets with a timestamp.~%~%std_msgs/Header header~%~%RadarTarget[] targets~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ainstein_radar_msgs/RadarTarget~%# This message describes a target (detection) from a RADAR sensor.~%~%uint16 target_id    # ID of the target, as set by the sensor~%float64 snr         # Signal-to-noise ratio~%float64 range       # Distance from sensor to target along sensor x-axis~%float64 speed       # Speed (range rate of change) of target along sensor x-axis~%float64 azimuth     # Angle of target relative to sensor within x-y plane~%float64 elevation   # Angle of target relative to sensor within y-z plane~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarTargetArray)))
  "Returns full string definition for message of type 'RadarTargetArray"
  (cl:format cl:nil "# This message describes an array of targets with a timestamp.~%~%std_msgs/Header header~%~%RadarTarget[] targets~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ainstein_radar_msgs/RadarTarget~%# This message describes a target (detection) from a RADAR sensor.~%~%uint16 target_id    # ID of the target, as set by the sensor~%float64 snr         # Signal-to-noise ratio~%float64 range       # Distance from sensor to target along sensor x-axis~%float64 speed       # Speed (range rate of change) of target along sensor x-axis~%float64 azimuth     # Angle of target relative to sensor within x-y plane~%float64 elevation   # Angle of target relative to sensor within y-z plane~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarTargetArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'targets) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarTargetArray>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarTargetArray
    (cl:cons ':header (header msg))
    (cl:cons ':targets (targets msg))
))
