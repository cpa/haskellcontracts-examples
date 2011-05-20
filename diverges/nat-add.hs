data Bool = True 0
          | False 0;;

data Nat = Zero 0 
         | Succ 1;;
                   
add a b = case a of
  | Zero -> b
  | Succ x -> Succ (add x b);;
    
notZero x = case x of
  | Zero -> False
  | Succ a -> True;;

not x = case x of
  | Zero -> True
  | Succ a -> False;;

add ::: a:{x: not (notZero x)} -> b:{y: not (notZero y)} -> {z: not (notZero z)};;
