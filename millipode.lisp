(in-package #:millipode)

(defparameter *content-path* (cl-fad:pathname-as-directory "../content/"))
(defparameter *webpage-path* (cl-fad:pathname-as-directory "../pages/"))
(defparameter *style-path* (cl-fad:pathname-as-directory "../style/"))

;; TODO if these directories don't exist, create them
(assert (and (cl-fad:directory-exists-p *webpage-path*)
	     (cl-fad:directory-exists-p *content-path*)
	     (cl-fad:directory-exists-p *style-path*)))


(defun pode ()
  (generate-all-posts *content-path* *webpage-path*)
  (generate-index *webpage-path*)
  (generate-style *style-path*))
