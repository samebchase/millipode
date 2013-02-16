(in-package #:millipode)

(defparameter *content-path* (cl-fad:pathname-as-directory "../content/"))
(defparameter *webpage-path* (cl-fad:pathname-as-directory "../pages/"))
(defparameter *style-path* (cl-fad:pathname-as-directory "../style/"))

;; TODO if these directories don't exist, create them
(assert (and (cl-fad:directory-exists-p *webpage-path*)
	     (cl-fad:directory-exists-p *content-path*)
	     (cl-fad:directory-exists-p *style-path*)))

(defun generate-post (filepath webpage-path)
  (format t "millipoding: ~a.~%" (pathname-name filepath))
  (alexandria:write-string-into-file
   (gen-blog-post-html filepath)
   (merge-pathnames webpage-path (pathname-name filepath))
   :if-exists :overwrite :if-does-not-exist :create))

(defun generate-all-posts (content-path webpage-path)
  (let ((file-list (cl-fad:list-directory content-path)))
    (loop for filepath in file-list do
	 (generate-post filepath webpage-path))))

(defun generate-index (webpage-path)
  (prog1 (format t "Generated index.~%")
    (alexandria:write-string-into-file 
     (generate-index-html webpage-path)
     (pathname (merge-pathnames #P"../" #P"posts"))
     :if-exists :overwrite :if-does-not-exist :create)))

(defun generate-style (style-path)
  (prog1 (format t "Generated stylesheet.~%")
    (alexandria:write-string-into-file
     (generate-base-css)
     (pathname (merge-pathnames style-path #P"style.css"))
     :if-exists :overwrite :if-does-not-exist :create)))

(defun pode ()
  (generate-all-posts *content-path* *webpage-path*)
  (generate-index *webpage-path*)
  (generate-style *style-path*))
