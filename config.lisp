(in-package :millipode)

;;;; Edit the pathspecs as appropriate.
;;;; Directories must have a trailing slash.

(define-constant +blog-content-dir+
    #P"/home/samuel/projects/samebchase.com/site/content/" :test #'pathname-equal)
(define-constant +blog-webpage-dir+
    #P"/home/samuel/projects/samebchase.com/site/p/" :test #'pathname-equal)
(define-constant +blog-template-dir+
    #P"/home/samuel/projects/samebchase.com/site/templates/" :test #'pathname-equal)

(define-constant +blog-pode+
  (make-instance 'pode
                 :content-dir
                 (pathname-as-directory +blog-content-dir+)
                 :webpage-dir
                 (pathname-as-directory +blog-webpage-dir+)
                 :template-dir
                 (pathname-as-directory +blog-template-dir+))
  :test #'pode-equal)

;;;; Template file configuration

(define-constant +index-template-file+
    #P"post-index.template.html" :test #'pathname-equal)
(define-constant +post-template-file+
    #P"post.template.html"       :test #'pathname-equal)

;;;; The name of the executable program

(define-constant +image-file-name+ "pode" :test #'string=)

;;;; Optional configuration data for feeds

(define-constant +uri+          "http://www.samebchase.com/" :test #'string=)
(define-constant +title+        "Samuel Chase's archive"     :test #'string=)
(define-constant +author-name+  "Samuel Chase"               :test #'string=)
(define-constant +author-email+ "samebchase@gmail.com"       :test #'string=)
