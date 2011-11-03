data Int = Zero 0
         | Succ 1;;

add x y = case x of
  | Zero -> y
  | Succ a -> Succ (add a y);;
    
add ::: CF;;
--add ::: CF -> CF -> CF;;