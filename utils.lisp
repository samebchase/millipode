(in-package :millipode)

(defun list-files-with-extension (pathspec suffix)
  (loop for pathname in (cl-fad:list-directory pathspec)
       when (string= (pathname-type pathname) suffix) collect pathname))

(defun list-of-strings (pathspec)
  (let ((string-list (cl-ppcre:split "\\n\\n" (alexandria:read-file-into-string pathspec))))
    string-list))

(defun test-html (string-list)
  (cl-who:with-html-output (stream *standard-output* :indent t)
    (cl-who:htm
     (:body
      (loop for string in string-list do
	   (cl-who:htm (:p (cl-who:str string))))))))
					   
	   
    
