(in-package #:millipode)

(defparameter *content-path* (cl-fad:pathname-as-directory "../blog/"))
(defparameter *webpage-path* (cl-fad:pathname-as-directory "../pages/"))

(defun generate-blog-posts (content-path webpage-path)
  (let ((file-list (list-files-with-extension content-path "txt")))
    (loop for filepath in file-list do
	 (format t "Generating html for: ~a.~%" filepath)
	 (alexandria:write-string-into-file (gen-blog-post-html filepath)
					    (change-extension filepath webpage-path ".html")))))

(defun generate-index (webpage-path)
  (alexandria:write-string-into-file
   (generate-index-html webpage-path)
   (pathname (format nil "~a~a" *webpage-path* "index.html"))))
