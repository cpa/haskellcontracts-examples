data Int = Zero 0
         | Succ 1;;
                   
data Bool = True 0
          | False 0;;
  
f x y n = case notzero n False of
  | True -> x
  | False -> y;;
  
notzero n flag = case n of
  | Zero -> flag
  | Succ a -> notzero a True;;

f ::: a:{x:cf(x)} -> b:{y:cf(y)} -> {z:cf(z)};;
notzero ::: a:{x:cf(x)} -> b:{z:cf(z)} -> {y:cf(y)};;