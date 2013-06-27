(in-package :millipode)

;;;; Directory configuration

(defparameter *site-content-dir*
  #P"/home/samuel/projects/samebchase.com/site/content/"
  "This directory should contain all the text files.")

(defparameter *site-webpage-dir*
  #P"/home/samuel/projects/samebchase.com/site/p/"
  "This directory is where the webpages should be generated in.")

(defparameter *site-template-dir*
  #P"/home/samuel/projects/samebchase.com/site/templates/"
  "The directory that contains the HTML templates.")

;;;; Template-file configuration

(defparameter *index-template-file*
  #P"post-index.template.html"
  "HTML template for the index of posts.")

(defparameter *post-template-file*
  #P"post.template.html"
  "HTML template for a post.")

;;;; Executable-image configuration

(defparameter *image-file-name* "pode"
  "The filename of the executable image")

(defparameter *site-pode*
  (make-instance
   'pode
   :content-dir
   (pathname-as-directory *site-content-dir*)
   :webpage-dir
   (pathname-as-directory *site-webpage-dir*)
   :template-dir
   (pathname-as-directory *site-template-dir*)
   :post-template-file
   (pathname-as-file      *post-template-file*)
   :index-template-file
   (pathname-as-file      *index-template-file*))
  "A pode object containing all the necessary
  information to generate webpages.")
