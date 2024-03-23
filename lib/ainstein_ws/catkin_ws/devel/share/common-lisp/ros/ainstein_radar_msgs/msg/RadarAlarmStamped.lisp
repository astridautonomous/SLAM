; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_msgs-msg)


;//! \htmlinclude RadarAlarmStamped.msg.html

(cl:defclass <RadarAlarmStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (LCA_alarm
    :reader LCA_alarm
    :initarg :LCA_alarm
    :type cl:boolean
    :initform cl:nil)
   (CVW_alarm
    :reader CVW_alarm
    :initarg :CVW_alarm
    :type cl:boolean
    :initform cl:nil)
   (BSD_alarm
    :reader BSD_alarm
    :initarg :BSD_alarm
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RadarAlarmStamped (<RadarAlarmStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarAlarmStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarAlarmStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_msgs-msg:<RadarAlarmStamped> is deprecated: use ainstein_radar_msgs-msg:RadarAlarmStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RadarAlarmStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:header-val is deprecated.  Use ainstein_radar_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'LCA_alarm-val :lambda-list '(m))
(cl:defmethod LCA_alarm-val ((m <RadarAlarmStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:LCA_alarm-val is deprecated.  Use ainstein_radar_msgs-msg:LCA_alarm instead.")
  (LCA_alarm m))

(cl:ensure-generic-function 'CVW_alarm-val :lambda-list '(m))
(cl:defmethod CVW_alarm-val ((m <RadarAlarmStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:CVW_alarm-val is deprecated.  Use ainstein_radar_msgs-msg:CVW_alarm instead.")
  (CVW_alarm m))

(cl:ensure-generic-function 'BSD_alarm-val :lambda-list '(m))
(cl:defmethod BSD_alarm-val ((m <RadarAlarmStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:BSD_alarm-val is deprecated.  Use ainstein_radar_msgs-msg:BSD_alarm instead.")
  (BSD_alarm m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarAlarmStamped>) ostream)
  "Serializes a message object of type '<RadarAlarmStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'LCA_alarm) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'CVW_alarm) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'BSD_alarm) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarAlarmStamped>) istream)
  "Deserializes a message object of type '<RadarAlarmStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'LCA_alarm) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'CVW_alarm) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'BSD_alarm) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarAlarmStamped>)))
  "Returns string type for a message object of type '<RadarAlarmStamped>"
  "ainstein_radar_msgs/RadarAlarmStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarAlarmStamped)))
  "Returns string type for a message object of type 'RadarAlarmStamped"
  "ainstein_radar_msgs/RadarAlarmStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarAlarmStamped>)))
  "Returns md5sum for a message object of type '<RadarAlarmStamped>"
  "c8302a7df5f42db7b8e1cc9a4e4b392a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarAlarmStamped)))
  "Returns md5sum for a message object of type 'RadarAlarmStamped"
  "c8302a7df5f42db7b8e1cc9a4e4b392a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarAlarmStamped>)))
  "Returns full string definition for message of type '<RadarAlarmStamped>"
  (cl:format cl:nil "# This message describes alarms (eg BSD) from a RADAR sensor.~%~%std_msgs/Header header~%~%bool LCA_alarm    # Lane Change Assist alarm~%bool CVW_alarm    # Collision (Vehicle?) Warning alarm~%bool BSD_alarm    # Blind Spot Detection alarm~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarAlarmStamped)))
  "Returns full string definition for message of type 'RadarAlarmStamped"
  (cl:format cl:nil "# This message describes alarms (eg BSD) from a RADAR sensor.~%~%std_msgs/Header header~%~%bool LCA_alarm    # Lane Change Assist alarm~%bool CVW_alarm    # Collision (Vehicle?) Warning alarm~%bool BSD_alarm    # Blind Spot Detection alarm~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarAlarmStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarAlarmStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarAlarmStamped
    (cl:cons ':header (header msg))
    (cl:cons ':LCA_alarm (LCA_alarm msg))
    (cl:cons ':CVW_alarm (CVW_alarm msg))
    (cl:cons ':BSD_alarm (BSD_alarm msg))
))
