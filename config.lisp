(in-package :millipode)

(defparameter *blog-content-dir*
  #P"/home/samuel/projects/samebchase.com/site/content/")

(defparameter *blog-webpage-dir*
  #P"/home/samuel/projects/samebchase.com/site/p/")

(defparameter *blog-pode*
  (make-instance 'pode
                 :content-dir
                 (fad:pathname-as-directory *blog-content-dir*)
                 :webpage-dir
                 (fad:pathname-as-directory *blog-webpage-dir*)))
