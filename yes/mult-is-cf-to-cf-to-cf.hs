data Nat = Zero 0 
         | Succ 1;;
                   
add a b = case a of
  | Zero -> b
  | Succ x -> Succ (add x b);;
  
mult a b = case a of
  | Zero -> Zero
  | Succ x -> add b (mult x b);;

mult ::: CF -> CF -> CF;;
