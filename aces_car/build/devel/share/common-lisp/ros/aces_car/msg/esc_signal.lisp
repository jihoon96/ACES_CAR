; Auto-generated. Do not edit!


(cl:in-package aces_car-msg)


;//! \htmlinclude esc_signal.msg.html

(cl:defclass <esc_signal> (roslisp-msg-protocol:ros-message)
  ((steering
    :reader steering
    :initarg :steering
    :type cl:integer
    :initform 0)
   (motor
    :reader motor
    :initarg :motor
    :type cl:integer
    :initform 0))
)

(cl:defclass esc_signal (<esc_signal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <esc_signal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'esc_signal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aces_car-msg:<esc_signal> is deprecated: use aces_car-msg:esc_signal instead.")))

(cl:ensure-generic-function 'steering-val :lambda-list '(m))
(cl:defmethod steering-val ((m <esc_signal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aces_car-msg:steering-val is deprecated.  Use aces_car-msg:steering instead.")
  (steering m))

(cl:ensure-generic-function 'motor-val :lambda-list '(m))
(cl:defmethod motor-val ((m <esc_signal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aces_car-msg:motor-val is deprecated.  Use aces_car-msg:motor instead.")
  (motor m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <esc_signal>) ostream)
  "Serializes a message object of type '<esc_signal>"
  (cl:let* ((signed (cl:slot-value msg 'steering)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'motor)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <esc_signal>) istream)
  "Deserializes a message object of type '<esc_signal>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'steering) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'motor) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<esc_signal>)))
  "Returns string type for a message object of type '<esc_signal>"
  "aces_car/esc_signal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'esc_signal)))
  "Returns string type for a message object of type 'esc_signal"
  "aces_car/esc_signal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<esc_signal>)))
  "Returns md5sum for a message object of type '<esc_signal>"
  "34f05bd418b68e82fcbd05074fdcd9e0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'esc_signal)))
  "Returns md5sum for a message object of type 'esc_signal"
  "34f05bd418b68e82fcbd05074fdcd9e0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<esc_signal>)))
  "Returns full string definition for message of type '<esc_signal>"
  (cl:format cl:nil "int32 steering~%int32 motor~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'esc_signal)))
  "Returns full string definition for message of type 'esc_signal"
  (cl:format cl:nil "int32 steering~%int32 motor~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <esc_signal>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <esc_signal>))
  "Converts a ROS message object to a list"
  (cl:list 'esc_signal
    (cl:cons ':steering (steering msg))
    (cl:cons ':motor (motor msg))
))
