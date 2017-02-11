;; Auto-generated. Do not edit!


(when (boundp 'path_sampler::Polygon)
  (if (not (find-package "PATH_SAMPLER"))
    (make-package "PATH_SAMPLER"))
  (shadow 'Polygon (find-package "PATH_SAMPLER")))
(unless (find-package "PATH_SAMPLER::POLYGON")
  (make-package "PATH_SAMPLER::POLYGON"))

(in-package "ROS")
;;//! \htmlinclude Polygon.msg.html


(defclass path_sampler::Polygon
  :super ros::object
  :slots (_points ))

(defmethod path_sampler::Polygon
  (:init
   (&key
    ((:points __points) (let (r) (dotimes (i 0) (push (instance path_sampler::Point :init) r)) r))
    )
   (send-super :init)
   (setq _points __points)
   self)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; path_sampler/Point[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; path_sampler/Point[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; path_sampler/Point[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance path_sampler::Point :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get path_sampler::Polygon :md5sum-) "8f02263beef99aa03117a577a3eb879d")
(setf (get path_sampler::Polygon :datatype-) "path_sampler/Polygon")
(setf (get path_sampler::Polygon :definition-)
      "Point[] points


================================================================================
MSG: path_sampler/Point
float64 x
float64 y


")



(provide :path_sampler/Polygon "8f02263beef99aa03117a577a3eb879d")


