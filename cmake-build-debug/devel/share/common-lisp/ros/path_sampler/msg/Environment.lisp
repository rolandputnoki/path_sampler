; Auto-generated. Do not edit!


(cl:in-package path_sampler-msg)


;//! \htmlinclude Environment.msg.html

(cl:defclass <Environment> (roslisp-msg-protocol:ros-message)
  ((obstacles
    :reader obstacles
    :initarg :obstacles
    :type (cl:vector path_sampler-msg:Polygon)
   :initform (cl:make-array 0 :element-type 'path_sampler-msg:Polygon :initial-element (cl:make-instance 'path_sampler-msg:Polygon)))
   (field
    :reader field
    :initarg :field
    :type path_sampler-msg:Field
    :initform (cl:make-instance 'path_sampler-msg:Field)))
)

(cl:defclass Environment (<Environment>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Environment>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Environment)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_sampler-msg:<Environment> is deprecated: use path_sampler-msg:Environment instead.")))

(cl:ensure-generic-function 'obstacles-val :lambda-list '(m))
(cl:defmethod obstacles-val ((m <Environment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:obstacles-val is deprecated.  Use path_sampler-msg:obstacles instead.")
  (obstacles m))

(cl:ensure-generic-function 'field-val :lambda-list '(m))
(cl:defmethod field-val ((m <Environment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:field-val is deprecated.  Use path_sampler-msg:field instead.")
  (field m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Environment>) ostream)
  "Serializes a message object of type '<Environment>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obstacles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obstacles))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'field) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Environment>) istream)
  "Deserializes a message object of type '<Environment>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obstacles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obstacles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'path_sampler-msg:Polygon))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'field) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Environment>)))
  "Returns string type for a message object of type '<Environment>"
  "path_sampler/Environment")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Environment)))
  "Returns string type for a message object of type 'Environment"
  "path_sampler/Environment")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Environment>)))
  "Returns md5sum for a message object of type '<Environment>"
  "3cc57c194042ef7c4a4244da00e50495")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Environment)))
  "Returns md5sum for a message object of type 'Environment"
  "3cc57c194042ef7c4a4244da00e50495")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Environment>)))
  "Returns full string definition for message of type '<Environment>"
  (cl:format cl:nil "Polygon[] obstacles~%Field field~%~%================================================================================~%MSG: path_sampler/Polygon~%Point[] points~%~%~%================================================================================~%MSG: path_sampler/Point~%float64 x~%float64 y~%~%~%================================================================================~%MSG: path_sampler/Field~%float64 width~%float64 height~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Environment)))
  "Returns full string definition for message of type 'Environment"
  (cl:format cl:nil "Polygon[] obstacles~%Field field~%~%================================================================================~%MSG: path_sampler/Polygon~%Point[] points~%~%~%================================================================================~%MSG: path_sampler/Point~%float64 x~%float64 y~%~%~%================================================================================~%MSG: path_sampler/Field~%float64 width~%float64 height~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Environment>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obstacles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'field))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Environment>))
  "Converts a ROS message object to a list"
  (cl:list 'Environment
    (cl:cons ':obstacles (obstacles msg))
    (cl:cons ':field (field msg))
))
