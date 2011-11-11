data Nat = Zero 0
         | Succ 1;;

one = Succ Zero;;
two = Succ one;;

add x y = case x of
  | Zero -> y
  | Succ x_ -> Succ (add x_ y);;

mult a b = case a of
  | Zero -> Zero
  | Succ x -> add b (mult x b);;

notZero x = case x of
  | Zero -> False
  | Succ x_ -> True;;

isZero x = case x of
  | Zero -> True
  | Succ x_ -> False;;

eqNat x y = case x of
  | Zero -> isZero y
  | Succ x_ -> eqNatAux x_ y;;

eqNatAux x y = case y of
  | Zero -> False
  | Succ y_ -> eqNat x y_;;

gt x y = case x of
  | Zero -> False
  | Succ x_ -> gtAux x_ y;;

gtAux x y = case y of
  | Zero -> True
  | Succ y_ -> gt x y_;;
