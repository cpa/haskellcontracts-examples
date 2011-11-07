data Tree = Leaf 0
          | Node 3;;
                    
data Nat = Zero 0
         | Succ 1;;
  
height t = case t of
  | Leaf -> Zero
  | Node l x r -> Succ (max (height l) (height r));;
  
max a b = case (ge a b) of
  | True -> a
  | False -> b;;
    
ge x y = case x of
  | Zero -> isZero y
  | Succ x_ -> ge_ x_ y;;
  
ge_ x y = case y of
  | Zero -> True
  | Succ y_ -> ge x y_;;

isZero x = case x of
  | Zero -> True
  | Succ a -> False;;

ge  ::: CF -> CF -> CF;;
ge_ ::: CF -> CF -> CF;;
max ::: CF -> CF -> CF;;
-- Could we weaken the precondition to '{x: isZero x `or` isSucc x}' ?
isZero ::: CF -> CF;;
height ::: CF -> CF;;