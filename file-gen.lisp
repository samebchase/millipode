(in-package :millipode)

(defun generate-post (webpage-dir filepath)
  "Generates a html file in webpage-dir."
  (format t "Generating: ~a.~%" (pathname-name filepath))
  (alexandria:write-string-into-file
   (gen-blog-post-html filepath)
   (corresponding-webpage-file filepath webpage-dir)
   :if-exists :supersede :if-does-not-exist :create)
  nil)

(defun generate-post-index (webpage-dir)
  "Indexes all the posts in webpage dir."
  (format t "Generating the index.~%")
  (alexandria:write-string-into-file 
   (generate-post-index-html webpage-dir)
   (merge-pathnames webpage-dir #P"index.html")
   :if-exists :supersede :if-does-not-exist :create)
  nil)

(defun generate-modified-posts (pode)
  "Regenerates the html for the modified files in content-dir."
  (with-slots (webpage-dir content-dir) pode
    (map nil (alexandria:curry #'generate-post webpage-dir)
		 (list-modified-content pode))))

(defun generate-new-posts (pode)
  "Generates the html for the newly added files in content-dir."
  (with-slots (webpage-dir content-dir) pode
    (map nil (alexandria:curry #'generate-post webpage-dir)
		 (list-new-content pode))
	(generate-post-index webpage-dir)))

(defun generate-all-posts (pode)
  (with-slots (webpage-dir content-dir) pode
    (map nil (alexandria:curry #'generate-post webpage-dir)
		 (ls content-dir))
    (generate-post-index webpage-dir)))
