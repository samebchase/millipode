(in-package :millipode)

(defun ls (dir)
  (list-directory dir))

(defun list-by-extension (dir ext)
  (loop for file in (ls dir)
     when (string= (pathname-type file) ext)
     collect file))

(defun list-modified-content (pode)
  "Lists the text files that are newer than their corresponding
generated html files."
  (with-existing-pode-slots pode
    (loop for file in (ls content-dir)
       when (and (generated-webpage-p pode file)
                 (content-post-newerp pode file 2))
       collect file)))

(defun corresponding-webpage-file (pode post-text-file)
  (assert (file-exists-p post-text-file))
  (with-existing-pode-slots pode
    (make-pathname :name (pathname-name post-text-file)
                   :type "html"
                   :defaults webpage-dir)))

(defun corresponding-text-file (pode webpage-file)
  (assert (file-exists-p webpage-file))
  (with-existing-pode-slots pode
  (make-pathname :name (pathname-name webpage-file)
                 :type "txt"
                 :defaults content-dir)))

(defun list-new-content (pode)
  (with-existing-pode-slots pode
    (loop for file in (ls content-dir)
       unless (generated-webpage-p pode file)
       collect file)))

(defun list-orphaned-webpages (pode)
  "Lists the webpages from webpage-dir that do not have a
corresponding file in content-dir."
  (with-existing-pode-slots pode
    (let ((webpages (ls webpage-dir)))
      (loop for webpage in webpages unless
           (or (file-exists-p (corresponding-text-file pode webpage))
               (string= (pathname-name webpage) "index"))
         collect webpage))))

(defun generated-webpage-p (pode content-file)
  "Predicate that tests whether a text-file's corresponding webpage
has been generated."
  (assert (file-exists-p content-file))
  (with-existing-pode-slots pode
    (file-exists-p (corresponding-webpage-file pode content-file))))

(defun content-post-newerp (pode post-text-file delay)
  (let ((generated-webpage
         (corresponding-webpage-file pode post-text-file)))
    (assert (and (file-exists-p post-text-file)
                 (file-exists-p generated-webpage)))
    (> (file-mod-time-diff post-text-file generated-webpage) delay)))

(defun regular-file-exists-p (pathspec)
  (and (file-exists-p pathspec)
       (not (directory-pathname-p pathspec))))

(defun file-mod-time-diff (file-a file-b)
  "Returns the difference in seconds of the last-modified time."
  (assert (and (file-exists-p file-a)
               (file-exists-p file-b)))
  (- (file-write-date file-a)
     (file-write-date file-b)))

(defun delete-orphaned-webpages (pode)
  "Deletes orphaned webpages and updates the index, if necessary."
  (let ((orphans (list-orphaned-webpages pode)))
    (map nil #'delete-file orphans)
    (print-list-files "[deleted]" orphans)
    (when orphans
      (generate-post-index pode))))

(defun delete-files-in-dir (pathspec)
  "Deletes all regular files in directory."
  (assert (directory-exists-p pathspec))
  (loop for file in (ls pathspec) do
       (when (not (directory-pathname-p file))
         (delete-file file))))

(defun print-list-files (string list)
  (unless (null list)
    (format t "~a: ~{~a~%~}" string list)))

(defun cmd-line-args ()
  (or
   #+clisp (coerce (ext:argv) 'list)
   #+sbcl sb-ext:*posix-argv*
   #+clozure (ccl::command-line-arguments)
   nil))

(defun cli-quit ()
  #+sbcl    (sb-ext:exit)
  #+clozure (ccl:quit)
  #+clisp   (ext:quit)
  )

(defun new-post (pode post-name)
  (with-existing-pode-slots pode
    (let* ((today (register-groups-bind (date)
                    ("^([0-9]{4}-[0-9]{2}-[0-9]{2}).*$" (to-rfc3339-timestring (now)))
                   date))
           (filename (concatenate 'string today "-" post-name ".txt")))
      (merge-pathnames filename content-dir))))
      
