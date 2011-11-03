-- Predicate contracts describing when 'add' and 'mult' return
-- non-zero.
--
-- Note the '{y:True}' (i.e. 'Any') contract on 'add's second
-- argument.  We can't do the same for 'mult's second argument.
-- cf. ../no/add-and-mult-nonZero.hs.
data Nat = Zero 0
         | Succ 1;;

add a b = case a of
  | Zero -> b
  | Succ x -> Succ (add x b);;

mult a b = case a of
  | Zero -> Zero
  | Succ x -> add b (mult x b);;

notZero x = case x of
  | Zero -> False
  | Succ a -> True;;

add  ::: {x:notZero x} -> {y:True}      -> {z:notZero z};;
mult ::: {x:notZero x} -> {y:notZero y} -> {z:notZero z};;
