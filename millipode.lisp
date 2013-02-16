(in-package #:millipode)

(defparameter *content-path* (cl-fad:pathname-as-directory "../blog/"))
(defparameter *webpage-path* (cl-fad:pathname-as-directory "../pages/"))

(assert (and (cl-fad:directory-exists-p *content-path*)
	     (cl-fad:directory-exists-p *webpage-path*)))

(defun generate-post (filepath webpage-path)
  (format t "Generating html for: ~a.~%" filepath)
  (alexandria:write-string-into-file
   (gen-blog-post-html filepath)
   (merge-pathnames webpage-path (pathname-name filepath))))

(defun generate-all-posts (content-path webpage-path)
  (let ((file-list (cl-fad:list-directory content-path)))
    (loop for filepath in file-list do
	 (generate-post filepath webpage-path))))

(defun generate-index (webpage-path)
  (alexandria:write-string-into-file
   (generate-index-html webpage-path)
   (pathname (format nil "~a~a" *webpage-path* "index.html"))))

(generate-all-posts *content-path* *webpage-path*)
(generate-index *webpage-path*)
