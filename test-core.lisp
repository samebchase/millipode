(asdf:load-system :millipode)

(in-package :millipode)

#+sbcl    (sb-ext:save-lisp-and-die +image-file-name+ :toplevel          'cli :executable t)
#+clisp   (ext:saveinitmem          +image-file-name+ :init-function     'cli :executable t :quiet t)
#+clozure (ccl:save-application     +image-file-name+ :toplevel-function 'cli :prepend-kernel t)

