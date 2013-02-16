(in-package :millipode)

(defun ls (dir)
  (cl-fad:list-directory dir))

(defun ls-ext (dir suffix)
  (loop for pathname in (ls dir)
       when (string= (pathname-type pathname) suffix) collect pathname))

(defun list-of-strings (pathspec)
  (let ((string-list (cl-ppcre:split "\\n\\n" (alexandria:read-file-into-string pathspec))))
    string-list))

(defun path-str (pathspec)
  "Returns pathname as string"
  (format nil "~a" pathspec))

(defun delete-files (pathspec)
  (loop for file in (list-files pathspec)
     do (when (not (cl-fad:directory-pathname-p file)) (delete-file file))))
