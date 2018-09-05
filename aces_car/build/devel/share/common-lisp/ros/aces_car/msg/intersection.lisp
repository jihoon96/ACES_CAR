; Auto-generated. Do not edit!


(cl:in-package aces_car-msg)


;//! \htmlinclude intersection.msg.html

(cl:defclass <intersection> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (depth
    :reader depth
    :initarg :depth
    :type cl:float
    :initform 0.0))
)

(cl:defclass intersection (<intersection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <intersection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'intersection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aces_car-msg:<intersection> is deprecated: use aces_car-msg:intersection instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <intersection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aces_car-msg:x-val is deprecated.  Use aces_car-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <intersection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aces_car-msg:depth-val is deprecated.  Use aces_car-msg:depth instead.")
  (depth m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <intersection>) ostream)
  "Serializes a message object of type '<intersection>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <intersection>) istream)
  "Deserializes a message object of type '<intersection>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<intersection>)))
  "Returns string type for a message object of type '<intersection>"
  "aces_car/intersection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'intersection)))
  "Returns string type for a message object of type 'intersection"
  "aces_car/intersection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<intersection>)))
  "Returns md5sum for a message object of type '<intersection>"
  "c94bdde8250d19d33535d141200b0774")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'intersection)))
  "Returns md5sum for a message object of type 'intersection"
  "c94bdde8250d19d33535d141200b0774")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<intersection>)))
  "Returns full string definition for message of type '<intersection>"
  (cl:format cl:nil "float64 x~%float32 depth~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'intersection)))
  "Returns full string definition for message of type 'intersection"
  (cl:format cl:nil "float64 x~%float32 depth~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <intersection>))
  (cl:+ 0
     8
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <intersection>))
  "Converts a ROS message object to a list"
  (cl:list 'intersection
    (cl:cons ':x (x msg))
    (cl:cons ':depth (depth msg))
))
