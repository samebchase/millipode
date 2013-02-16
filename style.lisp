(in-package #:millipode)

(defun generate-base-css ()
  (let* ((grey "#cccccc")) 
  (css-lite:css-string

    ((:body)
     ((:width "42%")
      (:background-color grey)))

    )))
