-- Not sure this is actually interesting ... but recurses on one
-- argument and returns the other.
data Nat = Zero 0
         | Succ 1;;
                   
slowConst c n = case n of
  | Zero -> c
  | Succ a -> slowConst c a;;

slowConst ::: CF -> CF -> CF;;

