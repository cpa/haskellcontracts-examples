data Nat = Zero 0 
         | Succ 1;;
                   
add a b = case a of
  | Zero -> b
  | Succ x -> Succ (add x b);;
  
mult a b = case a of
  | Zero -> Zero
  | Succ x -> add (mult x b) b;;
    
notzero x = case x of
  | Zero -> False
  | Succ a -> True;;

fac n = case n of
  | Zero -> Succ Zero
  | Succ a -> mult n (fac a);;

gtzero x = notzero x;;

minusOne x = case x of
  | Zero -> BAD
  | Succ y -> y;;

gt x y = case x of
  | Zero -> iszero y
  | Succ a -> aux a y;;
  
aux x y = case y of
  | Zero -> True
  | Succ a -> gt x (minusOne y);;

iszero x = case x of
  | Zero -> True
  | Succ a -> False;;

or a b = case a of
  | True -> True
  | False -> b;;

implies a b = case a of
  | False -> True
  | True -> b;;

notzero ::: a:{x:True} -> {y: True};;
iszero ::: a:{x: True} -> {y: True};;

add  ::: a:{x: True} -> b:{y: True} -> {z: gt z a};;
add  ::: a:{x: True} -> b:{y: True} -> {z: gt z b};;
add  ::: a:{x: notzero x} -> b:{y: notzero y} -> {z: gt z a};;
add  ::: a:{x: notzero x} -> b:{y: notzero y} -> {z: gt z b};;

mult ::: a:{x: True} -> b:{y: True} -> {z: or (gt z a) (gt z b)};;
mult ::: a:{x: True} -> b:{y: True} -> {z: implies (notzero b) (gt z a)};;

gtzero ::: a:{x:True} -> {y:True};;
minusOne ::: a:{x:notzero x} -> {y:True};;
gt ::: a:{x:True} -> b:{y:True} -> {z:True};;
aux ::: a:{x:True} -> b:{y:True} -> {z:True};;

fac ::: a:{x: True} -> {z: gt z a};;
