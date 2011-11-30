What you need
=============
* https://github.com/cpa/haskellcontracts. Clone that and run `make; make egs; make equinox`. The second `make` will pull in a copy of these examples.

Directories and files
=====================
* yes/: examples which we believe to be true.  This doesn't mean Equinox will refute our
generated formulas, but that's the ideal outcome.

* no/: examples which we believe to be false.  This doesn't mean Equinox will find a model for our generated formulas, but that's the ideal outcome.

* boring/: examples which are boring, or messed up, or ...

* run-tests.sh: script for running tests. See `./run-tests.sh -h` for usage and examples.

Why is this a separate repo?
============================

Because that makes it easier to test different versions of code with different versions of tests, independently.