(in-package :millipode)

(defclass pode ()
  ((content-dir :accessor content-dir :initarg :content-dir)
   (webpage-dir :accessor webpage-dir :initarg :webpage-dir))
  (:documentation
   "A pode is a simple compound type consisting of two pathspecs
content-dir and webpage-dir. content-dir is the directory containing
text files and webpage-dir is where the the html files should be
generated."))

(defmethod print-object ((pode pode) stream)
  (format stream "Content directory: ~a~%Webpage directory: ~a"
		  (content-dir pode) (webpage-dir pode)))

(defun pode-equal (pode-a pode-b)
  (and (fad:pathname-equal (content-dir pode-a) (content-dir pode-b))
       (fad:pathname-equal (webpage-dir pode-a) (webpage-dir pode-b))))
       

