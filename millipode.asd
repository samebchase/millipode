(defpackage :millipode-system
   (:use :cl :asdf))

(in-package :millipode-system)

(asdf:defsystem #:millipode
  :serial t
  :description "A static site generator."
  :author      "Samuel Chase <samebchase@gmail.com> http://www.samebchase.com/"
  :license     "MIT"
  :depends-on (#:alexandria
               #:cxml
               #:cl-fad
               #:html-template
               #:3bmd
               #:cl-who
               #:cl-ppcre)
  :components ((:file "package")
               (:file "pode")
               (:file "utils")
               (:file "post-metadata")
               (:file "feed")
               (:file "html-gen")
               (:file "file-gen")
               (:file "config")
               (:file "millipode")))
