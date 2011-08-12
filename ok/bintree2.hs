data Tree = Leaf 0
          | Node 2;;
                    
data Int = Zero 0
         | Succ 1;;
    
isLeaf t = case t of
  | Leaf -> True
  | Node a b -> False;;

eq t1 t2 = case t1 of
  | Leaf -> isLeaf t2
  | Node a b -> aux t2 a b;;
    
aux t a b = case t of
  | Leaf -> False
  | Node c d -> and (eq a c) (eq b d);;

and x y = case x of
  | True -> y
  | False -> False;;
    
isLeaf ::: CF -> CF;;
and ::: CF -> CF -> CF;;