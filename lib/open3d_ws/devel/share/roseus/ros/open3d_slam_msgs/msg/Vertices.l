;; Auto-generated. Do not edit!


(when (boundp 'open3d_slam_msgs::Vertices)
  (if (not (find-package "OPEN3D_SLAM_MSGS"))
    (make-package "OPEN3D_SLAM_MSGS"))
  (shadow 'Vertices (find-package "OPEN3D_SLAM_MSGS")))
(unless (find-package "OPEN3D_SLAM_MSGS::VERTICES")
  (make-package "OPEN3D_SLAM_MSGS::VERTICES"))

(in-package "ROS")
;;//! \htmlinclude Vertices.msg.html


(defclass open3d_slam_msgs::Vertices
  :super ros::object
  :slots (_vertices ))

(defmethod open3d_slam_msgs::Vertices
  (:init
   (&key
    ((:vertices __vertices) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _vertices __vertices)
   self)
  (:vertices
   (&optional __vertices)
   (if __vertices (setq _vertices __vertices)) _vertices)
  (:serialization-length
   ()
   (+
    ;; uint32[] _vertices
    (* 4    (length _vertices)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32[] _vertices
     (write-long (length _vertices) s)
     (dotimes (i (length _vertices))
       (write-long (elt _vertices i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32[] _vertices
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _vertices (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _vertices i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get open3d_slam_msgs::Vertices :md5sum-) "39bd7b1c23763ddd1b882b97cb7cfe11")
(setf (get open3d_slam_msgs::Vertices :datatype-) "open3d_slam_msgs/Vertices")
(setf (get open3d_slam_msgs::Vertices :definition-)
      "# List of point indices
uint32[] vertices
")



(provide :open3d_slam_msgs/Vertices "39bd7b1c23763ddd1b882b97cb7cfe11")


