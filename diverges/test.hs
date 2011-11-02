data Nat = Zero 0 
         | Succ 1;;
                   
add a b = case a of
  | Zero -> b
  | Succ x -> Succ (add x b);;
  
mult a b = case a of
  | Zero -> Zero
  | Succ x -> add b (mult x b);;
    
gt x y = case x of
  | Zero -> iszero y
  | Succ a -> aux a y;;
  
minusOne x = case x of
  | Zero -> BAD
  | Succ y -> y;;

aux x y = case y of
  | Zero -> True
  | Succ a -> gt x (minusOne y);;

notzero x = case x of
  | Zero -> False
  | Succ a -> True;;
  
or a b = case a of
  | True -> True
  | False -> b;;

minusOne ::: a:{x:notZero x} -> {y:True};;
gt ::: a:{x:True} -> b:{y:True} -> {z:True};;
aux ::: a:{x:True} -> b:{y:True} -> {z:True};;
notzero ::: a:{x:True} -> {y:True};;

add  ::: a:{x: True} -> b:{y: True} -> {z: gt z a};;
add  ::: a:{x: True} -> b:{y: True} -> {z: gt z b};;
add  ::: a:{x: notzero x} -> b:{y: notzero y} -> {z: gt z a};;
add  ::: a:{x: notzero x} -> b:{y: notzero y} -> {z: gt z b};;

mult ::: a:{x: True} -> b:{y: True} -> {z: or (gt z a) (gt z b)};;
