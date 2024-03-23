; Auto-generated. Do not edit!


(cl:in-package ainstein_radar_msgs-msg)


;//! \htmlinclude RadarAlarm.msg.html

(cl:defclass <RadarAlarm> (roslisp-msg-protocol:ros-message)
  ((LCA_alarm
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

(cl:defclass RadarAlarm (<RadarAlarm>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RadarAlarm>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RadarAlarm)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ainstein_radar_msgs-msg:<RadarAlarm> is deprecated: use ainstein_radar_msgs-msg:RadarAlarm instead.")))

(cl:ensure-generic-function 'LCA_alarm-val :lambda-list '(m))
(cl:defmethod LCA_alarm-val ((m <RadarAlarm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:LCA_alarm-val is deprecated.  Use ainstein_radar_msgs-msg:LCA_alarm instead.")
  (LCA_alarm m))

(cl:ensure-generic-function 'CVW_alarm-val :lambda-list '(m))
(cl:defmethod CVW_alarm-val ((m <RadarAlarm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:CVW_alarm-val is deprecated.  Use ainstein_radar_msgs-msg:CVW_alarm instead.")
  (CVW_alarm m))

(cl:ensure-generic-function 'BSD_alarm-val :lambda-list '(m))
(cl:defmethod BSD_alarm-val ((m <RadarAlarm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ainstein_radar_msgs-msg:BSD_alarm-val is deprecated.  Use ainstein_radar_msgs-msg:BSD_alarm instead.")
  (BSD_alarm m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RadarAlarm>) ostream)
  "Serializes a message object of type '<RadarAlarm>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'LCA_alarm) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'CVW_alarm) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'BSD_alarm) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RadarAlarm>) istream)
  "Deserializes a message object of type '<RadarAlarm>"
    (cl:setf (cl:slot-value msg 'LCA_alarm) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'CVW_alarm) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'BSD_alarm) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RadarAlarm>)))
  "Returns string type for a message object of type '<RadarAlarm>"
  "ainstein_radar_msgs/RadarAlarm")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RadarAlarm)))
  "Returns string type for a message object of type 'RadarAlarm"
  "ainstein_radar_msgs/RadarAlarm")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RadarAlarm>)))
  "Returns md5sum for a message object of type '<RadarAlarm>"
  "bf40054820bd713d25eca0cd48632dd2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RadarAlarm)))
  "Returns md5sum for a message object of type 'RadarAlarm"
  "bf40054820bd713d25eca0cd48632dd2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RadarAlarm>)))
  "Returns full string definition for message of type '<RadarAlarm>"
  (cl:format cl:nil "# This message describes alarms (eg BSD) from a RADAR sensor.~%~%bool LCA_alarm    # Lane Change Assist alarm~%bool CVW_alarm    # Collision (Vehicle?) Warning alarm~%bool BSD_alarm    # Blind Spot Detection alarm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RadarAlarm)))
  "Returns full string definition for message of type 'RadarAlarm"
  (cl:format cl:nil "# This message describes alarms (eg BSD) from a RADAR sensor.~%~%bool LCA_alarm    # Lane Change Assist alarm~%bool CVW_alarm    # Collision (Vehicle?) Warning alarm~%bool BSD_alarm    # Blind Spot Detection alarm~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RadarAlarm>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RadarAlarm>))
  "Converts a ROS message object to a list"
  (cl:list 'RadarAlarm
    (cl:cons ':LCA_alarm (LCA_alarm msg))
    (cl:cons ':CVW_alarm (CVW_alarm msg))
    (cl:cons ':BSD_alarm (BSD_alarm msg))
))
