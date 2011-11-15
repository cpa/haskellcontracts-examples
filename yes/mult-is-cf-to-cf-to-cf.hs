import Lib.Arithmetic ;;

-- NB: without this 'add' contract, the 'mult' contract proof times
-- out.  We need the 'add' contract as a lemma, and it requires
-- induction, so it can't be discovered.
{-# CONTRACT
add  ::: CF -> CF -> CF
#-};;
{-# CONTRACT
mult ::: CF -> CF -> CF
#-};;
