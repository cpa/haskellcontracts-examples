data Bool = True 0
          | False 0;;

data Nat = Zero 0 
         | Succ 1;;
                   
add a b = case a of
  | Zero -> b
  | Succ x -> Succ (add x b);;
    
isZero x = case x of
  | Zero -> True
  | Succ a -> False;;

add ::: a:{x: isZero x} -> b:{y: isZero y} -> {z: isZero z};;
