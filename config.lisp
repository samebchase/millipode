(in-package :millipode)

;;;; Edit the pathspecs as appropriate

(defconstant +blog-content-dir+
  #P"/home/samuel/projects/samebchase.com/site/content/")

(defconstant +blog-webpage-dir+
  #P"/home/samuel/projects/samebchase.com/site/p/")

(defconstant +blog-pode+
  (make-instance 'pode
                 :content-dir
                 (fad:pathname-as-directory +blog-content-dir+)
                 :webpage-dir
                 (fad:pathname-as-directory +blog-webpage-dir+)))
