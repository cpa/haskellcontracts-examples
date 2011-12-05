#!/bin/bash

# Root of examples directory
egsDir="$(dirname "$0")"
# The relative path to Nathan's Check command. This is where check
# will be if you run `make egs` in the contracts dir of your
# haskellcontracts repo.
CHECK=${CHECK:-$egsDir/../src/hcc}
TIMEOUT=${TIMEOUT:-10}
OPTIONS=${OPTIONS:-"-q -k"}

# Kill the whole testing process on Ctrl-C
trap 'exit 1' INT

# Run a test and report results
run-test () {
    test="$1"
    passMsg="$2"
    timeoutMsg="$3"

    # z3 spawns many parallel processes and timeout.sh doesn't kill
    # them all.  XXX: Probably better to do this selectively, e.g. all
    # z3 processes with us as parent?
    killall --user `whoami` z3 &>/dev/null

    "$egsDir"/timeout.sh $TIMEOUT "$CHECK" "$test" $OPTIONS -i "$egsDir" # --engine vampire32 # --engine z3
    ret=$?
    printf "%-50s" "$test: "
    if [[ $ret -eq 0 ]]; then
        echo $passMsg
    # timeout.sh returns 124 on timeout
    elif [[ $ret -eq 124 ]]; then
        echo $timeoutMsg
    else
        echo FAILED WITH EXIT CODE $ret
    fi
}

# Find .hs files which aren't .tc.hs files, under $1.  Would be more
# modular to put the temp files in a temp file dir, and not have to
# filter them out here, but this is easier ...
skip-tc-temps () {
  root="$1"
  find "$root" -name '*.hs' -a ! -name '*.tc.hs' | sort
}

main () {
    echo "Exit codes:"
    echo "  Equinox: 1 = \"Satisfiable\""
    echo "  Z3: 1 = error"
    echo

    echo Running tests hoped to pass \(unsatisfiable\)
    echo ===========================================
    echo
    for f in `skip-tc-temps "$egsDir"/yes`; do
        run-test "$f" "passed" "TIMED OUT"
    done

    echo
    echo ... including tests needing -u 1
    echo ================================
    echo
    (
    OPTIONS="$OPTIONS -u 1"
    for f in `skip-tc-temps "$egsDir"/yes-u1`; do
        run-test "$f" "passed" "TIMED OUT"
    done
    )

    echo
    echo Running tests hoped to fail \(satisfiable\)
    echo =========================================
    echo
    for f in `skip-tc-temps "$egsDir"/no`; do
        run-test "$f" "PASSED" "timed out"
    done
}

usage () {
    echo "usage: [TIMEOUT=<seconds>] [CHECK=<path>] $0 ( all | just <test> )" >&2
    echo
    cat <<EOF
TIMEOUT is the per test time limit and CHECK is the path to the Check
command.

Examples:

1. Run a single test with a non-standard timeout of 35 seconds:

  \$ TIMEOUT=35 $0 just yes/add-and-mult-nonZero.hs

2. Run all tests with a non-standard check program:

  \$ CHECK=<path to check> $0 all

3. Run all test and save the results <file> for later comparison,
while watching them in real time:

  \$ $0 all | tee <file>

NB: running tests results in .tptp files containing formulas.  It can
be useful to feed these to Equinox manually and hand edit them while
debugging.

EOF

    exit 1
}

if [[ ! -x "$CHECK" ]]; then
    usage
fi

echo TIMEOUT = $TIMEOUT
echo OPTIONS = $OPTIONS
case $1 in
    all) main;;
    just) run-test "$2" "passed" "timed out";;
    *) usage;;
esac
