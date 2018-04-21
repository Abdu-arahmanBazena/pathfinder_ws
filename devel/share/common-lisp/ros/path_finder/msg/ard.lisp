; Auto-generated. Do not edit!


(cl:in-package path_finder-msg)


;//! \htmlinclude ard.msg.html

(cl:defclass <ard> (roslisp-msg-protocol:ros-message)
  ((seq
    :reader seq
    :initarg :seq
    :type cl:integer
    :initform 0)
   (stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (frame_id
    :reader frame_id
    :initarg :frame_id
    :type cl:string
    :initform "")
   (ult_right
    :reader ult_right
    :initarg :ult_right
    :type cl:float
    :initform 0.0)
   (ult_left
    :reader ult_left
    :initarg :ult_left
    :type cl:float
    :initform 0.0)
   (ir_right
    :reader ir_right
    :initarg :ir_right
    :type cl:float
    :initform 0.0)
   (ir_left
    :reader ir_left
    :initarg :ir_left
    :type cl:float
    :initform 0.0)
   (compass_x
    :reader compass_x
    :initarg :compass_x
    :type cl:float
    :initform 0.0)
   (compass_y
    :reader compass_y
    :initarg :compass_y
    :type cl:float
    :initform 0.0)
   (compass_z
    :reader compass_z
    :initarg :compass_z
    :type cl:float
    :initform 0.0)
   (servo_angle
    :reader servo_angle
    :initarg :servo_angle
    :type cl:integer
    :initform 0))
)

(cl:defclass ard (<ard>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ard>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ard)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_finder-msg:<ard> is deprecated: use path_finder-msg:ard instead.")))

(cl:ensure-generic-function 'seq-val :lambda-list '(m))
(cl:defmethod seq-val ((m <ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_finder-msg:seq-val is deprecated.  Use path_finder-msg:seq instead.")
  (seq m))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_finder-msg:stamp-val is deprecated.  Use path_finder-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'frame_id-val :lambda-list '(m))
(cl:defmethod frame_id-val ((m <ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_finder-msg:frame_id-val is deprecated.  Use path_finder-msg:frame_id instead.")
  (frame_id m))

(cl:ensure-generic-function 'ult_right-val :lambda-list '(m))
(cl:defmethod ult_right-val ((m <ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_finder-msg:ult_right-val is deprecated.  Use path_finder-msg:ult_right instead.")
  (ult_right m))

(cl:ensure-generic-function 'ult_left-val :lambda-list '(m))
(cl:defmethod ult_left-val ((m <ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_finder-msg:ult_left-val is deprecated.  Use path_finder-msg:ult_left instead.")
  (ult_left m))

(cl:ensure-generic-function 'ir_right-val :lambda-list '(m))
(cl:defmethod ir_right-val ((m <ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_finder-msg:ir_right-val is deprecated.  Use path_finder-msg:ir_right instead.")
  (ir_right m))

(cl:ensure-generic-function 'ir_left-val :lambda-list '(m))
(cl:defmethod ir_left-val ((m <ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_finder-msg:ir_left-val is deprecated.  Use path_finder-msg:ir_left instead.")
  (ir_left m))

(cl:ensure-generic-function 'compass_x-val :lambda-list '(m))
(cl:defmethod compass_x-val ((m <ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_finder-msg:compass_x-val is deprecated.  Use path_finder-msg:compass_x instead.")
  (compass_x m))

(cl:ensure-generic-function 'compass_y-val :lambda-list '(m))
(cl:defmethod compass_y-val ((m <ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_finder-msg:compass_y-val is deprecated.  Use path_finder-msg:compass_y instead.")
  (compass_y m))

(cl:ensure-generic-function 'compass_z-val :lambda-list '(m))
(cl:defmethod compass_z-val ((m <ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_finder-msg:compass_z-val is deprecated.  Use path_finder-msg:compass_z instead.")
  (compass_z m))

(cl:ensure-generic-function 'servo_angle-val :lambda-list '(m))
(cl:defmethod servo_angle-val ((m <ard>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_finder-msg:servo_angle-val is deprecated.  Use path_finder-msg:servo_angle instead.")
  (servo_angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ard>) ostream)
  "Serializes a message object of type '<ard>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'seq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'seq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'seq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'seq)) ostream)
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'frame_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'frame_id))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ult_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ult_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ir_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ir_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'compass_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'compass_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'compass_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'servo_angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'servo_angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'servo_angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'servo_angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'servo_angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'servo_angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'servo_angle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'servo_angle)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ard>) istream)
  "Deserializes a message object of type '<ard>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'seq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'seq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'seq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'seq)) (cl:read-byte istream))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'frame_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ult_right) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ult_left) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ir_right) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ir_left) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'compass_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'compass_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'compass_z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'servo_angle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'servo_angle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'servo_angle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'servo_angle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'servo_angle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'servo_angle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'servo_angle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'servo_angle)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ard>)))
  "Returns string type for a message object of type '<ard>"
  "path_finder/ard")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ard)))
  "Returns string type for a message object of type 'ard"
  "path_finder/ard")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ard>)))
  "Returns md5sum for a message object of type '<ard>"
  "db57fb1eab133016c7f00c01572b2004")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ard)))
  "Returns md5sum for a message object of type 'ard"
  "db57fb1eab133016c7f00c01572b2004")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ard>)))
  "Returns full string definition for message of type '<ard>"
  (cl:format cl:nil "uint32 seq~%time stamp~%string frame_id~%float64 ult_right~%float64 ult_left~%float64 ir_right~%float64 ir_left~%float64 compass_x~%float64 compass_y~%float64 compass_z~%uint64 servo_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ard)))
  "Returns full string definition for message of type 'ard"
  (cl:format cl:nil "uint32 seq~%time stamp~%string frame_id~%float64 ult_right~%float64 ult_left~%float64 ir_right~%float64 ir_left~%float64 compass_x~%float64 compass_y~%float64 compass_z~%uint64 servo_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ard>))
  (cl:+ 0
     4
     8
     4 (cl:length (cl:slot-value msg 'frame_id))
     8
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ard>))
  "Converts a ROS message object to a list"
  (cl:list 'ard
    (cl:cons ':seq (seq msg))
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':frame_id (frame_id msg))
    (cl:cons ':ult_right (ult_right msg))
    (cl:cons ':ult_left (ult_left msg))
    (cl:cons ':ir_right (ir_right msg))
    (cl:cons ':ir_left (ir_left msg))
    (cl:cons ':compass_x (compass_x msg))
    (cl:cons ':compass_y (compass_y msg))
    (cl:cons ':compass_z (compass_z msg))
    (cl:cons ':servo_angle (servo_angle msg))
))
