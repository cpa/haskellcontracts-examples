#!/bin/bash

# Root of examples directory
egsDir="$(dirname "$0")"
# The relative path to Nathan's Check command
CHECK=${CHECK:-$egsDir/../haskellcontracts.git/contracts/Check}
TIMEOUT=${TIMEOUT:-10}

# Kill the whole testing process on Ctrl-C
trap 'exit 1' INT

# Run a test and report results
run-test () { 
    test="$1"
    passMsg="$2"
    timeoutMsg="$3"

    #z3 spawns many parallel processes and timeout.sh doesn't kill
    #them all.
    killall --user `whoami` z3 &>/dev/null

    "$egsDir"/timeout.sh $TIMEOUT "$CHECK" "$test" -q -p # --engine z3
    ret=$?
    printf "%-30s" "$test: "
    if [[ $ret -eq 0 ]]; then
        echo $passMsg
    # timeout.sh returns 124 on timeout
    elif [[ $ret -eq 124 ]]; then
        echo $timeoutMsg
    else
        echo FAILED WITH EXIT CODE $ret
    fi
}

main () {
    echo "Exit codes:"
    echo "  Equinox: 1 = \"Satisfiable\""
    echo "  Z3: 1 = error"
    echo

    echo Running tests hoped to pass \(unsatisfiable\)
    echo ===========================================
    echo
    for f in "$egsDir"/yes/*.hs; do
        run-test "$f" "passed" "TIMED OUT"
    done

    echo
    echo Running tests hoped to fail \(satisfiable\)
    echo =========================================
    echo
    for f in "$egsDir"/no/*.hs; do
        run-test "$f" "PASSED" "timed out"
    done
}

usage () {
    echo "usage: [TIMEOUT=<seconds>] [CHECK=<path>] $0 ( all | just <test> )" >&2
    echo
    cat <<EOF
TIMEOUT is the per test time limit and CHECK is the path to the Check
command.
EOF

    exit 1
}

if [[ ! -x "$CHECK" ]]; then
    usage
fi

echo TIMEOUT is $TIMEOUT
case $1 in
    all) main;;
    just) run-test "$2" "passed" "timed out";;
    *) usage;;
esac
