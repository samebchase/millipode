(in-package :millipode)

(defun status ()
  "
(status) returns NIL, when there is nothing to be done.

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
  (let ((modified (list-modified-content  +blog-pode+))
        (new      (list-new-content       +blog-pode+))
        (orphaned (list-orphaned-webpages +blog-pode+)))
    (print-list-files "[new]" new)
    (print-list-files "[modified]" modified)
    (print-list-files "[orphaned]" orphaned)))

(defun gen ()
  "Generates new and modified posts. It updates the index, if necessary."
  (generate-new-posts      +blog-pode+)
  (generate-modified-posts +blog-pode+))

(defun gen-all ()
  "Generates all posts and updates the index."
  (generate-all-posts +blog-pode+))

(defun clean ()
  "Deletes orphaned webpages and updates the index."
  (delete-orphaned-webpages +blog-pode+))

(defun index ()
  "
Updates the index.

You normally won't need to run this, unless you've changed the titles
of one of the posts, and you want the index to reflect that.
"
  (generate-post-index +blog-pode+))

(defun help ()
  "Lists available commands"
  (format t 
          "[commands]: '(help status gen clean gen-all index)

Evaluate \"(describe '<command>)\", e.g. \"(describe 'status)\" for more information."))
