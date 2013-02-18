(in-package :millipode)

(defun ls (dir)
  (cl-fad:list-directory dir))

(defun ls-ext (dir suffix)
  (loop for pathname in (ls dir)
       when (string= (pathname-type pathname) suffix) collect pathname))

(defun list-of-strings (pathspec separator)
  (assert (and (cl-fad:file-exists-p pathspec) (not (cl-fad:directory-pathname-p pathspec))))
  (let ((string-list (cl-ppcre:split separator (alexandria:read-file-into-string pathspec))))
    string-list))

(defun list-modified-content (content-dir webpage-dir)
  (assert (and (cl-fad:directory-exists-p content-dir)
	       (cl-fad:directory-exists-p webpage-dir)))
  (loop for file in (remove-if-not (alexandria:curry #'generated-webpage-p webpage-dir) (ls content-dir))
     when (content-post-newerp file webpage-dir 2)
       collect file))

(defun path-str (pathspec)
  "Returns pathname as string"
  (format nil "~a" pathspec))

(defun webpage-file (post-text-file webpage-dir)
  (assert (cl-fad:file-exists-p post-text-file))
  (merge-pathnames webpage-dir
		   (pathname (format nil "~a~a" (pathname-name post-text-file) ".html"))))

(defun text-file (webpage-file content-dir)
  (assert (cl-fad:file-exists-p webpage-file))
  (merge-pathnames content-dir
		   (pathname (format nil "~a~a" (pathname-name webpage-file) ".txt"))))

(defun file-mod-time-diff (file-a file-b)
  (assert (and (cl-fad:file-exists-p file-a)
	       (cl-fad:file-exists-p file-b)))
  (- (file-write-date file-a)
     (file-write-date file-b)))

(defun generated-webpage-p (webpage-dir content-file)
  (cl-fad:file-exists-p (webpage-file content-file webpage-dir)))

(defun list-new-content (content-dir webpage-dir)
  (loop for file in (ls content-dir)
       unless (generated-webpage-p webpage-dir file)
       collect file))

(defun list-orphaned-pages (content-dir webpage-dir)
 " Lists the webpages from webpage-dir that do not have a
corresponding file in content-dir."
 (let ((webpages (ls webpage-dir)))
   (loop for webpage in webpages unless
	(or (cl-fad:file-exists-p (text-file webpage content-dir))
	    (string= (pathname-name webpage) "index"))
      collect webpage)))

(defun content-post-newerp (post-text-file webpage-dir delay)
  (let ((generated-webpage (webpage-file post-text-file webpage-dir)))
    (assert (and (cl-fad:file-exists-p post-text-file)
		 (cl-fad:file-exists-p generated-webpage)))
    (> (file-mod-time-diff post-text-file generated-webpage) delay)))

(defun delete-files-in-dir (pathspec)
  (assert (cl-fad:directory-exists-p pathspec))
  (loop for file in (ls pathspec) do
       (when (not (cl-fad:directory-pathname-p file))
	 (delete-file file))))

(defun delete-orphaned-webpages (content-dir webpage-dir)
  (mapcar #'delete-file (list-orphaned-pages content-dir webpage-dir)))
