;; Auto-generated. Do not edit!


(when (boundp 'path_sampler::ConfigInterval)
  (if (not (find-package "PATH_SAMPLER"))
    (make-package "PATH_SAMPLER"))
  (shadow 'ConfigInterval (find-package "PATH_SAMPLER")))
(unless (find-package "PATH_SAMPLER::CONFIGINTERVAL")
  (make-package "PATH_SAMPLER::CONFIGINTERVAL"))

(in-package "ROS")
;;//! \htmlinclude ConfigInterval.msg.html


(defclass path_sampler::ConfigInterval
  :super ros::object
  :slots (_start _end _center _radius _arc_start _delta _direction _orientation _configIntervalType ))

(defmethod path_sampler::ConfigInterval
  (:init
   (&key
    ((:start __start) (instance path_sampler::Point :init))
    ((:end __end) (instance path_sampler::Point :init))
    ((:center __center) (instance path_sampler::Point :init))
    ((:radius __radius) 0.0)
    ((:arc_start __arc_start) 0.0)
    ((:delta __delta) 0.0)
    ((:direction __direction) nil)
    ((:orientation __orientation) nil)
    ((:configIntervalType __configIntervalType) "")
    )
   (send-super :init)
   (setq _start __start)
   (setq _end __end)
   (setq _center __center)
   (setq _radius (float __radius))
   (setq _arc_start (float __arc_start))
   (setq _delta (float __delta))
   (setq _direction __direction)
   (setq _orientation __orientation)
   (setq _configIntervalType (string __configIntervalType))
   self)
  (:start
   (&rest __start)
   (if (keywordp (car __start))
       (send* _start __start)
     (progn
       (if __start (setq _start (car __start)))
       _start)))
  (:end
   (&rest __end)
   (if (keywordp (car __end))
       (send* _end __end)
     (progn
       (if __end (setq _end (car __end)))
       _end)))
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:arc_start
   (&optional __arc_start)
   (if __arc_start (setq _arc_start __arc_start)) _arc_start)
  (:delta
   (&optional __delta)
   (if __delta (setq _delta __delta)) _delta)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:orientation
   (&optional __orientation)
   (if __orientation (setq _orientation __orientation)) _orientation)
  (:configIntervalType
   (&optional __configIntervalType)
   (if __configIntervalType (setq _configIntervalType __configIntervalType)) _configIntervalType)
  (:serialization-length
   ()
   (+
    ;; path_sampler/Point _start
    (send _start :serialization-length)
    ;; path_sampler/Point _end
    (send _end :serialization-length)
    ;; path_sampler/Point _center
    (send _center :serialization-length)
    ;; float64 _radius
    8
    ;; float64 _arc_start
    8
    ;; float64 _delta
    8
    ;; bool _direction
    1
    ;; bool _orientation
    1
    ;; string _configIntervalType
    4 (length _configIntervalType)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; path_sampler/Point _start
       (send _start :serialize s)
     ;; path_sampler/Point _end
       (send _end :serialize s)
     ;; path_sampler/Point _center
       (send _center :serialize s)
     ;; float64 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _arc_start
       (sys::poke _arc_start (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delta
       (sys::poke _delta (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _direction
       (if _direction (write-byte -1 s) (write-byte 0 s))
     ;; bool _orientation
       (if _orientation (write-byte -1 s) (write-byte 0 s))
     ;; string _configIntervalType
       (write-long (length _configIntervalType) s) (princ _configIntervalType s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; path_sampler/Point _start
     (send _start :deserialize buf ptr-) (incf ptr- (send _start :serialization-length))
   ;; path_sampler/Point _end
     (send _end :deserialize buf ptr-) (incf ptr- (send _end :serialization-length))
   ;; path_sampler/Point _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; float64 _radius
     (setq _radius (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _arc_start
     (setq _arc_start (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delta
     (setq _delta (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _direction
     (setq _direction (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _orientation
     (setq _orientation (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _configIntervalType
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _configIntervalType (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get path_sampler::ConfigInterval :md5sum-) "6c9b1aa4ea92907adaadbfb9e168e621")
(setf (get path_sampler::ConfigInterval :datatype-) "path_sampler/ConfigInterval")
(setf (get path_sampler::ConfigInterval :definition-)
      "Point start
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



(provide :path_sampler/ConfigInterval "6c9b1aa4ea92907adaadbfb9e168e621")


