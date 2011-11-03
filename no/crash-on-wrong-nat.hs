-- We wrongly assert that 'crashOnZero' is just like 'crashOnSucc', up
-- to swapping 'Zero' and 'Succ'.  This is wrong because 'Succ' may
-- contain a crashing subexpression that 'isZero' did not inspect.
-- cf. ../yes/crash-on-wrong-nat.hs.
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
-- Wrong!
crashOnZero :::        {x:not (isZero x)}  -> CF;;