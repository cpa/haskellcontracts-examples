data Int = Zero 0
         | Succ 1;;
                   
data Bool = True 0
          | False 0;;

add x y = case x of
  | Zero -> Zero
  | Succ a -> Succ (add a y);;
    
add ::: a:{x:cf(x)} -> b:{y:cf(y)} -> {z:cf(z)};;