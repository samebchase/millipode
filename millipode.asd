(asdf:defsystem #:millipode
  :serial t
  :description "A blog-post generator."
  :author      "Samuel Chase"
  :license     "lol. :-)"
  :depends-on (#:alexandria
               #:cl-fad
               #:cl-who
               #:css-lite
	       #:cl-ppcre)
  :components ((:file "package")
	       (:file "utils")
	       (:file "style")
	       (:file "html-gen")
	       (:file "file-gen")
               (:file "millipode")))

