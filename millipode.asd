(asdf:defsystem #:millipode
  :serial t
  :description "A simple site generator."
  :author      "Samuel Chase"
  :license     "lol. :-)"
  :depends-on (#:alexandria
               #:cl-fad
               #:cl-who
			   #:cl-ppcre)
  :components ((:file "package")
			   (:file "utils")
			   (:file "html-gen")
			   (:file "file-gen")
               (:file "millipode")))

