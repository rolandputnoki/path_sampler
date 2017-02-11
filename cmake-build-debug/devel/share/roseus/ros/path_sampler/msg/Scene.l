;; Auto-generated. Do not edit!


(when (boundp 'path_sampler::Scene)
  (if (not (find-package "PATH_SAMPLER"))
    (make-package "PATH_SAMPLER"))
  (shadow 'Scene (find-package "PATH_SAMPLER")))
(unless (find-package "PATH_SAMPLER::SCENE")
  (make-package "PATH_SAMPLER::SCENE"))

(in-package "ROS")
;;//! \htmlinclude Scene.msg.html


(defclass path_sampler::Scene
  :super ros::object
  :slots (_robot _environment _start _goal ))

(defmethod path_sampler::Scene
  (:init
   (&key
    ((:robot __robot) (instance path_sampler::Robot :init))
    ((:environment __environment) (instance path_sampler::Environment :init))
    ((:start __start) (instance path_sampler::Config :init))
    ((:goal __goal) (instance path_sampler::Config :init))
    )
   (send-super :init)
   (setq _robot __robot)
   (setq _environment __environment)
   (setq _start __start)
   (setq _goal __goal)
   self)
  (:robot
   (&rest __robot)
   (if (keywordp (car __robot))
       (send* _robot __robot)
     (progn
       (if __robot (setq _robot (car __robot)))
       _robot)))
  (:environment
   (&rest __environment)
   (if (keywordp (car __environment))
       (send* _environment __environment)
     (progn
       (if __environment (setq _environment (car __environment)))
       _environment)))
  (:start
   (&rest __start)
   (if (keywordp (car __start))
       (send* _start __start)
     (progn
       (if __start (setq _start (car __start)))
       _start)))
  (:goal
   (&rest __goal)
   (if (keywordp (car __goal))
       (send* _goal __goal)
     (progn
       (if __goal (setq _goal (car __goal)))
       _goal)))
  (:serialization-length
   ()
   (+
    ;; path_sampler/Robot _robot
    (send _robot :serialization-length)
    ;; path_sampler/Environment _environment
    (send _environment :serialization-length)
    ;; path_sampler/Config _start
    (send _start :serialization-length)
    ;; path_sampler/Config _goal
    (send _goal :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; path_sampler/Robot _robot
       (send _robot :serialize s)
     ;; path_sampler/Environment _environment
       (send _environment :serialize s)
     ;; path_sampler/Config _start
       (send _start :serialize s)
     ;; path_sampler/Config _goal
       (send _goal :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; path_sampler/Robot _robot
     (send _robot :deserialize buf ptr-) (incf ptr- (send _robot :serialization-length))
   ;; path_sampler/Environment _environment
     (send _environment :deserialize buf ptr-) (incf ptr- (send _environment :serialization-length))
   ;; path_sampler/Config _start
     (send _start :deserialize buf ptr-) (incf ptr- (send _start :serialization-length))
   ;; path_sampler/Config _goal
     (send _goal :deserialize buf ptr-) (incf ptr- (send _goal :serialization-length))
   ;;
   self)
  )

(setf (get path_sampler::Scene :md5sum-) "dd906ce2d92bdeca980b67425fdd61f5")
(setf (get path_sampler::Scene :datatype-) "path_sampler/Scene")
(setf (get path_sampler::Scene :definition-)
      "Robot robot
Environment environment
Config start
Config goal

================================================================================
MSG: path_sampler/Robot
float64 minimumRadius
float64 wheelbase
Polygon body



================================================================================
MSG: path_sampler/Polygon
Point[] points


================================================================================
MSG: path_sampler/Point
float64 x
float64 y


================================================================================
MSG: path_sampler/Environment
Polygon[] obstacles
Field field

================================================================================
MSG: path_sampler/Field
float64 width
float64 height


================================================================================
MSG: path_sampler/Config
float64 x
float64 y
float64 phi


")



(provide :path_sampler/Scene "dd906ce2d92bdeca980b67425fdd61f5")


