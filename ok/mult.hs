data Nat = Zero 0 
         | Succ 1;;
                   
add a b = case a of
  | Zero -> b
  | Succ x -> Succ (add x b);;

mult a b = case a of
  | Zero -> Zero
  | Succ x -> add (mult x b) b;;

add  ::: CF -> CF -> CF;;
mult ::: CF -> CF -> CF;;

