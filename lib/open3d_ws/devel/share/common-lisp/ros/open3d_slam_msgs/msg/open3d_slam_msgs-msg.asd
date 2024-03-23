
(cl:in-package :asdf)

(defsystem "open3d_slam_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "PolygonMesh" :depends-on ("_package_PolygonMesh"))
    (:file "_package_PolygonMesh" :depends-on ("_package"))
    (:file "Vertices" :depends-on ("_package_Vertices"))
    (:file "_package_Vertices" :depends-on ("_package"))
  ))