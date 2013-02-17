(in-package #:millipode)

(defparameter *content-dir* (cl-fad:pathname-as-directory "../content/"))
(defparameter *webpage-dir* (cl-fad:pathname-as-directory "../pages/"))
(defparameter *style-dir* (cl-fad:pathname-as-directory "../style/"))

(defun init-dirs ()
  (mapcar #'ensure-directories-exist '(*webpage-dir* *content-dir* *style-dir*)))

(defun status ()
  (format t "Modified content:~%~{~a~%~}" (list-modified-content *content-dir* *webpage-dir*))
  (format t "New content:~%~{~a~%~}"      (list-new-content      *content-dir* *webpage-dir*)))

(defun gen ()
  (generate-new-posts      *content-dir* *webpage-dir*)
  (generate-modified-posts *content-dir* *webpage-dir*)
  (generate-style          *style-dir*))
