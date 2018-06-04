
(cl:in-package :asdf)

(defsystem "aces_car-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "esc_signal" :depends-on ("_package_esc_signal"))
    (:file "_package_esc_signal" :depends-on ("_package"))
  ))