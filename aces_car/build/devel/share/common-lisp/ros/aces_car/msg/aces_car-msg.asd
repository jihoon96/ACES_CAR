
(cl:in-package :asdf)

(defsystem "aces_car-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "esc_signal" :depends-on ("_package_esc_signal"))
    (:file "_package_esc_signal" :depends-on ("_package"))
    (:file "intersection" :depends-on ("_package_intersection"))
    (:file "_package_intersection" :depends-on ("_package"))
  ))