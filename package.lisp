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
                :pathname-as-file
                :directory-exists-p
                :directory-pathname-p
                :pathname-as-directory)
  (:import-from :cl-ppcre
                :register-groups-bind)
  (:import-from :cxml
                :text
                :attribute
                :with-element
                :with-xml-output
                :make-string-sink)
  (:import-from :3bmd
                :parse-string-and-print-to-stream)
  (:import-from :html-template
                :*string-modifier*
                :fill-and-print-template)
  (:import-from :local-time
                :now
                :to-rfc3339-timestring))
