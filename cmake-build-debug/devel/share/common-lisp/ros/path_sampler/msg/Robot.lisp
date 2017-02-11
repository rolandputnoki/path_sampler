; Auto-generated. Do not edit!


(cl:in-package path_sampler-msg)


;//! \htmlinclude Robot.msg.html

(cl:defclass <Robot> (roslisp-msg-protocol:ros-message)
  ((minimumRadius
    :reader minimumRadius
    :initarg :minimumRadius
    :type cl:float
    :initform 0.0)
   (wheelbase
    :reader wheelbase
    :initarg :wheelbase
    :type cl:float
    :initform 0.0)
   (body
    :reader body
    :initarg :body
    :type path_sampler-msg:Polygon
    :initform (cl:make-instance 'path_sampler-msg:Polygon)))
)

(cl:defclass Robot (<Robot>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Robot>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Robot)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_sampler-msg:<Robot> is deprecated: use path_sampler-msg:Robot instead.")))

(cl:ensure-generic-function 'minimumRadius-val :lambda-list '(m))
(cl:defmethod minimumRadius-val ((m <Robot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:minimumRadius-val is deprecated.  Use path_sampler-msg:minimumRadius instead.")
  (minimumRadius m))

(cl:ensure-generic-function 'wheelbase-val :lambda-list '(m))
(cl:defmethod wheelbase-val ((m <Robot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:wheelbase-val is deprecated.  Use path_sampler-msg:wheelbase instead.")
  (wheelbase m))

(cl:ensure-generic-function 'body-val :lambda-list '(m))
(cl:defmethod body-val ((m <Robot>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:body-val is deprecated.  Use path_sampler-msg:body instead.")
  (body m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Robot>) ostream)
  "Serializes a message object of type '<Robot>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'minimumRadius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wheelbase))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'body) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Robot>) istream)
  "Deserializes a message object of type '<Robot>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'minimumRadius) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wheelbase) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'body) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Robot>)))
  "Returns string type for a message object of type '<Robot>"
  "path_sampler/Robot")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Robot)))
  "Returns string type for a message object of type 'Robot"
  "path_sampler/Robot")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Robot>)))
  "Returns md5sum for a message object of type '<Robot>"
  "a5b2ac8eecc8f975569b4a77146d1fa2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Robot)))
  "Returns md5sum for a message object of type 'Robot"
  "a5b2ac8eecc8f975569b4a77146d1fa2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Robot>)))
  "Returns full string definition for message of type '<Robot>"
  (cl:format cl:nil "float64 minimumRadius~%float64 wheelbase~%Polygon body~%~%~%~%================================================================================~%MSG: path_sampler/Polygon~%Point[] points~%~%~%================================================================================~%MSG: path_sampler/Point~%float64 x~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Robot)))
  "Returns full string definition for message of type 'Robot"
  (cl:format cl:nil "float64 minimumRadius~%float64 wheelbase~%Polygon body~%~%~%~%================================================================================~%MSG: path_sampler/Polygon~%Point[] points~%~%~%================================================================================~%MSG: path_sampler/Point~%float64 x~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Robot>))
  (cl:+ 0
     8
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'body))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Robot>))
  "Converts a ROS message object to a list"
  (cl:list 'Robot
    (cl:cons ':minimumRadius (minimumRadius msg))
    (cl:cons ':wheelbase (wheelbase msg))
    (cl:cons ':body (body msg))
))
