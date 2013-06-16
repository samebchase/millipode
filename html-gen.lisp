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

(defun markdown-to-html (file)
  (let ((sstream (make-string-output-stream)))
    (parse-string-and-print-to-stream
     (read-file-into-string file) sstream)
    (get-output-stream-string sstream)))

(defun gen-blog-post-html (pode file)
  "A post's HTML generated as a string."
  (check-type pode pode)
  (check-type file pathname)
  (with-existing-pode-slots pode
    (let* ((template-file (make-pathname :name "post.template"
                                         :type "html"
                                         :defaults template-dir))
           (sstream (make-string-output-stream))
           (values (list :title (get-post-title file)
                         :post  (markdown-to-html file)))
           (*string-modifier* #'identity))
      (fill-and-print-template template-file values :stream sstream)
      (get-output-stream-string sstream))))
