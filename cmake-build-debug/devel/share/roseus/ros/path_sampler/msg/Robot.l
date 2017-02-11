;; Auto-generated. Do not edit!


(when (boundp 'path_sampler::Robot)
  (if (not (find-package "PATH_SAMPLER"))
    (make-package "PATH_SAMPLER"))
  (shadow 'Robot (find-package "PATH_SAMPLER")))
(unless (find-package "PATH_SAMPLER::ROBOT")
  (make-package "PATH_SAMPLER::ROBOT"))

(in-package "ROS")
;;//! \htmlinclude Robot.msg.html


(defclass path_sampler::Robot
  :super ros::object
  :slots (_minimumRadius _wheelbase _body ))

(defmethod path_sampler::Robot
  (:init
   (&key
    ((:minimumRadius __minimumRadius) 0.0)
    ((:wheelbase __wheelbase) 0.0)
    ((:body __body) (instance path_sampler::Polygon :init))
    )
   (send-super :init)
   (setq _minimumRadius (float __minimumRadius))
   (setq _wheelbase (float __wheelbase))
   (setq _body __body)
   self)
  (:minimumRadius
   (&optional __minimumRadius)
   (if __minimumRadius (setq _minimumRadius __minimumRadius)) _minimumRadius)
  (:wheelbase
   (&optional __wheelbase)
   (if __wheelbase (setq _wheelbase __wheelbase)) _wheelbase)
  (:body
   (&rest __body)
   (if (keywordp (car __body))
       (send* _body __body)
     (progn
       (if __body (setq _body (car __body)))
       _body)))
  (:serialization-length
   ()
   (+
    ;; float64 _minimumRadius
    8
    ;; float64 _wheelbase
    8
    ;; path_sampler/Polygon _body
    (send _body :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _minimumRadius
       (sys::poke _minimumRadius (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _wheelbase
       (sys::poke _wheelbase (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; path_sampler/Polygon _body
       (send _body :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _minimumRadius
     (setq _minimumRadius (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _wheelbase
     (setq _wheelbase (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; path_sampler/Polygon _body
     (send _body :deserialize buf ptr-) (incf ptr- (send _body :serialization-length))
   ;;
   self)
  )

(setf (get path_sampler::Robot :md5sum-) "a5b2ac8eecc8f975569b4a77146d1fa2")
(setf (get path_sampler::Robot :datatype-) "path_sampler/Robot")
(setf (get path_sampler::Robot :definition-)
      "float64 minimumRadius
float64 wheelbase
Polygon body



================================================================================
MSG: path_sampler/Polygon
Point[] points


================================================================================
MSG: path_sampler/Point
float64 x
float64 y


")



(provide :path_sampler/Robot "a5b2ac8eecc8f975569b4a77146d1fa2")


