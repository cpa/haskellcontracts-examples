-- The example from the paper that needs one unrolling.
import Lib.Arithmetic ;;

f x = case x of {
; Zero -> True
;  Succ x_ -> f x_
};;
{-# CONTRACT
f ::: (CF&&{x: x `eqNat` (Succ Zero)}) -> {y:y} 
#-};;
