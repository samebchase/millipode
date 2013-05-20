(in-package :millipode)

(defclass pode ()
  ((content-dir :accessor content-dir :initarg :content-dir)
   (webpage-dir :accessor webpage-dir :initarg :webpage-dir)))

(defparameter *blog-pode*
  (make-instance 'pode
				 :content-dir (fad:pathname-as-directory #P"/home/samuel/projects/samebchase.com/site/content/")
				 :webpage-dir (fad:pathname-as-directory #P"/home/samuel/projects/samebchase.com/site/p/")))

(defun status ()
  (let ((modified (list-modified-content  *blog-pode*))
		(new      (list-new-content       *blog-pode*))
		(orphaned (list-orphaned-webpages *blog-pode*)))
    (flet ((print-list-files (string list)
			 (unless (null list)
			   (format t "~a: ~{~a~%~}" string list))))
      (print-list-files "modified" modified)
      (print-list-files "new" new)
      (print-list-files "orphaned" orphaned))))

(defun gen ()
  (generate-new-posts      *blog-pode*)
  (generate-modified-posts *blog-pode*))

(defun gen-all ()
  (generate-all-posts *blog-pode*))

(defun delete-orphans ()
  (delete-orphaned-webpages *blog-pode*)
  (generate-post-index *blog-pode*))
