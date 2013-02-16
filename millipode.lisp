(in-package #:millipode)

(defparameter *content-path* (cl-fad:pathname-as-directory "../blog/"))
(defparameter *webpage-path* (cl-fad:pathname-as-directory "../pages/"))

(assert (and (cl-fad:directory-exists-p *content-path*)
	     (cl-fad:directory-exists-p *webpage-path*)))

(defun generate-post (filepath webpage-path)
  (format t "millipoding: ~a.~%" (pathname-name filepath))
  (alexandria:write-string-into-file
   (gen-blog-post-html filepath)
   (merge-pathnames webpage-path (pathname-name filepath))
   :if-exists :overwrite))

(defun generate-all-posts (content-path webpage-path)
  (let ((file-list (cl-fad:list-directory content-path)))
    (loop for filepath in file-list do
	 (generate-post filepath webpage-path))))

(defun generate-index (webpage-path)
  (prog1 (format t "Generated index.")
    (alexandria:write-string-into-file 
     (generate-index-html webpage-path)
     (pathname (format nil "~a~a" *webpage-path* "index.html"))
     :if-exists :overwrite)))

(defun millipode ()
  (generate-all-posts *content-path* *webpage-path*)
  (generate-index *webpage-path*))
