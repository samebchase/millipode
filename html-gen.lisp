(in-package :millipode)

(setf (cl-who:html-mode) :html5)

(defun generate-index-html (dir)
  (let ((file-list (ls dir)))
    (cl-who:with-html-output-to-string (*standard-output* nil :indent t :prologue t)
      (cl-who:htm
       (:html
	(:head
	(:link :href "../css/style.css" :rel "stylesheet" :type "text/css" :media "screen")
	(:link :rel "icon" :type "image/png" :href "../img/s.png")
	(:title "index"))
       (:body
	(:h3 "posts")
	(cl-who:htm
	 (loop for file in file-list 
	    unless (string= (pathname-name file) "index") do
	      (cl-who:htm (:a :href file (cl-who:esc (pathname-name file))) :br)))))))))

(defun gen-blog-post-html (dir)
  (let ((string-list (list-of-strings dir)))
    (cl-who:with-html-output-to-string (*standard-output* nil :indent t :prologue t)
      (cl-who:htm
       (:html
	(:head
	 (:link :href "../css/style.css" :rel "stylesheet" :type "text/css" :media "screen")
	 (:link :rel "icon" :type "image/png" :href "../img/s.png")
	 (:title (cl-who:esc (first string-list))))
	(:body
	 (:article :class "post"
		   (:h3 (cl-who:esc (first string-list)))
		   (cl-who:htm
		    (loop for string in (rest string-list) do
			 (cl-who:htm (:p (cl-who:esc string))))))))))))
