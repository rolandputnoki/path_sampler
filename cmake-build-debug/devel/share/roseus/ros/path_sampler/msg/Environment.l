;; Auto-generated. Do not edit!


(when (boundp 'path_sampler::Environment)
  (if (not (find-package "PATH_SAMPLER"))
    (make-package "PATH_SAMPLER"))
  (shadow 'Environment (find-package "PATH_SAMPLER")))
(unless (find-package "PATH_SAMPLER::ENVIRONMENT")
  (make-package "PATH_SAMPLER::ENVIRONMENT"))

(in-package "ROS")
;;//! \htmlinclude Environment.msg.html


(defclass path_sampler::Environment
  :super ros::object
  :slots (_obstacles _field ))

(defmethod path_sampler::Environment
  (:init
   (&key
    ((:obstacles __obstacles) (let (r) (dotimes (i 0) (push (instance path_sampler::Polygon :init) r)) r))
    ((:field __field) (instance path_sampler::Field :init))
    )
   (send-super :init)
   (setq _obstacles __obstacles)
   (setq _field __field)
   self)
  (:obstacles
   (&rest __obstacles)
   (if (keywordp (car __obstacles))
       (send* _obstacles __obstacles)
     (progn
       (if __obstacles (setq _obstacles (car __obstacles)))
       _obstacles)))
  (:field
   (&rest __field)
   (if (keywordp (car __field))
       (send* _field __field)
     (progn
       (if __field (setq _field (car __field)))
       _field)))
  (:serialization-length
   ()
   (+
    ;; path_sampler/Polygon[] _obstacles
    (apply #'+ (send-all _obstacles :serialization-length)) 4
    ;; path_sampler/Field _field
    (send _field :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; path_sampler/Polygon[] _obstacles
     (write-long (length _obstacles) s)
     (dolist (elem _obstacles)
       (send elem :serialize s)
       )
     ;; path_sampler/Field _field
       (send _field :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; path_sampler/Polygon[] _obstacles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacles (let (r) (dotimes (i n) (push (instance path_sampler::Polygon :init) r)) r))
     (dolist (elem- _obstacles)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; path_sampler/Field _field
     (send _field :deserialize buf ptr-) (incf ptr- (send _field :serialization-length))
   ;;
   self)
  )

(setf (get path_sampler::Environment :md5sum-) "3cc57c194042ef7c4a4244da00e50495")
(setf (get path_sampler::Environment :datatype-) "path_sampler/Environment")
(setf (get path_sampler::Environment :definition-)
      "Polygon[] obstacles
Field field

================================================================================
MSG: path_sampler/Polygon
Point[] points


================================================================================
MSG: path_sampler/Point
float64 x
float64 y


================================================================================
MSG: path_sampler/Field
float64 width
float64 height


")



(provide :path_sampler/Environment "3cc57c194042ef7c4a4244da00e50495")


