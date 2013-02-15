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

(setf (cl-who:html-mode) :html5)

(defmacro string-who (string-list)
  `(loop for list in ,string-list
	collect `(:p ,list)))

(defun string-list->html (string-list)
  (cl-who:with-html-output-to-string (*standard-output* nil :indent t :prologue t)
    (cl-who:htm
     (:head
      (:link :href "../style/style.css" :rel "stylesheet" :type "text/css" :media "screen")
      (:link :rel "icon" :type "image/png" :href "../images/favicon.png")
      (:title (cl-who:esc (first string-list))))
      (:body
       (:article :class "post"
	(:h3 (cl-who:esc (first string-list)))
	(cl-who:htm
	 (loop for string in (rest string-list) do
	     (cl-who:htm (:p (cl-who:esc string))))))
       (:footer "Here be the footer of the page")))))



       
