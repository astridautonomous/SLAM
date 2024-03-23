; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_msgs-msg)


;//! \htmlinclude RadarTargetStamped.msg.html

(cl:defclass <RadarTargetStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (target
    :reader target
    :initarg :target
    :type ainstein_radar_msgs-msg:RadarTarget
    :initform (cl:make-instance 'ainstein_radar_msgs-msg:RadarTarget)))
)

(cl:defclass RadarTargetStamped (<RadarTargetStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarTargetStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarTargetStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_msgs-msg:<RadarTargetStamped> is deprecated: use ainstein_radar_msgs-msg:RadarTargetStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RadarTargetStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:header-val is deprecated.  Use ainstein_radar_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <RadarTargetStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:target-val is deprecated.  Use ainstein_radar_msgs-msg:target instead.")
  (target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarTargetStamped>) ostream)
  "Serializes a message object of type '<RadarTargetStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'target) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarTargetStamped>) istream)
  "Deserializes a message object of type '<RadarTargetStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'target) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarTargetStamped>)))
  "Returns string type for a message object of type '<RadarTargetStamped>"
  "ainstein_radar_msgs/RadarTargetStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarTargetStamped)))
  "Returns string type for a message object of type 'RadarTargetStamped"
  "ainstein_radar_msgs/RadarTargetStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarTargetStamped>)))
  "Returns md5sum for a message object of type '<RadarTargetStamped>"
  "b1fbe9d124fcb7889ff4a0fa4df5665a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarTargetStamped)))
  "Returns md5sum for a message object of type 'RadarTargetStamped"
  "b1fbe9d124fcb7889ff4a0fa4df5665a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarTargetStamped>)))
  "Returns full string definition for message of type '<RadarTargetStamped>"
  (cl:format cl:nil "# This message describes a target (detection) from a RADAR sensor with a timestamp.~%~%std_msgs/Header header~%~%RadarTarget target~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ainstein_radar_msgs/RadarTarget~%# This message describes a target (detection) from a RADAR sensor.~%~%uint16 target_id    # ID of the target, as set by the sensor~%float64 snr         # Signal-to-noise ratio~%float64 range       # Distance from sensor to target along sensor x-axis~%float64 speed       # Speed (range rate of change) of target along sensor x-axis~%float64 azimuth     # Angle of target relative to sensor within x-y plane~%float64 elevation   # Angle of target relative to sensor within y-z plane~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarTargetStamped)))
  "Returns full string definition for message of type 'RadarTargetStamped"
  (cl:format cl:nil "# This message describes a target (detection) from a RADAR sensor with a timestamp.~%~%std_msgs/Header header~%~%RadarTarget target~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ainstein_radar_msgs/RadarTarget~%# This message describes a target (detection) from a RADAR sensor.~%~%uint16 target_id    # ID of the target, as set by the sensor~%float64 snr         # Signal-to-noise ratio~%float64 range       # Distance from sensor to target along sensor x-axis~%float64 speed       # Speed (range rate of change) of target along sensor x-axis~%float64 azimuth     # Angle of target relative to sensor within x-y plane~%float64 elevation   # Angle of target relative to sensor within y-z plane~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarTargetStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'target))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarTargetStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarTargetStamped
    (cl:cons ':header (header msg))
    (cl:cons ':target (target msg))
))
