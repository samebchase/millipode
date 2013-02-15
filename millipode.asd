(asdf:defsystem #:millipode
  :serial t
  :description "A blog-post generator."
  :author      "Samuel Chase"
  :license     "lol. :-)"
  :depends-on (#:alexandria
               #:cl-fad
               #:cl-who
               #:iterate
	       #:cl-ppcre)
  :components ((:file "package")
	       (:file "utils")
	       (:file "html-gen")
               (:file "millipode")))

