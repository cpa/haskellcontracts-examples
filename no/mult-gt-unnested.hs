import Lib.Arithmetic ;;
import Lib.Logic ;;


gt1 x y = case x of {
  ; Zero -> False
  ; Succ x_ -> gtAux1 x_ y
  } ;;

gtAux1 x_ y = case y of {
  ; Zero -> True
  ; Succ y_ -> gt1 x_ y_
  };;

-- Not true, e.g. 'positive 1' and 'CF 1' and '1 = 1 * 1' but not 'gt 1 1'.
{-# CONTRACT
mult ::: x:CF -> y:CF -> {z: implies (and (not (isZero x)) (not (isZero y)))
                                     (and (gt1 z x)     (gt1 z y))}
#-};;