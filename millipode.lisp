(in-package #:millipode)

;; TODO: OO approach? Seems to be a lot of repetition of dir
;; names. Maybe some sort of object containing these dirs can be
;; passed around instead?

(defparameter *content-dir* (cl-fad:pathname-as-directory #P"../content/"))
(defparameter *webpage-dir* (cl-fad:pathname-as-directory #P"../p/"))

(defun status ()
  (format t "Modified content:~%~{~a~%~}"  (list-modified-content *content-dir* *webpage-dir*))
  (format t "New content:~%~{~a~%~}"       (list-new-content      *content-dir* *webpage-dir*))
  (format t "Orphaned pages:~%~{~a~%~}"    (list-orphaned-pages   *content-dir* *webpage-dir*)))

(defun gen ()
  (generate-new-posts      *content-dir* *webpage-dir*)
  (generate-modified-posts *content-dir* *webpage-dir*))

(defun gen-all ()
  (generate-all-posts *content-dir* *webpage-dir*))
