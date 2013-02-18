(in-package :millipode)

(defun generate-post (webpage-dir filepath)
  (prog1 (format t "Generating: ~a.~%" (pathname-name filepath))
    (alexandria:write-string-into-file
     (gen-blog-post-html filepath)
     (webpage-file filepath webpage-dir)
     :if-exists :supersede :if-does-not-exist :create)))

(defun generate-index (webpage-dir)
  (prog1 (format t "Generating the index.~%")
    (alexandria:write-string-into-file 
     (generate-index-html webpage-dir)
     (pathname (merge-pathnames webpage-dir #P"index"))
     :if-exists :supersede :if-does-not-exist :create)))

(defun generate-modified-posts (content-dir webpage-dir)
  (mapcar (alexandria:curry #'generate-post webpage-dir)
	  (list-modified-content content-dir webpage-dir)))

(defun generate-new-posts (content-dir webpage-dir)
    (mapcar (alexandria:curry #'generate-post webpage-dir)
	  (list-new-content content-dir webpage-dir))
    (generate-index webpage-dir))

(defun generate-all-posts (content-dir webpage-dir)
  (mapcar (alexandria:curry #'generate-post webpage-dir) (ls content-dir))
  (generate-index webpage-dir))
