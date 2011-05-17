data List = Nil 0
          | Cons 2;;

data Bool = True 0
          | False 0;;

notZero x = case x of
  | Nil -> False
  | Cons a b -> True;;

and x y = case x of
  | True -> y
  | False -> False;;

mess x = case x of
  | Nil -> BAD
  | Cons a b -> True;;

f x = and (notZero x) (mess x);;
f ::: a:{x: True} -> {y: True};;
