(in-package :millipode)

;;;; Edit the pathspecs as appropriate

(alexandria:define-constant +blog-content-dir+
  #P"/home/samuel/projects/samebchase.com/site/content/" :test #'fad:pathname-equal)

(alexandria:define-constant +blog-webpage-dir+    
  #P"/home/samuel/projects/samebchase.com/site/p/" :test #'fad:pathname-equal)

(alexandria:define-constant +blog-pode+
  (make-instance 'pode
                 :content-dir
                 (fad:pathname-as-directory +blog-content-dir+)
                 :webpage-dir
                 (fad:pathname-as-directory +blog-webpage-dir+)) :test #'pode-equal)
