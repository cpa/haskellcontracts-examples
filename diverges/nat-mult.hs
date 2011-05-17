data Bool = True 0
          | False 0;;

data Nat = Zero 0 
         | Succ 1;;
                   
add a b = case a of
  | Zero -> b
  | Succ x -> Succ (add x b);;
  
mult a b = case a of
  | Zero -> Zero
  | Succ x -> add (mult x b) b;;
    
notZero x = case x of
  | Zero -> False
  | Succ a -> True;;

add ::: a:{x: notZero x} -> (b:{y: True} -> {z: notZero z});;