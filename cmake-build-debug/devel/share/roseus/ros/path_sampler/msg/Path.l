;; Auto-generated. Do not edit!


(when (boundp 'path_sampler::Path)
  (if (not (find-package "PATH_SAMPLER"))
    (make-package "PATH_SAMPLER"))
  (shadow 'Path (find-package "PATH_SAMPLER")))
(unless (find-package "PATH_SAMPLER::PATH")
  (make-package "PATH_SAMPLER::PATH"))

(in-package "ROS")
;;//! \htmlinclude Path.msg.html


(defclass path_sampler::Path
  :super ros::object
  :slots (_segments ))

(defmethod path_sampler::Path
  (:init
   (&key
    ((:segments __segments) (let (r) (dotimes (i 0) (push (instance path_sampler::ConfigInterval :init) r)) r))
    )
   (send-super :init)
   (setq _segments __segments)
   self)
  (:segments
   (&rest __segments)
   (if (keywordp (car __segments))
       (send* _segments __segments)
     (progn
       (if __segments (setq _segments (car __segments)))
       _segments)))
  (:serialization-length
   ()
   (+
    ;; path_sampler/ConfigInterval[] _segments
    (apply #'+ (send-all _segments :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; path_sampler/ConfigInterval[] _segments
     (write-long (length _segments) s)
     (dolist (elem _segments)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; path_sampler/ConfigInterval[] _segments
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _segments (let (r) (dotimes (i n) (push (instance path_sampler::ConfigInterval :init) r)) r))
     (dolist (elem- _segments)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get path_sampler::Path :md5sum-) "e0da83884d8773075997c173656f81f7")
(setf (get path_sampler::Path :datatype-) "path_sampler/Path")
(setf (get path_sampler::Path :definition-)
      "ConfigInterval[] segments

================================================================================
MSG: path_sampler/ConfigInterval
Point start
Point end
Point center
float64 radius
float64 arc_start
float64 delta
bool direction
bool orientation
string configIntervalType  # TCI: szakasz, ACI: körív

================================================================================
MSG: path_sampler/Point
float64 x
float64 y


")



(provide :path_sampler/Path "e0da83884d8773075997c173656f81f7")


