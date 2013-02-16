(in-package :millipode)

(defun generate-post (filepath webpage-path)
  (format t "millipoding: ~a.~%" (pathname-name filepath))
  (alexandria:write-string-into-file
   (gen-blog-post-html filepath)
   (merge-pathnames webpage-path (pathname-name filepath))
   :if-exists :supersede :if-does-not-exist :create))

(defun generate-index (webpage-path)
  (prog1 (format t "Generated index.~%")
    (alexandria:write-string-into-file 
     (generate-index-html webpage-path)
     (pathname (merge-pathnames #P"../" #P"posts"))
     :if-exists :supersede :if-does-not-exist :create)))

(defun generate-style (style-path)
  (prog1 (format t "Generated stylesheet.~%")
    (alexandria:write-string-into-file
     (generate-base-css)
     (pathname (merge-pathnames style-path #P"style.css"))
     :if-exists :supersede :if-does-not-exist :create)))

(defun generate-all-posts (content-path webpage-path)
  (let ((file-list (ls content-path)))
    (loop for filepath in file-list do
	 (generate-post filepath webpage-path))))
