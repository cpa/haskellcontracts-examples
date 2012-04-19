#!/bin/bash

# Convert the output of ./run-tests.sh into a latex table by removing
# comments and blank lines and running through csv2latex.

# csv2latex can't read from stdin :P
t=$(tempfile -d /tmp)

sed -e '/^#/d' \
    -e '/^[ \t]*$/d' \
    -e 's/FAILED WITH EXIT CODE 1/Fail/' \
    -e 's/passed/Pass/' \
    -e 's/TIMED OUT/Time/' \
< $1 > $t

csv2latex --nohlines --novlines --colorrows=0.75 $t

rm $t