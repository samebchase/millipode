(asdf:defsystem #:millipode
  :serial t
  :description "A static site generator."
  :author      "Samuel Chase"
  :license     "BSD"
  :depends-on (#:alexandria
               #:cl-fad
               #:cl-who
               #:cl-ppcre)
  :components ((:file "package")
               (:file "pode")
               (:file "utils")
               (:file "config")
               (:file "html-gen")
               (:file "file-gen")
               (:file "millipode")))
