Millipode
=========

A static site generator.

## Configuration

Change the values of *content-dir* and *webpage* dir as appropriate.

## Building

It has currently only been tested with SBCL, so get into the REPL in
the src directory and do:

(asdf:oos 'asdf:load-op :millipode) or

(require :millipode)

You might need to first install asdf on other implementations.






