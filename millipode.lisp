(in-package :millipode)

(defclass pode ()
;;; Contains two paths. content-dir is the directory containing text
;;; files and webpage-dir is where the the html files should be
;;; generated.
  ((content-dir :accessor content-dir :initarg :content-dir)
   (webpage-dir :accessor webpage-dir :initarg :webpage-dir)))

(defparameter *blog-pode*
  (make-instance 'pode
				 :content-dir (fad:pathname-as-directory
				 #P"/home/samuel/projects/samebchase.com/site/content/")
				 :webpage-dir (fad:pathname-as-directory
				 #P"/home/samuel/projects/samebchase.com/site/p/")))

(defun help ()
  "Lists available commands"
  (format t 
"[commands]: '(help status gen clean gen-all)

Evaluate \"(describe '<command>), e.g. (describe 'help)\" for more information."))

(defun status ()
  "The three statuses are: new, modified and orphaned.

[new]:

List of files in CONTENT-DIR which have not been generated into their
corresponding html files.

[modified]:

List of files in CONTENT-DIR that have been modified since the last
time their corresponding html files have been generated.

[orphaned]:

List of webpages in WEBPAGE-DIR for which a corresponding file in
CONTENT-DIR does not exist.

If status returns NIL, that means there is nothing to be done.
"
  (let ((modified (list-modified-content  *blog-pode*))
		(new      (list-new-content       *blog-pode*))
		(orphaned (list-orphaned-webpages *blog-pode*)))
    (flet ((print-list-files (string list)
			 (unless (null list)
			   (format t "~a: ~{~a~%~}" string list))))
      (print-list-files "[new]" new)
      (print-list-files "[modified]" modified)
      (print-list-files "[orphaned]" orphaned))))

(defun gen ()
  "Generates new and modified posts. It updates the index, if necessary."
  (generate-new-posts      *blog-pode*)
  (generate-modified-posts *blog-pode*))

(defun gen-all ()
  "Generates all posts and updates the index."
  (generate-all-posts *blog-pode*))

(defun clean ()
  "Deletes orphaned webpages and updates the index."
  (delete-orphaned-webpages *blog-pode*)
  (generate-post-index (webpage-dir *blog-pode*)))
