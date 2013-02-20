Millipode
=========

A static site generator.

# Configuration

Change the values of the variables *content-dir* and *webpage-dir* as
appropriate in millipode.lisp.

## Building

It has currently only been tested with SBCL, so get into the REPL in
the src directory and do:

## Step 1.

CL-USER> (asdf:oos 'asdf:load-op :millipode)

or

CL-USER> (require :millipode)


## Step 2.

CL-USER> (in-package :millipode)


Use (gen), (status) or (gen-all) as necessary.


You might need to first install asdf on other implementations, as that
is required.






