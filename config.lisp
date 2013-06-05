(in-package :millipode)

;;;; Main configuration Edit the pathspecs as appropriate

(define-constant +blog-content-dir+
  #P"/home/samuel/projects/samebchase.com/site/content/" :test #'fad:pathname-equal)

(define-constant +blog-webpage-dir+    
  #P"/home/samuel/projects/samebchase.com/site/p/" :test #'fad:pathname-equal)

(define-constant +blog-pode+
  (make-instance 'pode
                 :content-dir
                 (pathname-as-directory +blog-content-dir+)
                 :webpage-dir
                 (pathname-as-directory +blog-webpage-dir+)) :test #'pode-equal)

;;;; Optional configuration data for feeds

(define-constant +uri+          "http://www.samebchase.com/" :test #'string=)
(define-constant +title+        "Samuel Chase's archive"     :test #'string=)
(define-constant +author-name+  "Samuel Chase"               :test #'string=)
(define-constant +author-email+ "samebchase@gmail.com"       :test #'string=)
