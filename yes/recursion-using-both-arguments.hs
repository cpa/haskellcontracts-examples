-- Not sure this is actually interesting ... but recurses on one
-- argument and returns the other.
import Lib.Prelude ;;
                   
slowConst c n = case n of {
; Zero -> c
; Succ a -> slowConst c a
};;

{-# CONTRACT
slowConst ::: CF -> CF -> CF
#-};;
