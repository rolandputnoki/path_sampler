;; Auto-generated. Do not edit!


(when (boundp 'path_sampler::Field)
  (if (not (find-package "PATH_SAMPLER"))
    (make-package "PATH_SAMPLER"))
  (shadow 'Field (find-package "PATH_SAMPLER")))
(unless (find-package "PATH_SAMPLER::FIELD")
  (make-package "PATH_SAMPLER::FIELD"))

(in-package "ROS")
;;//! \htmlinclude Field.msg.html


(defclass path_sampler::Field
  :super ros::object
  :slots (_width _height ))

(defmethod path_sampler::Field
  (:init
   (&key
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    )
   (send-super :init)
   (setq _width (float __width))
   (setq _height (float __height))
   self)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:serialization-length
   ()
   (+
    ;; float64 _width
    8
    ;; float64 _height
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _width
       (sys::poke _width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _height
       (sys::poke _height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _width
     (setq _width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _height
     (setq _height (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get path_sampler::Field :md5sum-) "f86522e647336fb10b55359fe003f673")
(setf (get path_sampler::Field :datatype-) "path_sampler/Field")
(setf (get path_sampler::Field :definition-)
      "float64 width
float64 height


")



(provide :path_sampler/Field "f86522e647336fb10b55359fe003f673")


