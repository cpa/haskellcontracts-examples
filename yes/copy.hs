data List = Nil 0
          | Cons 2;;

copy x = case x of
  | Nil -> x
  | Cons a b -> Cons a (copy b);;

copy ::: CF -> CF;;
