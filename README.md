Millipode
=========

A static site generator.

## Configuration

Change the values of *content-dir* and *webpage* dir as appropriate.

## Building

It has currently only been tested with SBCL, so get into the REPL in
the src directory and do:

# Step 1.
'''
(asdf:oos 'asdf:load-op :millipode)

or

(require :millipode)
'''

# Step 2.

'''
(in-package :millipode)
'''

Use (gen), (status) or (gen-all) as necessary.


You might need to first install asdf on other implementations, as that
is required.






