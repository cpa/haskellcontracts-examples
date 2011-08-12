data Bool = True 0
          | False 0;;

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
                                                                     
notZero ::: a:{x:True} -> {y: True};;
add  ::: a:{x: True} -> b:{y: True} -> {z: True};;
add  ::: a:{x: notZero x} -> b:{y: True} -> {z: True};;
mult ::: a:{x: notZero x} -> b:{y: notZero y} -> {z: True};;