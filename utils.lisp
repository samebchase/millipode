(in-package :millipode)

(defun list-files (pathspec)
  (cl-fad:list-directory pathspec))

(defun list-files-with-extension (pathspec suffix)
  (loop for pathname in (list-files pathspec)
       when (string= (pathname-type pathname) suffix) collect pathname))

(defun list-of-strings (pathspec)
  (let ((string-list (cl-ppcre:split "\\n\\n" (alexandria:read-file-into-string pathspec))))
    string-list))

(defun path-str (pathspec)
  "Returns pathname as string"
  (format nil "~a" pathspec))
