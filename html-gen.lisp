(in-package :millipode)

(setf (cl-who:html-mode) :html5)

(defun generate-post-index-html (pode)
  (with-existing-pode-slots pode
    (flet ((index-page-p (webpage)
             (string= (pathname-name webpage) "index")))
      (let ((webpages (remove-if #'index-page-p (ls webpage-dir)))
            (posts    (ls content-dir)))
        (who:with-html-output-to-string (*standard-output* nil :indent t :prologue t)
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
                              (loop for webpage in (reverse webpages) for post in (reverse posts)
                                 do
                                   (who:htm (:p
                                             (:a :href (who:escape-string (file-namestring webpage))
                                                 (who:esc (get-post-title post))))))
                              (:div :id "filler")
                              (:div :id "footer"
                                    (:div :id "empty_box"))))))))))))

(defun gen-blog-post-html (file)
  (let ((string-list (read-file-into-strings file "\\n\\n")))
    (who:with-html-output-to-string (*standard-output* nil :indent t :prologue t)
      (:html
       (:head
        (:link :href "../css/style.css" :rel "stylesheet" :type "text/css" :media "screen")
        (:link :rel "icon" :type "image/png" :href "../img/s.png")
        (:title (who:esc (get-post-title file))))
       (:body
        (:div :id "container"
              (:div :id "header"
                    (:ul (:li (:a :href "../index.html" "home"))
                         (:li (:a :href "index.html" "archive"))))
              (:div :id "sidebar")
              (:div :id "content"
                    (:h3 (who:esc (first string-list)))
                    (loop for string in (rest string-list) do
                         (who:htm (:p (who:esc string)))))
              (:div :id "filler")
              (:div :id "footer")))))))
