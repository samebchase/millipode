(in-package :millipode) 

(use-package :cl-who)

(setf (html-mode) :html5)

(defun generate-post-index-html (dir)
  (let ((file-list (ls dir)))
    (with-html-output-to-string (*standard-output* nil :indent t :prologue t)
      (:html
       (:head
	(:link :href "../css/style.css" :rel "stylesheet" :type "text/css" :media "screen")
	(:link :rel "icon" :type "image/png" :href "../img/s.png")
	(:title "archive"))
       (:body
	(:div :id "container"
	      (:div :id "header"
		    (:ul (:li (:a :href "../index.html" "home"))))
	      (:div :id "sidebar")
	      (:div :id "content" :style "border-bottom: 0px; min-height: 300px" ;; TODO: inline-css ugh.
		    (:h3 "archive")
		    (:div :id "index_links"
			  (loop for file in file-list 
			     unless (string= (pathname-name file) "index") do
			       (htm (:p
				     (:a :href
					 (escape-string (file-namestring file))
					 (esc (pathname-name file))))))))
	      (:div :id "filler")
	      (:div :id "footer"
		    (:div :id "empty_box"))))))))

(defun gen-blog-post-html (file)
  (let ((string-list (list-of-strings file "\\n\\n")))
    (with-html-output-to-string (*standard-output* nil :indent t :prologue t)
      (:html
       (:head
	(:link :href "../css/style.css" :rel "stylesheet" :type "text/css" :media "screen")
	(:link :rel "icon" :type "image/png" :href "../img/s.png")
	(:title (esc (pathname-name file))))
       (:body
	(:div :id "container"
	      (:div :id "header"
		    (:ul (:li (:a :href "../index.html" "home"))
			 (:li (:a :href "index.html" "archive"))))
	      (:div :id "sidebar")
	      (:div :id "content"
		    (:h3 (esc (first string-list)))
		    (loop for string in (rest string-list) do
			 (htm (:p (esc string)))))
	      (:div :id "filler")
	      (:div :id "footer")))))))
