data List = Nil 0
          | Cons 2;;

data Bool = True 0
          | False 0;;

copy x = case x of
  | Nil -> acc
  | Cons a b -> Cons a (copy b);;

copy ::: a:{x : True} -> a:{y:True} -> {z:True};;
