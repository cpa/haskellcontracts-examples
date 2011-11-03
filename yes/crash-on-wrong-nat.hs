-- Note that 'crashOnZero' needs an additional 'CF'
-- constraint. cf. ../no/crash-on-wrong-nat.hs.
data Nat = Zero 0
         | Succ 1;;

crashOnSucc x = case x of
  | Zero -> Zero
  | Succ y -> BAD;;

crashOnZero x = case x of
  | Zero -> BAD
  | Succ y -> x;;

isZero x = case x of
  | Zero -> True
  | Succ a -> False;;

not x = case x of
  | True -> False
  | False -> True;;

crashOnSucc :::        {x:     isZero x}   -> CF;;
crashOnZero ::: (CF && {x:not (isZero x)}) -> CF;;