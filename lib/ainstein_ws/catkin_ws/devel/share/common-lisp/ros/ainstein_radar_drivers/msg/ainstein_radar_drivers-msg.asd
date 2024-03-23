
(cl:in-package :asdf)

(defsystem "ainstein_radar_drivers-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "O79DeviceParams" :depends-on ("_package_O79DeviceParams"))
    (:file "_package_O79DeviceParams" :depends-on ("_package"))
    (:file "O79NetworkParams" :depends-on ("_package_O79NetworkParams"))
    (:file "_package_O79NetworkParams" :depends-on ("_package"))
    (:file "O79TrackingParams" :depends-on ("_package_O79TrackingParams"))
    (:file "_package_O79TrackingParams" :depends-on ("_package"))
    (:file "WayvAirConfiguration" :depends-on ("_package_WayvAirConfiguration"))
    (:file "_package_WayvAirConfiguration" :depends-on ("_package"))
    (:file "WayvAirStatus" :depends-on ("_package_WayvAirStatus"))
    (:file "_package_WayvAirStatus" :depends-on ("_package"))
  ))