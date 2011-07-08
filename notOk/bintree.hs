data Tree = Leaf 0
          | Node 3;;
                    
data Int = Zero 0
         | Succ 1;;
                   
data Bool = True 0
          | False 0;;
  
height t = case t of
  | Leaf -> Zero
  | Node l x r -> Succ (max (height l) (height r));;
  
max a b = case gt a b of
  | True -> a
  | False -> b;;
    
minusone x = case x of
  | Zero -> BAD
  | Succ y -> y;;

gt x y = case x of
  | Zero -> iszero y
  | Succ a -> aux a y;;
  
aux x y = case y of
  | Zero -> True
  | Succ a -> gt x (minusone y);;

iszero x = case x of
  | Zero -> True
  | Succ a -> False;;


gt  ::: a:{x:cf(x)} -> b:{y:cf(y)} -> {z:cf(z)};;
aux ::: a:{x:cf(x)} -> b:{y:cf(y)} -> {z:cf(z)};;
max ::: a:{x:cf(x)} -> b:{y:cf(y)} -> {z:cf(z)};;
iszero ::: a:{x:cf(x)} -> {z:cf(z)};;
height ::: a:{x:cf(y)} -> {z:cf(z)};;