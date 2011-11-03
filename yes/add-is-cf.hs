-- Here we need '(CF -> CF -> CF) -> CF'.
data Nat = Zero 0
         | Succ 1;;

add x y = case x of
  | Zero -> y
  | Succ a -> Succ (add a y);;
    
add ::: CF;;
