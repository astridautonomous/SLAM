; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_msgs-msg)


;//! \htmlinclude RadarTrackedObject.msg.html

(cl:defclass <RadarTrackedObject> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (velocity
    :reader velocity
    :initarg :velocity
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist))
   (box
    :reader box
    :initarg :box
    :type ainstein_radar_msgs-msg:BoundingBox
    :initform (cl:make-instance 'ainstein_radar_msgs-msg:BoundingBox)))
)

(cl:defclass RadarTrackedObject (<RadarTrackedObject>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarTrackedObject>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarTrackedObject)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_msgs-msg:<RadarTrackedObject> is deprecated: use ainstein_radar_msgs-msg:RadarTrackedObject instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <RadarTrackedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:id-val is deprecated.  Use ainstein_radar_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <RadarTrackedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:pose-val is deprecated.  Use ainstein_radar_msgs-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <RadarTrackedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:velocity-val is deprecated.  Use ainstein_radar_msgs-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'box-val :lambda-list '(m))
(cl:defmethod box-val ((m <RadarTrackedObject>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:box-val is deprecated.  Use ainstein_radar_msgs-msg:box instead.")
  (box m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarTrackedObject>) ostream)
  "Serializes a message object of type '<RadarTrackedObject>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'box) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarTrackedObject>) istream)
  "Deserializes a message object of type '<RadarTrackedObject>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'box) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarTrackedObject>)))
  "Returns string type for a message object of type '<RadarTrackedObject>"
  "ainstein_radar_msgs/RadarTrackedObject")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarTrackedObject)))
  "Returns string type for a message object of type 'RadarTrackedObject"
  "ainstein_radar_msgs/RadarTrackedObject")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarTrackedObject>)))
  "Returns md5sum for a message object of type '<RadarTrackedObject>"
  "2a71462f8c844a31b18d0564b8ff5905")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarTrackedObject)))
  "Returns md5sum for a message object of type 'RadarTrackedObject"
  "2a71462f8c844a31b18d0564b8ff5905")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarTrackedObject>)))
  "Returns full string definition for message of type '<RadarTrackedObject>"
  (cl:format cl:nil "# This message describes a tracked object from a RADAR sensor.~%~%uint16 id                    # Unique object identifier~%~%geometry_msgs/Pose pose      # Cartesian position and orientation~%geometry_msgs/Twist velocity # Cartesian linear and angular velocity (twist)~%~%BoundingBox box              # Bounding box of associated raw detections~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: ainstein_radar_msgs/BoundingBox~%# BoundingBox represents a oriented bounding box.~%geometry_msgs/Pose pose~%geometry_msgs/Vector3 dimensions  # size of bounding box (x, y, z)~%# You can use this field to hold value such as likelihood~%float32 value~%uint32 label~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarTrackedObject)))
  "Returns full string definition for message of type 'RadarTrackedObject"
  (cl:format cl:nil "# This message describes a tracked object from a RADAR sensor.~%~%uint16 id                    # Unique object identifier~%~%geometry_msgs/Pose pose      # Cartesian position and orientation~%geometry_msgs/Twist velocity # Cartesian linear and angular velocity (twist)~%~%BoundingBox box              # Bounding box of associated raw detections~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: ainstein_radar_msgs/BoundingBox~%# BoundingBox represents a oriented bounding box.~%geometry_msgs/Pose pose~%geometry_msgs/Vector3 dimensions  # size of bounding box (x, y, z)~%# You can use this field to hold value such as likelihood~%float32 value~%uint32 label~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarTrackedObject>))
  (cl:+ 0
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'box))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarTrackedObject>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarTrackedObject
    (cl:cons ':id (id msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':box (box msg))
))
