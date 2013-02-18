(in-package :millipode)

(defun generate-post (webpage-dir filepath)
  (format t "Generating: ~a.~%" (pathname-name filepath))
  (alexandria:write-string-into-file
   (gen-blog-post-html filepath)
   (webpage-file filepath webpage-dir)
   :if-exists :supersede :if-does-not-exist :create)
    nil)


(defun generate-post-index (webpage-dir)
  (format t "Generating the index.~%")
  (alexandria:write-string-into-file 
   (generate-post-index-html webpage-dir)
   (pathname (merge-pathnames webpage-dir #P"index.html"))
   :if-exists :supersede :if-does-not-exist :create)
  nil)

(defun generate-modified-posts (content-dir webpage-dir)
  (mapcar (alexandria:curry #'generate-post webpage-dir)
	  (list-modified-content content-dir webpage-dir)))

(defun generate-new-posts (content-dir webpage-dir)
    (mapcar (alexandria:curry #'generate-post webpage-dir)
	  (list-new-content content-dir webpage-dir))
    (generate-post-index webpage-dir))

(defun generate-all-posts (content-dir webpage-dir)
  (mapcar (alexandria:curry #'generate-post webpage-dir) (ls content-dir))
  (generate-post-index webpage-dir))
