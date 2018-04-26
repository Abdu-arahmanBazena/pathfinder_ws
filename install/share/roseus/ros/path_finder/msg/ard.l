;; Auto-generated. Do not edit!


(when (boundp 'path_finder::ard)
  (if (not (find-package "PATH_FINDER"))
    (make-package "PATH_FINDER"))
  (shadow 'ard (find-package "PATH_FINDER")))
(unless (find-package "PATH_FINDER::ARD")
  (make-package "PATH_FINDER::ARD"))

(in-package "ROS")
;;//! \htmlinclude ard.msg.html


(defclass path_finder::ard
  :super ros::object
  :slots (_ult_right _ult_left _ir_right _ir_left _compass_x _compass_y _compass_z _servo_angle ))

(defmethod path_finder::ard
  (:init
   (&key
    ((:ult_right __ult_right) 0.0)
    ((:ult_left __ult_left) 0.0)
    ((:ir_right __ir_right) 0.0)
    ((:ir_left __ir_left) 0.0)
    ((:compass_x __compass_x) 0.0)
    ((:compass_y __compass_y) 0.0)
    ((:compass_z __compass_z) 0.0)
    ((:servo_angle __servo_angle) 0)
    )
   (send-super :init)
   (setq _ult_right (float __ult_right))
   (setq _ult_left (float __ult_left))
   (setq _ir_right (float __ir_right))
   (setq _ir_left (float __ir_left))
   (setq _compass_x (float __compass_x))
   (setq _compass_y (float __compass_y))
   (setq _compass_z (float __compass_z))
   (setq _servo_angle (round __servo_angle))
   self)
  (:ult_right
   (&optional __ult_right)
   (if __ult_right (setq _ult_right __ult_right)) _ult_right)
  (:ult_left
   (&optional __ult_left)
   (if __ult_left (setq _ult_left __ult_left)) _ult_left)
  (:ir_right
   (&optional __ir_right)
   (if __ir_right (setq _ir_right __ir_right)) _ir_right)
  (:ir_left
   (&optional __ir_left)
   (if __ir_left (setq _ir_left __ir_left)) _ir_left)
  (:compass_x
   (&optional __compass_x)
   (if __compass_x (setq _compass_x __compass_x)) _compass_x)
  (:compass_y
   (&optional __compass_y)
   (if __compass_y (setq _compass_y __compass_y)) _compass_y)
  (:compass_z
   (&optional __compass_z)
   (if __compass_z (setq _compass_z __compass_z)) _compass_z)
  (:servo_angle
   (&optional __servo_angle)
   (if __servo_angle (setq _servo_angle __servo_angle)) _servo_angle)
  (:serialization-length
   ()
   (+
    ;; float64 _ult_right
    8
    ;; float64 _ult_left
    8
    ;; float64 _ir_right
    8
    ;; float64 _ir_left
    8
    ;; float64 _compass_x
    8
    ;; float64 _compass_y
    8
    ;; float64 _compass_z
    8
    ;; uint64 _servo_angle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _ult_right
       (sys::poke _ult_right (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ult_left
       (sys::poke _ult_left (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ir_right
       (sys::poke _ir_right (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _ir_left
       (sys::poke _ir_left (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _compass_x
       (sys::poke _compass_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _compass_y
       (sys::poke _compass_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _compass_z
       (sys::poke _compass_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint64 _servo_angle
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _servo_angle (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _servo_angle) (= (length (_servo_angle . bv)) 2)) ;; bignum
              (write-long (ash (elt (_servo_angle . bv) 0) 0) s)
              (write-long (ash (elt (_servo_angle . bv) 1) -1) s))
             ((and (class _servo_angle) (= (length (_servo_angle . bv)) 1)) ;; big1
              (write-long (elt (_servo_angle . bv) 0) s)
              (write-long (if (>= _servo_angle 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _servo_angle s)(write-long (if (>= _servo_angle 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _ult_right
     (setq _ult_right (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ult_left
     (setq _ult_left (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ir_right
     (setq _ir_right (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _ir_left
     (setq _ir_left (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _compass_x
     (setq _compass_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _compass_y
     (setq _compass_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _compass_z
     (setq _compass_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint64 _servo_angle
     
#+(or :alpha :irix6 :x86_64)
      (setf _servo_angle (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _servo_angle (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get path_finder::ard :md5sum-) "5ab222d10bef5cb8f3d8c151fb86bd8b")
(setf (get path_finder::ard :datatype-) "path_finder/ard")
(setf (get path_finder::ard :definition-)
      "float64 ult_right
float64 ult_left
float64 ir_right
float64 ir_left
float64 compass_x
float64 compass_y
float64 compass_z
uint64 servo_angle

")



(provide :path_finder/ard "5ab222d10bef5cb8f3d8c151fb86bd8b")


