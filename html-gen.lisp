(in-package :millipode)

(setf (cl-who:html-mode) :html5)

(defun generate-post-index-html (pode)
  (with-existing-pode-slots pode
    (flet ((webpage (post)
             (file-namestring (corresponding-webpage-file pode post))))
    (let ((posts (ls content-dir)))
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
                             (loop for post in (reverse posts) do
                                  (htm (:p
                                        (:a :href
                                            (escape-string (webpage post))                                             
                                            (esc (get-post-title post))))))
                             (:div :id "filler")
                             (:div :id "footer"
                                   (:div :id "empty_box"))))))))))))

(defun gen-blog-post-html (file)
  (check-type file pathname)
  (let ((string-list (read-file-into-strings file "\\n\\n")))
    (with-html-output-to-string (*standard-output* nil :indent t :prologue t)
      (:html
        (:head
         (:link :href "../css/style.css" :rel "stylesheet" :type "text/css" :media "screen")
         (:link :rel "icon" :type "image/png" :href "../img/s.png")
         (:title (esc (get-post-title file))))
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
