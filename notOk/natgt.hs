data Int = Zero 0
         | Succ 1;;
                   
max a b = case gt a b of
  | True -> a
  | False -> b;;
    
gt x y = case x of
  | Zero -> False
  | Succ a -> aux a y;;
  
aux x y = case y of
  | Zero -> True
  | Succ a -> gt x a;;

max ::: a:{x:cf(x)} -> b:{y:cf(y)} -> {z:cf(z)};;
gt  ::: a:{x:cf(x)} -> b:{y:cf(y)} -> {z:cf(z)};;
aux ::: a:{x:cf(x)} -> b:{y:cf(y)} -> {z:cf(z)};;

