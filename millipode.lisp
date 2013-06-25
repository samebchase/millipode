(in-package :millipode)

(define-constant +pode-functions+
    '(("gen"     . gen)
      ("help"    . help)
      ("clean"   . clean)
      ("index"   . index)
      ("status"  . status)
      ("gen-all" . gen-all))
  :test #'equal
  :documentation "The available millipode functions.")

(defun status ()
  "(status) returns NIL, when there is nothing to be done.

The three other statuses are: new, modified and orphaned.

[new]:

List of files in *CONTENT-DIR* which have not been generated into their
corresponding html files.

[modified]:

List of files in *CONTENT-DIR* that have been modified since the last
time their corresponding html files have been generated.

[orphaned]:

List of webpages in *WEBPAGE-DIR* for which a corresponding file in
CONTENT-DIR does not exist.
"
  (let ((modified (list-modified-content  +site-pode+))
        (new      (list-new-content       +site-pode+))
        (orphaned (list-orphaned-webpages +site-pode+)))
    (print-list-files "[new]" new)
    (print-list-files "[modified]" modified)
    (print-list-files "[orphaned]" orphaned)))

(defun gen ()
  "Generates new and modified posts. It updates the index, if necessary."
  (generate-new-posts      +site-pode+)
  (generate-modified-posts +site-pode+))

(defun gen-all ()
  "Generates all posts and updates the index."
  (generate-all-posts +site-pode+))

(defun clean ()
  "Deletes orphaned webpages and updates the index."
  (delete-orphaned-webpages +site-pode+))

(defun index ()
  "
Updates the index.

You normally won't need to run this, unless you really want to
generate the index again.
"
  (generate-post-index +site-pode+))

(defun help ()
  "Lists available commands"
  (format t "[Available commands]: help, status, gen, clean, gen-all and index. ~%"))

(defun cli ()
  (let* ((arg           (second (cmd-line-args)))
         (pode-function (cdr (assoc arg +pode-functions+ :test #'equal))))
    (if pode-function
        (funcall pode-function)
        (help))
    (cli-quit)))

(defun make-executable-image ()
  #+sbcl    (sb-ext:save-lisp-and-die +image-file-name+ :toplevel          'cli :executable t)
  #+clozure (ccl:save-application     +image-file-name+ :toplevel-function 'cli :prepend-kernel t)
  #+clisp   (ext:saveinitmem          +image-file-name+ :init-function     'cli :executable t :quiet t)
)
