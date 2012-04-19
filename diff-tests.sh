#!/bin/bash

SHOWTIME=${SHOWTIME:-}

# Diff the output of different ./run-tests.sh runs.  Useful for
# regression testing.
#
# To diff with times included set SHOWTIME, e.g.
#
#   SHOWTIME=t ./diff-tests.sh <test1> <test2>

l_file=$1
r_file=$2

function preprocess {
    if [[ -z $SHOWTIME ]]; then
        cut -f '1,3' -d , < $1
    else
        cat $1
    fi
}

# Sort by the filename and then by the leading +/-.  Can get a
# numeric sort on the run time with
#
#   sort -t, -k2,2n
diff -U0 <(preprocess $l_file) <(preprocess $r_file) \
| sort -k1.2,1 -k1.1,1.2
