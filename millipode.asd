;;;; millipode.asd

(asdf:defsystem #:millipode
  :serial t
  :description "Not enough space available."
  :author "Samuel Chase"
  :license "Do whatever you want with it."
  :depends-on (#:alexandria
               #:cl-fad
               #:cl-who
               #:iterate
	       #:cl-ppcre)
  :components ((:file "package")
	       (:file "utils")
               (:file "millipode")))

