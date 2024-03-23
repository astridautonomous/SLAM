;; Auto-generated. Do not edit!


(when (boundp 'ainstein_radar_msgs::RadarTrackedObject)
  (if (not (find-package "AINSTEIN_RADAR_MSGS"))
    (make-package "AINSTEIN_RADAR_MSGS"))
  (shadow 'RadarTrackedObject (find-package "AINSTEIN_RADAR_MSGS")))
(unless (find-package "AINSTEIN_RADAR_MSGS::RADARTRACKEDOBJECT")
  (make-package "AINSTEIN_RADAR_MSGS::RADARTRACKEDOBJECT"))

(in-package "ROS")
;;//! \htmlinclude RadarTrackedObject.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass ainstein_radar_msgs::RadarTrackedObject
  :super ros::object
  :slots (_id _pose _velocity _box ))

(defmethod ainstein_radar_msgs::RadarTrackedObject
  (:init
   (&key
    ((:id __id) 0)
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:velocity __velocity) (instance geometry_msgs::Twist :init))
    ((:box __box) (instance ainstein_radar_msgs::BoundingBox :init))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _pose __pose)
   (setq _velocity __velocity)
   (setq _box __box)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:box
   (&rest __box)
   (if (keywordp (car __box))
       (send* _box __box)
     (progn
       (if __box (setq _box (car __box)))
       _box)))
  (:serialization-length
   ()
   (+
    ;; uint16 _id
    2
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; geometry_msgs/Twist _velocity
    (send _velocity :serialization-length)
    ;; ainstein_radar_msgs/BoundingBox _box
    (send _box :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _id
       (write-word _id s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; geometry_msgs/Twist _velocity
       (send _velocity :serialize s)
     ;; ainstein_radar_msgs/BoundingBox _box
       (send _box :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _id
     (setq _id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; geometry_msgs/Twist _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; ainstein_radar_msgs/BoundingBox _box
     (send _box :deserialize buf ptr-) (incf ptr- (send _box :serialization-length))
   ;;
   self)
  )

(setf (get ainstein_radar_msgs::RadarTrackedObject :md5sum-) "2a71462f8c844a31b18d0564b8ff5905")
(setf (get ainstein_radar_msgs::RadarTrackedObject :datatype-) "ainstein_radar_msgs/RadarTrackedObject")
(setf (get ainstein_radar_msgs::RadarTrackedObject :definition-)
      "# This message describes a tracked object from a RADAR sensor.

uint16 id                    # Unique object identifier

geometry_msgs/Pose pose      # Cartesian position and orientation
geometry_msgs/Twist velocity # Cartesian linear and angular velocity (twist)

BoundingBox box              # Bounding box of associated raw detections
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: ainstein_radar_msgs/BoundingBox
# BoundingBox represents a oriented bounding box.
geometry_msgs/Pose pose
geometry_msgs/Vector3 dimensions  # size of bounding box (x, y, z)
# You can use this field to hold value such as likelihood
float32 value
uint32 label
")



(provide :ainstein_radar_msgs/RadarTrackedObject "2a71462f8c844a31b18d0564b8ff5905")


