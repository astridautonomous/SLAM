; Auto-generated. Do not edit!


(cl:in-package open3d_slam_msgs-srv)


;//! \htmlinclude SaveSubmaps-request.msg.html

(cl:defclass <SaveSubmaps-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SaveSubmaps-request (<SaveSubmaps-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveSubmaps-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveSubmaps-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name open3d_slam_msgs-srv:<SaveSubmaps-request> is deprecated: use open3d_slam_msgs-srv:SaveSubmaps-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveSubmaps-request>) ostream)
  "Serializes a message object of type '<SaveSubmaps-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveSubmaps-request>) istream)
  "Deserializes a message object of type '<SaveSubmaps-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveSubmaps-request>)))
  "Returns string type for a service object of type '<SaveSubmaps-request>"
  "open3d_slam_msgs/SaveSubmapsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveSubmaps-request)))
  "Returns string type for a service object of type 'SaveSubmaps-request"
  "open3d_slam_msgs/SaveSubmapsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveSubmaps-request>)))
  "Returns md5sum for a message object of type '<SaveSubmaps-request>"
  "9e836a97d829a00e348178b9b373d448")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveSubmaps-request)))
  "Returns md5sum for a message object of type 'SaveSubmaps-request"
  "9e836a97d829a00e348178b9b373d448")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveSubmaps-request>)))
  "Returns full string definition for message of type '<SaveSubmaps-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveSubmaps-request)))
  "Returns full string definition for message of type 'SaveSubmaps-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveSubmaps-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveSubmaps-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveSubmaps-request
))
;//! \htmlinclude SaveSubmaps-response.msg.html

(cl:defclass <SaveSubmaps-response> (roslisp-msg-protocol:ros-message)
  ((statusMessage
    :reader statusMessage
    :initarg :statusMessage
    :type cl:string
    :initform ""))
)

(cl:defclass SaveSubmaps-response (<SaveSubmaps-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveSubmaps-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveSubmaps-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name open3d_slam_msgs-srv:<SaveSubmaps-response> is deprecated: use open3d_slam_msgs-srv:SaveSubmaps-response instead.")))

(cl:ensure-generic-function 'statusMessage-val :lambda-list '(m))
(cl:defmethod statusMessage-val ((m <SaveSubmaps-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader open3d_slam_msgs-srv:statusMessage-val is deprecated.  Use open3d_slam_msgs-srv:statusMessage instead.")
  (statusMessage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveSubmaps-response>) ostream)
  "Serializes a message object of type '<SaveSubmaps-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'statusMessage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'statusMessage))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveSubmaps-response>) istream)
  "Deserializes a message object of type '<SaveSubmaps-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'statusMessage) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'statusMessage) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveSubmaps-response>)))
  "Returns string type for a service object of type '<SaveSubmaps-response>"
  "open3d_slam_msgs/SaveSubmapsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveSubmaps-response)))
  "Returns string type for a service object of type 'SaveSubmaps-response"
  "open3d_slam_msgs/SaveSubmapsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveSubmaps-response>)))
  "Returns md5sum for a message object of type '<SaveSubmaps-response>"
  "9e836a97d829a00e348178b9b373d448")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveSubmaps-response)))
  "Returns md5sum for a message object of type 'SaveSubmaps-response"
  "9e836a97d829a00e348178b9b373d448")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveSubmaps-response>)))
  "Returns full string definition for message of type '<SaveSubmaps-response>"
  (cl:format cl:nil "string statusMessage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveSubmaps-response)))
  "Returns full string definition for message of type 'SaveSubmaps-response"
  (cl:format cl:nil "string statusMessage~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveSubmaps-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'statusMessage))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveSubmaps-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveSubmaps-response
    (cl:cons ':statusMessage (statusMessage msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SaveSubmaps)))
  'SaveSubmaps-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SaveSubmaps)))
  'SaveSubmaps-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveSubmaps)))
  "Returns string type for a service object of type '<SaveSubmaps>"
  "open3d_slam_msgs/SaveSubmaps")