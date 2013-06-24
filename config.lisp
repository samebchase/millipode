(in-package :millipode)

;;;; Edit the pathspecs as appropriate.
;;;; Directories must have a trailing slash.

(define-constant +site-content-dir+
    #P"/home/samuel/projects/samebchase.com/site/content/" :test #'pathname-equal)
(define-constant +site-webpage-dir+
    #P"/home/samuel/projects/samebchase.com/site/p/" :test #'pathname-equal)
(define-constant +site-template-dir+
    #P"/home/samuel/projects/samebchase.com/site/templates/" :test #'pathname-equal)

;;;; HTML template configuration

(define-constant +index-template-file+
    #P"post-index.template.html" :test #'pathname-equal)
(define-constant +post-template-file+
    #P"post.template.html"       :test #'pathname-equal)

;;;; The name of the executable program
(define-constant +image-file-name+ "pode" :test #'string=)

(define-constant +site-pode+
  (make-instance 'pode
                 :content-dir
                 (pathname-as-directory +site-content-dir+)
                 :webpage-dir
                 (pathname-as-directory +site-webpage-dir+)
                 :template-dir
                 (pathname-as-directory +site-template-dir+))
  :test #'pode-equal)
