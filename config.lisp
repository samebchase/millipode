(in-package :millipode)

;;;; Directory configuration

(define-constant +site-content-dir+
    #P"/home/samuel/projects/samebchase.com/site/content/"
    :test #'pathname-equal
    :documentation "This directory should contain all the text files.")

(define-constant +site-webpage-dir+
    #P"/home/samuel/projects/samebchase.com/site/p/"
    :test #'pathname-equal
    :documentation
    "This directory is where the webpages should be generated in.")

(define-constant +site-template-dir+
    #P"/home/samuel/projects/samebchase.com/site/templates/"
    :test #'pathname-equal
    :documentation "The directory that contains the HTML templates.")

;;;; Template-file configuration

(define-constant +index-template-file+
    #P"post-index.template.html"
    :test #'pathname-equal
    :documentation "HTML template for the index of posts.")

(define-constant +post-template-file+
    #P"post.template.html"
    :test #'pathname-equal
    :documentation "HTML template for a post.")

;;;; Executable-image configuration

(define-constant +image-file-name+ "pode"
  :test #'string=
  :documentation "The filename of the executable image")


(define-constant +site-pode+
  (make-instance 'pode
                 :content-dir
                 (pathname-as-directory +site-content-dir+)
                 :webpage-dir
                 (pathname-as-directory +site-webpage-dir+)
                 :template-dir
                 (pathname-as-directory +site-template-dir+))
  :test #'pode-equal
  :documentation "A pode object containing all the necessary
  information to generate webpages.")
