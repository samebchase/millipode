(in-package :millipode)

;; TODO: OO approach? Seems to be a lot of repetition of dir
;; names. Maybe some sort of object containing these dirs can be
;; passed around instead?

(defparameter *content-dir* (fad:pathname-as-directory #P"../content/"))
(defparameter *webpage-dir* (fad:pathname-as-directory #P"../p/"))

(defun print-list-files (string list)
  (unless (null list)
    (format t "~a: ~{~a~%~}" string list)))

(defun status ()
  (let ((modified (list-modified-content *content-dir* *webpage-dir*))
	(new      (list-new-content      *content-dir* *webpage-dir*))
	(orphaned (list-orphaned-pages   *content-dir* *webpage-dir*)))
    (print-list-files "modified" modified)
    (print-list-files "new" new)
    (print-list-files "orphaned" orphaned)))

(defun gen ()
  (generate-new-posts      *content-dir* *webpage-dir*)
  (generate-modified-posts *content-dir* *webpage-dir*))

(defun gen-all ()
  (generate-all-posts *content-dir* *webpage-dir*))

(defun delete-orphans ()
  (delete-orphaned-webpages *content-dir* *webpage-dir*)
  (generate-post-index *webpage-dir*))
