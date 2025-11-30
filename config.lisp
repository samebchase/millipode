(in-package :millipode)

;;;; Directory configuration

(define-constant +site-content-dir+
    #P"/home/samuel/projects/samebchase.com/content/"
    :test #'pathname-equal
    :documentation "This directory should contain all the text files.")

(define-constant +site-webpage-dir+
    #P"/home/samuel/projects/samebchase.com/p/"
    :test #'pathname-equal
    :documentation
    "This directory is where the webpages should be generated in.")

(define-constant +site-template-dir+
    #P"/home/samuel/projects/samebchase.com/templates/articles/"
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

;;; Configuration for the notes

(define-constant +notes-content-dir+
    #P"/home/samuel/projects/samebchase.com/notes/"
    :test #'pathname-equal
    :documentation "This directory should contain all the text files for the notes.")

(define-constant +notes-webpage-dir+
    #P"/home/samuel/projects/samebchase.com/n/"
    :test #'pathname-equal
    :documentation
    "This directory is where the notes webpages should be generated in.")

(define-constant +notes-template-dir+
    #P"/home/samuel/projects/samebchase.com/templates/notes/"
    :test #'pathname-equal
    :documentation "The directory that contains the HTML templates for the notes.")

(define-constant +notes-pode+
    (make-instance 'pode
		   :content-dir
		   (uiop:pathname-directory-pathname +notes-content-dir+)
		   :webpage-dir
		   (uiop:pathname-directory-pathname +notes-webpage-dir+)
		   :template-dir
		   (uiop:pathname-directory-pathname +notes-template-dir+)))
