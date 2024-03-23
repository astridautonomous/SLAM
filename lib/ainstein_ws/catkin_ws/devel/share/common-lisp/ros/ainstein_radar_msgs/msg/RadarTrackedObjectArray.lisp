; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_msgs-msg)


;//! \htmlinclude RadarTrackedObjectArray.msg.html

(cl:defclass <RadarTrackedObjectArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (objects
    :reader objects
    :initarg :objects
    :type (cl:vector ainstein_radar_msgs-msg:RadarTrackedObject)
   :initform (cl:make-array 0 :element-type 'ainstein_radar_msgs-msg:RadarTrackedObject :initial-element (cl:make-instance 'ainstein_radar_msgs-msg:RadarTrackedObject))))
)

(cl:defclass RadarTrackedObjectArray (<RadarTrackedObjectArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarTrackedObjectArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarTrackedObjectArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_msgs-msg:<RadarTrackedObjectArray> is deprecated: use ainstein_radar_msgs-msg:RadarTrackedObjectArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RadarTrackedObjectArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:header-val is deprecated.  Use ainstein_radar_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'objects-val :lambda-list '(m))
(cl:defmethod objects-val ((m <RadarTrackedObjectArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:objects-val is deprecated.  Use ainstein_radar_msgs-msg:objects instead.")
  (objects m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarTrackedObjectArray>) ostream)
  "Serializes a message object of type '<RadarTrackedObjectArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objects))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarTrackedObjectArray>) istream)
  "Deserializes a message object of type '<RadarTrackedObjectArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objects) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ainstein_radar_msgs-msg:RadarTrackedObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarTrackedObjectArray>)))
  "Returns string type for a message object of type '<RadarTrackedObjectArray>"
  "ainstein_radar_msgs/RadarTrackedObjectArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarTrackedObjectArray)))
  "Returns string type for a message object of type 'RadarTrackedObjectArray"
  "ainstein_radar_msgs/RadarTrackedObjectArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarTrackedObjectArray>)))
  "Returns md5sum for a message object of type '<RadarTrackedObjectArray>"
  "599beb468e0d0aa0f7e1d3a5ae39243b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarTrackedObjectArray)))
  "Returns md5sum for a message object of type 'RadarTrackedObjectArray"
  "599beb468e0d0aa0f7e1d3a5ae39243b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarTrackedObjectArray>)))
  "Returns full string definition for message of type '<RadarTrackedObjectArray>"
  (cl:format cl:nil "# This message describes an array of tracked objects with a timestamp.~%~%std_msgs/Header header~%~%RadarTrackedObject[] objects~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ainstein_radar_msgs/RadarTrackedObject~%# This message describes a tracked object from a RADAR sensor.~%~%uint16 id                    # Unique object identifier~%~%geometry_msgs/Pose pose      # Cartesian position and orientation~%geometry_msgs/Twist velocity # Cartesian linear and angular velocity (twist)~%~%BoundingBox box              # Bounding box of associated raw detections~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: ainstein_radar_msgs/BoundingBox~%# BoundingBox represents a oriented bounding box.~%geometry_msgs/Pose pose~%geometry_msgs/Vector3 dimensions  # size of bounding box (x, y, z)~%# You can use this field to hold value such as likelihood~%float32 value~%uint32 label~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarTrackedObjectArray)))
  "Returns full string definition for message of type 'RadarTrackedObjectArray"
  (cl:format cl:nil "# This message describes an array of tracked objects with a timestamp.~%~%std_msgs/Header header~%~%RadarTrackedObject[] objects~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ainstein_radar_msgs/RadarTrackedObject~%# This message describes a tracked object from a RADAR sensor.~%~%uint16 id                    # Unique object identifier~%~%geometry_msgs/Pose pose      # Cartesian position and orientation~%geometry_msgs/Twist velocity # Cartesian linear and angular velocity (twist)~%~%BoundingBox box              # Bounding box of associated raw detections~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: ainstein_radar_msgs/BoundingBox~%# BoundingBox represents a oriented bounding box.~%geometry_msgs/Pose pose~%geometry_msgs/Vector3 dimensions  # size of bounding box (x, y, z)~%# You can use this field to hold value such as likelihood~%float32 value~%uint32 label~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarTrackedObjectArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarTrackedObjectArray>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarTrackedObjectArray
    (cl:cons ':header (header msg))
    (cl:cons ':objects (objects msg))
))
