(defpackage :millipode-system
   (:use :cl :asdf))

(in-package :millipode-system)

(asdf:defsystem #:millipode
  :serial t
  :description "A static site generator that makes you want to write - frequently."
  :author      "Samuel Chase <samebchase@gmail.com> website: http://www.samebchase.com/"
  :license     "MIT"
  :depends-on (#:3bmd
               #:cxml
               #:cl-fad
               #:cl-ppcre
               #:alexandria
               #:html-template)
  :components ((:file "package")
               (:file "pode")
               (:file "utils")
               (:file "post-metadata")
               (:file "feed")
               (:file "html-gen")
               (:file "file-gen")
               (:file "config")
               (:file "millipode")))
