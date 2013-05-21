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

`*webpage-dir*` is the directory in which the HTML files should be
generated.

Change the values of `*content-dir*` and `*webpage-dir*` as
appropriate in `millipode.lisp`. You may also need to ensure that those
directories do actually exist.

You might also want to modify the structure of the generated HTML
documents by editing the relevant sections of `html-gen.lisp`.

## Post format

Eventually when [markdown-parser](https://github.com/samebchase) is
working well enough, I hope to use markdown as the format for writing
posts. For the time being, they have to be written in _plain_ plain
text.

Write your posts like in this format and place them in
`*content-dir*`:

`
Your title goes here

This is some text in the first paragraph.

This is some text in the second paragraph.

etc.
`

## Portability

Millipode is currently known to build on:
- SBCL

## Building

### Step 1.

If you're in the `src` directory of Millipode, you can just do:

`CL-USER> (asdf:oos 'asdf:load-op :millipode)`

If you're not in the `src` directory of Millipode, you will have to
add the path to ASDF's `*central-registry*` by:

`CL-USER> (push #P"/path/to/millipode/src/" asdf:*central-registry*)`

Once that's done, you can either do:

`CL-USER> (ql:quickload :millipode)` if you've got Quicklisp installed, or:

`CL-USER> (asdf:oos 'asdf:load-op :millipode)` like before.

### Step 2.

`CL-USER> (in-package :millipode)`

`CL-USER> (help)` to give you the built in documentation.

### Known users of Millipode

- [Samuel Chase](http://www.samebchase.com/) :-)