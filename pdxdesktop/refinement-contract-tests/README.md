Testing variations on the refinement contract translation
=========================================================

All tests were run with a timeout of 100. The file names are labeled
with the total run times.  I ran some tests multiple times, and the
run time on the same test varied by ~5 seconds.

The refinement translations are

    [| e ::: {x|p} |]+ = min(e) /\ min(p[e/x]) -> (e /= unr -> memP)
    [| e ::: {x|p} |]- = min(e) -> min(p[e/x]) /\ (e /= unr -> memM)

and here I'm varying the membership checks (memP and memM).

The membership check possibilities are

* plainP := e not in {False,BAD}
* plainM := e     in {True,UNR}

and the variations tested here are

* normal: memP = plainP, memM = plainM, total = 6.48

* swapped: memP = plainM, memM = plainP, total = 7:52

* plainMBoth: memP = memM = plainM, total = 5:26

* plainPBoth: memP = memM = plainP, total = 7:26

The conclusion is that our intuition was bad: the plainMBoth variation
is significantly faster than the other variations, and performs as
well as the best of them (normal).
