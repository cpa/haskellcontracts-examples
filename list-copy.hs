data List = Nil 0
          | Cons 2;;

data Bool = True 0
          | False 0;;

reverse x acc = case x of
  | Nil -> acc
  | Cons a b -> reverse x (Cons a acc);;

reverse ::: a:{x : True} -> a:{y:True} -> {z:True};;
