(in-package :millipode)

(defun list-files (pathspec)
  (cl-fad:list-directory pathspec))

(defun list-files-recursively (pathspec)
  (let ((file-list ()))
    (cl-fad:walk-directory pathspec (lambda (file) (push file file-list)))
    file-list))   

(defun list-files-with-extension (pathspec suffix)
  (loop for pathname in (list-files pathspec)
       when (string= (pathname-type pathname) suffix) collect pathname))

(defun list-of-strings (pathspec)
  (let ((string-list (cl-ppcre:split "\\n\\n" (alexandria:read-file-into-string pathspec))))
    string-list))

(defun change-extension (src-file dest-dir extension)
  ;;(assert (cl-f:regular-file-exists-p src-file))
  ;;(assert (osicat:directory-exists-p dest-dir))
  (let ((file-name-wo-ext (pathname-name src-file)))
    (pathname (format nil "~a~a~a" dest-dir file-name-wo-ext extension))))
