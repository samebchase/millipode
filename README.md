# Millipode

A static site generator that makes you want to write - frequently.

## Configuration

Change the values of `+site-content-dir+` and `+site-webpage-dir+` as
appropriate in `config.lisp`.

- `+site-content-dir+` is meant to be the directory containing text
  files.

- `+site-webpage-dir+` is meant to be the directory in which the HTML
  files should be generated.

- `+site-template-dir+` is meant to be the directory containing the HTML
templates.

- `+index-template-file+` a path to a HTML template for the posts
  index page.

- `+post-template-file+` a path to a HTML template for the posts.

_Note:_ There should be a trailing slash for a directory
e.g. `#P"path/to/foo/"` instead of `#P"path/to/foo"`. You may also
need to ensure that those directories do actually exist.

Modify the structure of the generated HTML documents by editing the
relevant sections of `html-gen.lisp`.

Millipode will have to be rebuilt for the changes in `config.lisp` to
take effect.

## Building

Millipode is currently known to build on:

- SBCL 1.1.7
- CCL 1.9-r15757
- CLISP 2.49
- ECL 12.12.1
- ABCL 1.1.1

You'll need to first install [Quicklisp](http://www.quicklisp.org/).

After Quicklisp is installed:

1. Clone this repository into the `~/quicklisp/local-projects/`
directory by: `git clone https://github.com/samebchase/millipode.git
~/quicklisp/local-projects/`

2. `CL-USER> (ql:quickload :millipode)`

Quicklisp will pull in all the dependencies of Millipode, and then
build it.

3. That's it! You are now ready to use Millipode.

## Running

After Millipode has been built, it can be used from the REPL and
optionally, as a standalone executable.

Do `CL-USER> (in-package :millipode)` to get into the `:millipode`
package (i.e. namespace). If you don't do this, every command has to
be prefixed with the package name e.g. `CL-USER> (millipode:help)`.

### REPL

You now have access to all of Millipode's functionality.

Try `MILLIPODE> (help)` to start exploring.

### Command-line

Instead of using Millipode from the REPL, you may instead prefer to
use it as a command-line program.

Making executable images is supported on the following
implementations:

1. SBCL
2. CLISP
3. CCL

To make the executable image:

`MILLIPODE> (make-executable-image)`

This will create an executable image in the current working directory
with a name specified by `+image-file-name+` in `config.lisp`.

This executable image can be put in your `$PATH` e.g. in `~/bin/`.

For example, if `+image-file-name+` is `"pode"` you can use Millipode by:
`$ ./pode help`

## Usage

### Quickstart

Edit config.lisp as appropriate and then:

    CL-USER> (ql:quickload :millipode)
    T
    CL-USER> (in-package :millipode)

    PODE> (status)
    ...
    PODE> (gen)

### Functionality

Millipode's core functionality is in these five functions:

* `(gen)`: Generates the html webpages for the new and modified posts in
  `+site-content-dir+`. Updates the index, if necessary.

* `(gen-all)`: Generate everything. Not usually necessary, in normal
  usage of Millipode.

* `(status): Prints whether there are any new or modified posts in
  `+site-content-dir+`.

* `(index): Generates the index.

* `(clean): Deletes files from `+site-webpage-dir+` that don't have a
  corresponding content post in `+site-content-dir+`.

## Post format

Write your posts in Markdown, with the title on the first line. To get
reverse-chronological ordering of posts, save them as
`yyyy-mm-dd-post-name.txt` in `+content-dir+`:

		Your title goes here

		This is some text in the first paragraph.

		This is some text in the second paragraph.

		etc.

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