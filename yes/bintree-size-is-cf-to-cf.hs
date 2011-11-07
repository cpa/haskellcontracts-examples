data Tree = Leaf 0
          | Node 3;;
                    
data Nat = Zero 0
         | Succ 1;;

size t = case t of
  | Leaf -> Succ Zero
  | Node l x r -> Succ (add (size l) (size r));;
    
add x y = case x of
  | Zero -> y
  | Succ x_ -> Succ (add x_ y);;

add  ::: CF -> CF -> CF;;
size ::: CF -> CF;;

