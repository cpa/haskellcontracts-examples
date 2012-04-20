#!/bin/bash

# Convert the output of ./run-tests.sh into CSV format by removing
# comments and blank lines and relabeling the outcomes.

sed -e '/^#/d' \
    -e '/^[ \t]*$/d' \
    -e 's/FAILED WITH EXIT CODE 1/Fail/' \
    -e 's/passed/Pass/' \
    -e 's/TIMED OUT/Time/' \
