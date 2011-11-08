import "../lib/arithmetic.hs"

-- NB: without this 'add' contract, the 'mult' contract proof times
-- out.  We need the 'add' contract as a lemma, and it requires
-- induction, so it can't be discovered.
add  ::: CF -> CF -> CF;;
mult ::: CF -> CF -> CF;;
