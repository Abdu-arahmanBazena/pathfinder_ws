
(cl:in-package :asdf)

(defsystem "path_finder-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ard" :depends-on ("_package_ard"))
    (:file "_package_ard" :depends-on ("_package"))
  ))