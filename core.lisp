(asdf:load-system :millipode)

(in-package :millipode)

(sb-ext:save-lisp-and-die "pode" :executable t :toplevel 'cli)
