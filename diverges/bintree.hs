data Tree = Leaf 0
          | Node 3;;
                    
data Int = Zero 0
         | Succ 1;;
                   
data Bool = True 0
          | False 0;;
  
height t = case t of
  | Leaf -> Zero
  | Node l x r -> Succ (max (height l) (height r));;
  
max a b = case (gt a b) of
  | True -> a
  | False -> b;;
    
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


gt  ::: a:{x:True} -> b:{y:True} -> {z:True};;
aux ::: a:{x:True} -> b:{y:True} -> {z:True};;
max ::: a:{x:True} -> b:{y:True} -> {z:True};;
iszero ::: a:{x:True} -> {z:True};;
height ::: a:{x:True} -> {z:True};;