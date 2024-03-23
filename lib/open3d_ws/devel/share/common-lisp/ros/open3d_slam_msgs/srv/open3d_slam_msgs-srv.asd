
(cl:in-package :asdf)

(defsystem "open3d_slam_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "FilePath" :depends-on ("_package_FilePath"))
    (:file "_package_FilePath" :depends-on ("_package"))
    (:file "SaveMap" :depends-on ("_package_SaveMap"))
    (:file "_package_SaveMap" :depends-on ("_package"))
    (:file "SaveSubmaps" :depends-on ("_package_SaveSubmaps"))
    (:file "_package_SaveSubmaps" :depends-on ("_package"))
  ))