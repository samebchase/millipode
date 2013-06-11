;;;; package.lisp

(in-package :cl-user)

(defpackage :millipode
  (:nicknames :pode)
  (:use :cl)
  (:export :status
           :gen
           :gen-all
           :index
           :clean
           :help
           :make-executable-image)
  (:import-from :alexandria
                :curry
                :define-constant
                :read-file-into-string
                :write-string-into-file)
  (:import-from :cl-fad
                :file-exists-p
                :pathname-equal
                :list-directory
                :directory-exists-p
                :directory-pathname-p
                :pathname-as-directory)
  (:import-from :cl-who
                :htm
                :esc
                :escape-string
                :with-html-output-to-string)
  (:import-from :cxml
                :text
                :attribute
                :with-element
                :with-xml-output
                :make-string-sink)
  (:import-from :uiop
                :quit))
 
