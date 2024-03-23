; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_msgs-msg)


;//! \htmlinclude RadarAlarmArray.msg.html

(cl:defclass <RadarAlarmArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (alarms
    :reader alarms
    :initarg :alarms
    :type (cl:vector ainstein_radar_msgs-msg:RadarAlarm)
   :initform (cl:make-array 0 :element-type 'ainstein_radar_msgs-msg:RadarAlarm :initial-element (cl:make-instance 'ainstein_radar_msgs-msg:RadarAlarm))))
)

(cl:defclass RadarAlarmArray (<RadarAlarmArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarAlarmArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarAlarmArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_msgs-msg:<RadarAlarmArray> is deprecated: use ainstein_radar_msgs-msg:RadarAlarmArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RadarAlarmArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:header-val is deprecated.  Use ainstein_radar_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'alarms-val :lambda-list '(m))
(cl:defmethod alarms-val ((m <RadarAlarmArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:alarms-val is deprecated.  Use ainstein_radar_msgs-msg:alarms instead.")
  (alarms m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarAlarmArray>) ostream)
  "Serializes a message object of type '<RadarAlarmArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'alarms))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'alarms))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarAlarmArray>) istream)
  "Deserializes a message object of type '<RadarAlarmArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'alarms) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'alarms)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ainstein_radar_msgs-msg:RadarAlarm))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarAlarmArray>)))
  "Returns string type for a message object of type '<RadarAlarmArray>"
  "ainstein_radar_msgs/RadarAlarmArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarAlarmArray)))
  "Returns string type for a message object of type 'RadarAlarmArray"
  "ainstein_radar_msgs/RadarAlarmArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarAlarmArray>)))
  "Returns md5sum for a message object of type '<RadarAlarmArray>"
  "a2ed2b28cdaf4bd421182c41d9016e57")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarAlarmArray)))
  "Returns md5sum for a message object of type 'RadarAlarmArray"
  "a2ed2b28cdaf4bd421182c41d9016e57")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarAlarmArray>)))
  "Returns full string definition for message of type '<RadarAlarmArray>"
  (cl:format cl:nil "# This message describes an array of alarms with a timestamp.~%~%std_msgs/Header header~%~%RadarAlarm[] alarms~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ainstein_radar_msgs/RadarAlarm~%# This message describes alarms (eg BSD) from a RADAR sensor.~%~%bool LCA_alarm    # Lane Change Assist alarm~%bool CVW_alarm    # Collision (Vehicle?) Warning alarm~%bool BSD_alarm    # Blind Spot Detection alarm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarAlarmArray)))
  "Returns full string definition for message of type 'RadarAlarmArray"
  (cl:format cl:nil "# This message describes an array of alarms with a timestamp.~%~%std_msgs/Header header~%~%RadarAlarm[] alarms~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ainstein_radar_msgs/RadarAlarm~%# This message describes alarms (eg BSD) from a RADAR sensor.~%~%bool LCA_alarm    # Lane Change Assist alarm~%bool CVW_alarm    # Collision (Vehicle?) Warning alarm~%bool BSD_alarm    # Blind Spot Detection alarm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarAlarmArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'alarms) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarAlarmArray>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarAlarmArray
    (cl:cons ':header (header msg))
    (cl:cons ':alarms (alarms msg))
))
