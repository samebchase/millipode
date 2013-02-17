(in-package :millipode)

(defun ls (dir)
  (cl-fad:list-directory dir))

(defun ls-ext (dir suffix)
  (loop for pathname in (ls dir)
       when (string= (pathname-type pathname) suffix) collect pathname))

(defun list-of-strings (pathspec)
  (assert (and (cl-fad:file-exists-p pathspec) (not (cl-fad:directory-pathname-p pathspec))))
  (let ((string-list (cl-ppcre:split "\\n\\n" (alexandria:read-file-into-string pathspec))))
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

(defun delete-files (pathspec)
  (assert (cl-fad:directory-exists-p pathspec))
  (loop for file in (ls pathspec) do
       (when (not (cl-fad:directory-pathname-p file))
	 (delete-file file))))

(defun webpage-file (post-text-file webpage-dir)
  (assert (cl-fad:file-exists-p post-text-file))
  (merge-pathnames webpage-dir (pathname-name post-text-file)))

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

(defun content-post-newerp (post-text-file webpage-dir delay)
  (let ((generated-webpage (webpage-file post-text-file webpage-dir)))
    (assert (and (cl-fad:file-exists-p post-text-file)
		 (cl-fad:file-exists-p generated-webpage)))
    (> (file-mod-time-diff post-text-file generated-webpage) delay)))

