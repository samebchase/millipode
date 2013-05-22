# Millipode

A static site generator that makes you want to write - frequently.

## Dependencies

If you don't have [Quicklisp](http://www.quicklisp.org/) installed, you
will need to get these:

- [ASDF](http://common-lisp.net/project/asdf/): kinda like `make` for Lisp.
- [CL-WHO](http://weitz.de/cl-who/): for HTML output.
- [CL-FAD](http://weitz.de/cl-fad/): handling pathnames.
- [CL-PPCRE](http://weitz.de/cl-ppcre/): regular expressions.
- [Alexandria](http://common-lisp.net/project/alexandria/): commonly
  used utilities.

If you've got [Quicklisp](http://www.quicklisp.org/) installed, you
can type the following lisp form into a Common Lisp REPL:

`CL-USER> (ql:quickload '(cl-fad cl-who cl-ppcre alexandria))`

## Configuration

Change the values of `*blog-content-dir*` and `*blog-webpage-dir*` as
appropriate in `config.lisp`.

`*blog-content-dir*` is meant to be the directory containing text files.

`*blog-webpage-dir*` is meant to be the directory in which the HTML
files should be generated.

_Note:_ There should be a trailing slash for a directory
e.g. `#P"path/to/foo/"` instead of `#P"path/to/foo"`. You may also
need to ensure that those directories do actually exist.

Modify the structure of the generated HTML documents by editing the
relevant sections of `html-gen.lisp`.

Millipode will have to be rebuilt for the changes in `config.lisp` to
take effect.

## Post format

Eventually when [markdown-parser](https://github.com/samebchase) is
working well enough, I hope to use markdown as the format for writing
posts. For the time being, they have to be written in _plain_ plain
text. Links, images and code-blocks are among the first features that
I want to support.

Write your posts in this format and save them with a `.txt` file
extension in `*content-dir*`:

		Your title goes here

		This is some text in the first paragraph.

		This is some text in the second paragraph.

		etc.

## Portability

Millipode is currently known to build on:
- SBCL

## Building

### Step 1:

If you're in the `src` directory of Millipode, you can just do:

`CL-USER> (asdf:oos 'asdf:load-op :millipode)`

If you're not in the `src` directory of Millipode, you will have to
add Millipode's `src` path to ASDF's `*central-registry*` by:

`CL-USER> (push #P"/path/to/millipode/src/" asdf:*central-registry*)`

Once that's done, you can either do:

`CL-USER> (ql:quickload :millipode)` if you've got Quicklisp
installed, or:

`CL-USER> (asdf:oos 'asdf:load-op :millipode)` like before.

### Step 2:

`CL-USER> (in-package :millipode)` and then, once you're in the
package,

`MILLIPODE> (help)` to give you the built in documentation.

## Contributions

Contributions are most welcome.

These are the ways of helping out:

- Code: Make a pull request, or email patches.

- Testing: Bug reports. Early testers will be provided with free (!!)
  email/IRC support.

- Documentation: Let me know if anything is not described clearly in
  the documentation.

- Feature requests: If I think the feature is within the scope of
  millipode, and I think I can implement it, I will definitely do so.

## Known users of Millipode

- [Samuel Chase](http://www.samebchase.com/) :-)

Make a pull request if you want to be added here.
