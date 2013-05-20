# Millipode

A static site generator.

## Dependencies

If you don't have [Quicklisp](http://www.quicklisp.org/) installed, you
will need to get these:

- [ASDF](http://common-lisp.net/project/asdf/)
- [CL-WHO](http://weitz.de/cl-who/)
- [CL-FAD](http://weitz.de/cl-fad/)
- [CL-PPCRE](http://weitz.de/cl-ppcre/)
- [Alexandria](http://common-lisp.net/project/alexandria/)

If you've got [Quicklisp](http://www.quicklisp.org/) installed just do:

`CL-USER> (ql:quickload '(cl-fad cl-who cl-ppcre alexandria))`

## Configuration

`*content-dir*` is the directory containing text files.

`*webpage-dir*` is the directory in which the html files should be
generated.

Change the values of `*content-dir*` and `*webpage-dir*` as
appropriate in millipode.lisp. You may also need to ensure that those
directories do actually exist.

You might also want to modify the structure of the generated html
documents by editing the relevant sections of `html-gen.lisp`

## Portability

Millipode is currently known to build on:
- SBCL

## Building

### Step 1.

`CL-USER> (asdf:oos 'asdf:load-op :millipode)`

You can also do `(ql:quickload 'millipode)` if you put Millipode where
Quicklisp places all its dists. This directory will be somewhere in
the `quicklisp` directory created by Quicklisp.

### Step 2.

`CL-USER> (in-package :millipode)`

`CL-USER> (help)` to give you the built in documentation.