;; Auto-generated. Do not edit!


(when (boundp 'aces_car::intersection)
  (if (not (find-package "ACES_CAR"))
    (make-package "ACES_CAR"))
  (shadow 'intersection (find-package "ACES_CAR")))
(unless (find-package "ACES_CAR::INTERSECTION")
  (make-package "ACES_CAR::INTERSECTION"))

(in-package "ROS")
;;//! \htmlinclude intersection.msg.html


(defclass aces_car::intersection
  :super ros::object
  :slots (_x _depth ))

(defmethod aces_car::intersection
  (:init
   (&key
    ((:x __x) 0.0)
    ((:depth __depth) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _depth (float __depth))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:depth
   (&optional __depth)
   (if __depth (setq _depth __depth)) _depth)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float32 _depth
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _depth
       (sys::poke _depth (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _depth
     (setq _depth (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get aces_car::intersection :md5sum-) "c94bdde8250d19d33535d141200b0774")
(setf (get aces_car::intersection :datatype-) "aces_car/intersection")
(setf (get aces_car::intersection :definition-)
      "float64 x
float32 depth

")



(provide :aces_car/intersection "c94bdde8250d19d33535d141200b0774")


