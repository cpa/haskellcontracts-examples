data List = Nil 0
          | Cons 2;;

data Bool = True 0
          | False 0;;

copy x = case x of
  | Nil -> x
  | Cons a b -> Cons a (copy b);;

copy ::: a:{x : True} -> {z:True};;
