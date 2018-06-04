;; Auto-generated. Do not edit!


(when (boundp 'aces_car::esc_signal)
  (if (not (find-package "ACES_CAR"))
    (make-package "ACES_CAR"))
  (shadow 'esc_signal (find-package "ACES_CAR")))
(unless (find-package "ACES_CAR::ESC_SIGNAL")
  (make-package "ACES_CAR::ESC_SIGNAL"))

(in-package "ROS")
;;//! \htmlinclude esc_signal.msg.html


(defclass aces_car::esc_signal
  :super ros::object
  :slots (_steering _motor ))

(defmethod aces_car::esc_signal
  (:init
   (&key
    ((:steering __steering) 0)
    ((:motor __motor) 0)
    )
   (send-super :init)
   (setq _steering (round __steering))
   (setq _motor (round __motor))
   self)
  (:steering
   (&optional __steering)
   (if __steering (setq _steering __steering)) _steering)
  (:motor
   (&optional __motor)
   (if __motor (setq _motor __motor)) _motor)
  (:serialization-length
   ()
   (+
    ;; int32 _steering
    4
    ;; int32 _motor
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _steering
       (write-long _steering s)
     ;; int32 _motor
       (write-long _motor s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _steering
     (setq _steering (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _motor
     (setq _motor (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get aces_car::esc_signal :md5sum-) "34f05bd418b68e82fcbd05074fdcd9e0")
(setf (get aces_car::esc_signal :datatype-) "aces_car/esc_signal")
(setf (get aces_car::esc_signal :definition-)
      "int32 steering
int32 motor

")



(provide :aces_car/esc_signal "34f05bd418b68e82fcbd05074fdcd9e0")


