; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_msgs-msg)


;//! \htmlinclude BoundingBoxStamped.msg.html

(cl:defclass <BoundingBoxStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (box
    :reader box
    :initarg :box
    :type ainstein_radar_msgs-msg:BoundingBox
    :initform (cl:make-instance 'ainstein_radar_msgs-msg:BoundingBox)))
)

(cl:defclass BoundingBoxStamped (<BoundingBoxStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoundingBoxStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoundingBoxStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_msgs-msg:<BoundingBoxStamped> is deprecated: use ainstein_radar_msgs-msg:BoundingBoxStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BoundingBoxStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:header-val is deprecated.  Use ainstein_radar_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'box-val :lambda-list '(m))
(cl:defmethod box-val ((m <BoundingBoxStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:box-val is deprecated.  Use ainstein_radar_msgs-msg:box instead.")
  (box m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoundingBoxStamped>) ostream)
  "Serializes a message object of type '<BoundingBoxStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'box) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoundingBoxStamped>) istream)
  "Deserializes a message object of type '<BoundingBoxStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'box) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BoundingBoxStamped>)))
  "Returns string type for a message object of type '<BoundingBoxStamped>"
  "ainstein_radar_msgs/BoundingBoxStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BoundingBoxStamped)))
  "Returns string type for a message object of type 'BoundingBoxStamped"
  "ainstein_radar_msgs/BoundingBoxStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BoundingBoxStamped>)))
  "Returns md5sum for a message object of type '<BoundingBoxStamped>"
  "259e334973915dc19ccfbff4a8ead75e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoundingBoxStamped)))
  "Returns md5sum for a message object of type 'BoundingBoxStamped"
  "259e334973915dc19ccfbff4a8ead75e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoundingBoxStamped>)))
  "Returns full string definition for message of type '<BoundingBoxStamped>"
  (cl:format cl:nil "# BoundingBoxStamped is a stamped BoundingBox.~%std_msgs/Header header~%BoundingBox box~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ainstein_radar_msgs/BoundingBox~%# BoundingBox represents a oriented bounding box.~%geometry_msgs/Pose pose~%geometry_msgs/Vector3 dimensions  # size of bounding box (x, y, z)~%# You can use this field to hold value such as likelihood~%float32 value~%uint32 label~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoundingBoxStamped)))
  "Returns full string definition for message of type 'BoundingBoxStamped"
  (cl:format cl:nil "# BoundingBoxStamped is a stamped BoundingBox.~%std_msgs/Header header~%BoundingBox box~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ainstein_radar_msgs/BoundingBox~%# BoundingBox represents a oriented bounding box.~%geometry_msgs/Pose pose~%geometry_msgs/Vector3 dimensions  # size of bounding box (x, y, z)~%# You can use this field to hold value such as likelihood~%float32 value~%uint32 label~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoundingBoxStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'box))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoundingBoxStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'BoundingBoxStamped
    (cl:cons ':header (header msg))
    (cl:cons ':box (box msg))
))
