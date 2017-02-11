; Auto-generated. Do not edit!


(cl:in-package path_sampler-msg)


;//! \htmlinclude Scene.msg.html

(cl:defclass <Scene> (roslisp-msg-protocol:ros-message)
  ((robot
    :reader robot
    :initarg :robot
    :type path_sampler-msg:Robot
    :initform (cl:make-instance 'path_sampler-msg:Robot))
   (environment
    :reader environment
    :initarg :environment
    :type path_sampler-msg:Environment
    :initform (cl:make-instance 'path_sampler-msg:Environment))
   (start
    :reader start
    :initarg :start
    :type path_sampler-msg:Config
    :initform (cl:make-instance 'path_sampler-msg:Config))
   (goal
    :reader goal
    :initarg :goal
    :type path_sampler-msg:Config
    :initform (cl:make-instance 'path_sampler-msg:Config)))
)

(cl:defclass Scene (<Scene>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Scene>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Scene)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_sampler-msg:<Scene> is deprecated: use path_sampler-msg:Scene instead.")))

(cl:ensure-generic-function 'robot-val :lambda-list '(m))
(cl:defmethod robot-val ((m <Scene>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:robot-val is deprecated.  Use path_sampler-msg:robot instead.")
  (robot m))

(cl:ensure-generic-function 'environment-val :lambda-list '(m))
(cl:defmethod environment-val ((m <Scene>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:environment-val is deprecated.  Use path_sampler-msg:environment instead.")
  (environment m))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <Scene>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:start-val is deprecated.  Use path_sampler-msg:start instead.")
  (start m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <Scene>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_sampler-msg:goal-val is deprecated.  Use path_sampler-msg:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Scene>) ostream)
  "Serializes a message object of type '<Scene>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'robot) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'environment) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'start) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Scene>) istream)
  "Deserializes a message object of type '<Scene>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'robot) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'environment) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'start) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Scene>)))
  "Returns string type for a message object of type '<Scene>"
  "path_sampler/Scene")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Scene)))
  "Returns string type for a message object of type 'Scene"
  "path_sampler/Scene")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Scene>)))
  "Returns md5sum for a message object of type '<Scene>"
  "dd906ce2d92bdeca980b67425fdd61f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Scene)))
  "Returns md5sum for a message object of type 'Scene"
  "dd906ce2d92bdeca980b67425fdd61f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Scene>)))
  "Returns full string definition for message of type '<Scene>"
  (cl:format cl:nil "Robot robot~%Environment environment~%Config start~%Config goal~%~%================================================================================~%MSG: path_sampler/Robot~%float64 minimumRadius~%float64 wheelbase~%Polygon body~%~%~%~%================================================================================~%MSG: path_sampler/Polygon~%Point[] points~%~%~%================================================================================~%MSG: path_sampler/Point~%float64 x~%float64 y~%~%~%================================================================================~%MSG: path_sampler/Environment~%Polygon[] obstacles~%Field field~%~%================================================================================~%MSG: path_sampler/Field~%float64 width~%float64 height~%~%~%================================================================================~%MSG: path_sampler/Config~%float64 x~%float64 y~%float64 phi~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Scene)))
  "Returns full string definition for message of type 'Scene"
  (cl:format cl:nil "Robot robot~%Environment environment~%Config start~%Config goal~%~%================================================================================~%MSG: path_sampler/Robot~%float64 minimumRadius~%float64 wheelbase~%Polygon body~%~%~%~%================================================================================~%MSG: path_sampler/Polygon~%Point[] points~%~%~%================================================================================~%MSG: path_sampler/Point~%float64 x~%float64 y~%~%~%================================================================================~%MSG: path_sampler/Environment~%Polygon[] obstacles~%Field field~%~%================================================================================~%MSG: path_sampler/Field~%float64 width~%float64 height~%~%~%================================================================================~%MSG: path_sampler/Config~%float64 x~%float64 y~%float64 phi~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Scene>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'robot))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'environment))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'start))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Scene>))
  "Converts a ROS message object to a list"
  (cl:list 'Scene
    (cl:cons ':robot (robot msg))
    (cl:cons ':environment (environment msg))
    (cl:cons ':start (start msg))
    (cl:cons ':goal (goal msg))
))
