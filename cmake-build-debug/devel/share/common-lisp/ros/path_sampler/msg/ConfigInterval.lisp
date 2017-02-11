; Auto-generated. Do not edit!


(cl:in-package path_sampler-msg)


;//! \htmlinclude ConfigInterval.msg.html

(cl:defclass <ConfigInterval> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type path_sampler-msg:Point
    :initform (cl:make-instance 'path_sampler-msg:Point))
   (end
    :reader end
    :initarg :end
    :type path_sampler-msg:Point
    :initform (cl:make-instance 'path_sampler-msg:Point))
   (center
    :reader center
    :initarg :center
    :type path_sampler-msg:Point
    :initform (cl:make-instance 'path_sampler-msg:Point))
   (radius
    :reader radius
    :initarg :radius
    :type cl:float
    :initform 0.0)
   (arc_start
    :reader arc_start
    :initarg :arc_start
    :type cl:float
    :initform 0.0)
   (delta
    :reader delta
    :initarg :delta
    :type cl:float
    :initform 0.0)
   (direction
    :reader direction
    :initarg :direction
    :type cl:boolean
    :initform cl:nil)
   (orientation
    :reader orientation
    :initarg :orientation
    :type cl:boolean
    :initform cl:nil)
   (configIntervalType
    :reader configIntervalType
    :initarg :configIntervalType
    :type cl:string
    :initform ""))
)

(cl:defclass ConfigInterval (<ConfigInterval>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConfigInterval>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConfigInterval)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_sampler-msg:<ConfigInterval> is deprecated: use path_sampler-msg:ConfigInterval instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <ConfigInterval>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:start-val is deprecated.  Use path_sampler-msg:start instead.")
  (start m))

(cl:ensure-generic-function 'end-val :lambda-list '(m))
(cl:defmethod end-val ((m <ConfigInterval>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:end-val is deprecated.  Use path_sampler-msg:end instead.")
  (end m))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <ConfigInterval>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:center-val is deprecated.  Use path_sampler-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'radius-val :lambda-list '(m))
(cl:defmethod radius-val ((m <ConfigInterval>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:radius-val is deprecated.  Use path_sampler-msg:radius instead.")
  (radius m))

(cl:ensure-generic-function 'arc_start-val :lambda-list '(m))
(cl:defmethod arc_start-val ((m <ConfigInterval>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:arc_start-val is deprecated.  Use path_sampler-msg:arc_start instead.")
  (arc_start m))

(cl:ensure-generic-function 'delta-val :lambda-list '(m))
(cl:defmethod delta-val ((m <ConfigInterval>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:delta-val is deprecated.  Use path_sampler-msg:delta instead.")
  (delta m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <ConfigInterval>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:direction-val is deprecated.  Use path_sampler-msg:direction instead.")
  (direction m))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <ConfigInterval>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:orientation-val is deprecated.  Use path_sampler-msg:orientation instead.")
  (orientation m))

(cl:ensure-generic-function 'configIntervalType-val :lambda-list '(m))
(cl:defmethod configIntervalType-val ((m <ConfigInterval>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:configIntervalType-val is deprecated.  Use path_sampler-msg:configIntervalType instead.")
  (configIntervalType m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConfigInterval>) ostream)
  "Serializes a message object of type '<ConfigInterval>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'start) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'end) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'arc_start))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'delta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'direction) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'orientation) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'configIntervalType))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'configIntervalType))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConfigInterval>) istream)
  "Deserializes a message object of type '<ConfigInterval>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'start) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'end) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radius) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'arc_start) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'delta) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'direction) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'orientation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'configIntervalType) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'configIntervalType) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConfigInterval>)))
  "Returns string type for a message object of type '<ConfigInterval>"
  "path_sampler/ConfigInterval")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConfigInterval)))
  "Returns string type for a message object of type 'ConfigInterval"
  "path_sampler/ConfigInterval")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConfigInterval>)))
  "Returns md5sum for a message object of type '<ConfigInterval>"
  "6c9b1aa4ea92907adaadbfb9e168e621")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConfigInterval)))
  "Returns md5sum for a message object of type 'ConfigInterval"
  "6c9b1aa4ea92907adaadbfb9e168e621")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConfigInterval>)))
  "Returns full string definition for message of type '<ConfigInterval>"
  (cl:format cl:nil "Point start~%Point end~%Point center~%float64 radius~%float64 arc_start~%float64 delta~%bool direction~%bool orientation~%string configIntervalType  # TCI: szakasz, ACI: körív~%~%================================================================================~%MSG: path_sampler/Point~%float64 x~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConfigInterval)))
  "Returns full string definition for message of type 'ConfigInterval"
  (cl:format cl:nil "Point start~%Point end~%Point center~%float64 radius~%float64 arc_start~%float64 delta~%bool direction~%bool orientation~%string configIntervalType  # TCI: szakasz, ACI: körív~%~%================================================================================~%MSG: path_sampler/Point~%float64 x~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConfigInterval>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'start))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'end))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
     8
     8
     8
     1
     1
     4 (cl:length (cl:slot-value msg 'configIntervalType))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConfigInterval>))
  "Converts a ROS message object to a list"
  (cl:list 'ConfigInterval
    (cl:cons ':start (start msg))
    (cl:cons ':end (end msg))
    (cl:cons ':center (center msg))
    (cl:cons ':radius (radius msg))
    (cl:cons ':arc_start (arc_start msg))
    (cl:cons ':delta (delta msg))
    (cl:cons ':direction (direction msg))
    (cl:cons ':orientation (orientation msg))
    (cl:cons ':configIntervalType (configIntervalType msg))
))
