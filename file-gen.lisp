(in-package :millipode)

(defun generate-post (webpage-dir filepath)
  "Generates a html file in webpage-dir."
  (format t "Generating: ~a.html~%" (pathname-name filepath))
  (write-string-into-file
   (gen-blog-post-html filepath)
   (corresponding-webpage-file filepath webpage-dir)
   :if-exists :supersede :if-does-not-exist :create)
  nil)

(defun generate-post-index (pode)
  "Indexes all the posts in webpage dir."
  (with-existing-pode-slots pode
    (format t "Generating the index.~%")
    (write-string-into-file 
     (generate-post-index-html pode)
     (merge-pathnames webpage-dir #P"index.html")
     :if-exists :supersede :if-does-not-exist :create)
    nil))

(defun generate-modified-posts (pode)
  "Regenerates the html for the modified files in content-dir."
  (with-existing-pode-slots pode
    (map nil (curry #'generate-post webpage-dir)
         (list-modified-content pode))))

(defun generate-new-posts (pode)
  "Generates the html for the newly added files in content-dir."
  (let ((new-content (list-new-content pode)))
    (when new-content
      (with-existing-pode-slots pode
        (map nil (curry #'generate-post webpage-dir) new-content)
        (generate-post-index pode)))))

(defun generate-all-posts (pode)
  (with-existing-pode-slots pode
    (map nil (curry #'generate-post webpage-dir)
         (ls content-dir))
    (generate-post-index pode)))

(defun generate-feed (pode)
  (with-existing-pode-slots pode
    (generate-atom-feed-xml content-dir)))
