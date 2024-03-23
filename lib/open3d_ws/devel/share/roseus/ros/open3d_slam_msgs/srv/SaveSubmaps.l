;; Auto-generated. Do not edit!


(when (boundp 'open3d_slam_msgs::SaveSubmaps)
  (if (not (find-package "OPEN3D_SLAM_MSGS"))
    (make-package "OPEN3D_SLAM_MSGS"))
  (shadow 'SaveSubmaps (find-package "OPEN3D_SLAM_MSGS")))
(unless (find-package "OPEN3D_SLAM_MSGS::SAVESUBMAPS")
  (make-package "OPEN3D_SLAM_MSGS::SAVESUBMAPS"))
(unless (find-package "OPEN3D_SLAM_MSGS::SAVESUBMAPSREQUEST")
  (make-package "OPEN3D_SLAM_MSGS::SAVESUBMAPSREQUEST"))
(unless (find-package "OPEN3D_SLAM_MSGS::SAVESUBMAPSRESPONSE")
  (make-package "OPEN3D_SLAM_MSGS::SAVESUBMAPSRESPONSE"))

(in-package "ROS")





(defclass open3d_slam_msgs::SaveSubmapsRequest
  :super ros::object
  :slots ())

(defmethod open3d_slam_msgs::SaveSubmapsRequest
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

(defclass open3d_slam_msgs::SaveSubmapsResponse
  :super ros::object
  :slots (_statusMessage ))

(defmethod open3d_slam_msgs::SaveSubmapsResponse
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

(defclass open3d_slam_msgs::SaveSubmaps
  :super ros::object
  :slots ())

(setf (get open3d_slam_msgs::SaveSubmaps :md5sum-) "9e836a97d829a00e348178b9b373d448")
(setf (get open3d_slam_msgs::SaveSubmaps :datatype-) "open3d_slam_msgs/SaveSubmaps")
(setf (get open3d_slam_msgs::SaveSubmaps :request) open3d_slam_msgs::SaveSubmapsRequest)
(setf (get open3d_slam_msgs::SaveSubmaps :response) open3d_slam_msgs::SaveSubmapsResponse)

(defmethod open3d_slam_msgs::SaveSubmapsRequest
  (:response () (instance open3d_slam_msgs::SaveSubmapsResponse :init)))

(setf (get open3d_slam_msgs::SaveSubmapsRequest :md5sum-) "9e836a97d829a00e348178b9b373d448")
(setf (get open3d_slam_msgs::SaveSubmapsRequest :datatype-) "open3d_slam_msgs/SaveSubmapsRequest")
(setf (get open3d_slam_msgs::SaveSubmapsRequest :definition-)
      "---
string statusMessage
")

(setf (get open3d_slam_msgs::SaveSubmapsResponse :md5sum-) "9e836a97d829a00e348178b9b373d448")
(setf (get open3d_slam_msgs::SaveSubmapsResponse :datatype-) "open3d_slam_msgs/SaveSubmapsResponse")
(setf (get open3d_slam_msgs::SaveSubmapsResponse :definition-)
      "---
string statusMessage
")



(provide :open3d_slam_msgs/SaveSubmaps "9e836a97d829a00e348178b9b373d448")


