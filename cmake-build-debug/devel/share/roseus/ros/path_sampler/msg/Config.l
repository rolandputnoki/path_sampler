;; Auto-generated. Do not edit!


(when (boundp 'path_sampler::Config)
  (if (not (find-package "PATH_SAMPLER"))
    (make-package "PATH_SAMPLER"))
  (shadow 'Config (find-package "PATH_SAMPLER")))
(unless (find-package "PATH_SAMPLER::CONFIG")
  (make-package "PATH_SAMPLER::CONFIG"))

(in-package "ROS")
;;//! \htmlinclude Config.msg.html


(defclass path_sampler::Config
  :super ros::object
  :slots (_x _y _phi ))

(defmethod path_sampler::Config
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:phi __phi) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _phi (float __phi))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:phi
   (&optional __phi)
   (if __phi (setq _phi __phi)) _phi)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _phi
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _phi
       (sys::poke _phi (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _phi
     (setq _phi (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get path_sampler::Config :md5sum-) "b85eb561fe43defc969d836014a828f5")
(setf (get path_sampler::Config :datatype-) "path_sampler/Config")
(setf (get path_sampler::Config :definition-)
      "float64 x
float64 y
float64 phi


")



(provide :path_sampler/Config "b85eb561fe43defc969d836014a828f5")


