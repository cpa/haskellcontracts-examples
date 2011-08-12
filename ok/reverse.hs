data List = Nil 0
          | Cons 2;;

data Bool = True 0
          | False 0;;

reverse x acc = case x of
  | Nil -> Nil
  | Cons a b -> reverse x (Cons a acc);;

reverse ::: CF -> CF -> CF;;
