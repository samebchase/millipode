(in-package :millipode)

(defun split-date-name-file-ext (pathspec)
  "#P\"1984-04-15-post-name.html\" => \"1984-04-15\" \"post-name\" \"html\""
  (let ((date-post-name (file-namestring pathspec))
        (regex "^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.+)\\.(.+)$"))
    (ppcre:register-groups-bind
        (date post-name file-ext)
        (regex date-post-name)
      (values date post-name file-ext))))

(defun get-post-title (filespec)
  (assert (regular-file-exists-p filespec))
  (flet ((get-first-line (filespec)
           (with-open-file (stream filespec)
             (read-line stream))))
    (get-first-line filespec)))
