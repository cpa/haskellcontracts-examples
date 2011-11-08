data Nat = Zero 0
         | Succ 1;;

add x y = case x of
  | Zero -> y
  | Succ x_ -> Succ (add x_ y);;

mult a b = case a of
  | Zero -> Zero
  | Succ x -> add b (mult x b);;

notZero x = case x of
  | Zero -> False
  | Succ x_ -> True;;

