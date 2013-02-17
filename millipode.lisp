(in-package #:millipode)

(defparameter *content-dir* (cl-fad:pathname-as-directory #P"../content/"))
(defparameter *webpage-dir* (cl-fad:pathname-as-directory #P"../p/"))
(defparameter *style-dir* (cl-fad:pathname-as-directory #P"../css/"))

(defun status ()
  (format t "Modified content:~%~{~a~%~}" (list-modified-content *content-dir* *webpage-dir*))
  (format t "New content:~%~{~a~%~}"      (list-new-content      *content-dir* *webpage-dir*)))

(defun gen ()
  (generate-new-posts      *content-dir* *webpage-dir*)
  (generate-modified-posts *content-dir* *webpage-dir*)
  (generate-style          *style-dir*))

(defun gen-all ()
  (generate-all-posts *content-dir* *webpage-dir*))
