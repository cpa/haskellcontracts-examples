-- Note that 'crashOnZero' needs an additional 'CF'
-- constraint. cf. ../no/crash-on-wrong-nat.hs.
import Lib.Arithmetic ;;
import Lib.Logic ;;
import Lib.Prelude ;;

crashOnSucc x = case x of {
; Zero -> Zero
; Succ y -> bad
};;

crashOnZero x = case x of {
; Zero -> unr
; Succ y -> x
};;

{-# CONTRACT
crashOnSucc :::        {x:     isZero x}   -> CF
#-};;
{-# CONTRACT
crashOnZero ::: (CF && {x:not (isZero x)}) -> CF
#-};;