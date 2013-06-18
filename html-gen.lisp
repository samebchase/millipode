(in-package :millipode)

(defun generate-post-index-html (pode)
  "The post index HTML returned as a string."
  (with-existing-pode-slots pode
    (flet ((webpage (post)
             (file-namestring (corresponding-webpage-file pode post))))
      (let* ((template-file (merge-pathnames +index-template-file+ template-dir))
             (posts   (ls content-dir))
             (sstream (make-string-output-stream))
             (values  (list :posts
                            (loop for post in (reverse posts) collect
                                 (list :link-href (webpage post)
                                       :link-name (get-post-title post))))))
        (fill-and-print-template template-file values :stream sstream)
        (get-output-stream-string sstream)))))

(defun markdown-to-html (file)
  (check-type file pathname)
  (let ((sstream (make-string-output-stream)))
    (parse-string-and-print-to-stream
     (read-file-into-string file) sstream)
    (get-output-stream-string sstream)))

(defun generate-post-html (pode file)
  "A post's HTML returned as a string."
  (check-type file pathname)
  (with-existing-pode-slots pode
    (let* ((template-file (merge-pathnames +post-template-file+ template-dir))
           (sstream (make-string-output-stream))
           (values (list :title (get-post-title file)
                         :post  (markdown-to-html file)))
           (*string-modifier* #'identity))
      (fill-and-print-template template-file values :stream sstream)
      (get-output-stream-string sstream))))
