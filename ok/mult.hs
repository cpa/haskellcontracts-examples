data Bool = True 0
          | False 0;;

if x a b = case x of
  | True -> a
  | False -> b;;
if ::: a:{x:True} -> b:{y:True} -> c:{z:True} -> {w:True};;

and a b = case a of
  | True -> b
  | False -> False;;
and ::: a:{x:True} -> b:{y:True} -> {z:True};;

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
  
not x = case x of
  | True -> False
  | False -> True;;

add  ::: a:{x: True} -> b:{y: True} -> {z: True};;
mult ::: a:{x: True} -> b:{y: True} -> {z: if (and (notZero a) (notZero b)) (notZero z) True};;

