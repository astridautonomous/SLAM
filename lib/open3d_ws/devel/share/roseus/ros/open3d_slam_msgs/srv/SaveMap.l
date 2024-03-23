;; Auto-generated. Do not edit!


(when (boundp 'open3d_slam_msgs::SaveMap)
  (if (not (find-package "OPEN3D_SLAM_MSGS"))
    (make-package "OPEN3D_SLAM_MSGS"))
  (shadow 'SaveMap (find-package "OPEN3D_SLAM_MSGS")))
(unless (find-package "OPEN3D_SLAM_MSGS::SAVEMAP")
  (make-package "OPEN3D_SLAM_MSGS::SAVEMAP"))
(unless (find-package "OPEN3D_SLAM_MSGS::SAVEMAPREQUEST")
  (make-package "OPEN3D_SLAM_MSGS::SAVEMAPREQUEST"))
(unless (find-package "OPEN3D_SLAM_MSGS::SAVEMAPRESPONSE")
  (make-package "OPEN3D_SLAM_MSGS::SAVEMAPRESPONSE"))

(in-package "ROS")





(defclass open3d_slam_msgs::SaveMapRequest
  :super ros::object
  :slots ())

(defmethod open3d_slam_msgs::SaveMapRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass open3d_slam_msgs::SaveMapResponse
  :super ros::object
  :slots (_statusMessage ))

(defmethod open3d_slam_msgs::SaveMapResponse
  (:init
   (&key
    ((:statusMessage __statusMessage) "")
    )
   (send-super :init)
   (setq _statusMessage (string __statusMessage))
   self)
  (:statusMessage
   (&optional __statusMessage)
   (if __statusMessage (setq _statusMessage __statusMessage)) _statusMessage)
  (:serialization-length
   ()
   (+
    ;; string _statusMessage
    4 (length _statusMessage)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _statusMessage
       (write-long (length _statusMessage) s) (princ _statusMessage s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _statusMessage
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _statusMessage (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass open3d_slam_msgs::SaveMap
  :super ros::object
  :slots ())

(setf (get open3d_slam_msgs::SaveMap :md5sum-) "9e836a97d829a00e348178b9b373d448")
(setf (get open3d_slam_msgs::SaveMap :datatype-) "open3d_slam_msgs/SaveMap")
(setf (get open3d_slam_msgs::SaveMap :request) open3d_slam_msgs::SaveMapRequest)
(setf (get open3d_slam_msgs::SaveMap :response) open3d_slam_msgs::SaveMapResponse)

(defmethod open3d_slam_msgs::SaveMapRequest
  (:response () (instance open3d_slam_msgs::SaveMapResponse :init)))

(setf (get open3d_slam_msgs::SaveMapRequest :md5sum-) "9e836a97d829a00e348178b9b373d448")
(setf (get open3d_slam_msgs::SaveMapRequest :datatype-) "open3d_slam_msgs/SaveMapRequest")
(setf (get open3d_slam_msgs::SaveMapRequest :definition-)
      "---
string statusMessage
")

(setf (get open3d_slam_msgs::SaveMapResponse :md5sum-) "9e836a97d829a00e348178b9b373d448")
(setf (get open3d_slam_msgs::SaveMapResponse :datatype-) "open3d_slam_msgs/SaveMapResponse")
(setf (get open3d_slam_msgs::SaveMapResponse :definition-)
      "---
string statusMessage
")



(provide :open3d_slam_msgs/SaveMap "9e836a97d829a00e348178b9b373d448")


