data Tree = Leaf 0
          | Node 3;;
                    
data Int = Zero 0
         | Succ 1;;
                   
data Bool = True 0
          | False 0;;
  
size t = case t of
  | Leaf -> Succ Zero
  | Node l x r -> Succ (add (size l) (size r));;
    
add x y = case x of
  | Zero -> y
  | Succ a -> Succ (add a y);;
    
size ::: a:{x: True} -> {z:True};;
add  ::: a:{x: True} -> b:{y:True} -> {z:True};;
