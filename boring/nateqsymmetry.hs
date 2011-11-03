-- NC doesn't understand this test.  The contract on 'eq' makes no
-- sense.
data Nat = Zero 0
         | Succ 1;;
                   
eq x y = case x of
  | Zero -> isZero y
  | Succ a -> aux a y;;
    
aux a y = case y of
  | Zero -> False
  | Succ b -> eq a b;;

isZero y = case y of
  | Zero -> True
  | Succ z -> False;;
    
eq ::: CF -> CF -> (CF && {z: eq z (eq y x)});;
aux ::: CF -> CF -> CF;;

