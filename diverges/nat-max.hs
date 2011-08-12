data Int = Zero 0
         | Succ 1;;
                   
data Bool = True 0
          | False 0;;
  
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

dummy x = x;;
dummy ::: a:{x:True} -> {z: gt z z};;

gt  ::: a:{x:True} -> b:{y:True} -> {z:True};;
aux ::: a:{x:True} -> b:{y:True} -> {z:True};;
max ::: a:{x:True} -> b:{y:True} -> {z:gt z a};;
