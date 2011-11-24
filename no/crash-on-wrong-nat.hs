-- We wrongly assert that 'crashOnZero' is just like 'crashOnSucc', up
-- to swapping 'Zero' and 'Succ'.  This is wrong because 'Succ' may
-- contain a crashing subexpression that 'isZero' did not inspect.
-- cf. ../yes/crash-on-wrong-nat.hs.
import Lib.Arithmetic ;;
import Lib.Logic ;;

crashOnSucc x = case x of {
; Zero -> Zero
; Succ y -> bad
};;

crashOnZero x = case x of {
; Zero -> bad
; Succ y -> x
};;

{-# CONTRACT
crashOnSucc :::        {x:     isZero x}   -> CF
#-};;
-- Wrong!
{-# CONTRACT
crashOnZero :::        {x:not (isZero x)}  -> CF
#-};;