-- This is probably boring ... but I don't recall another example that
-- builds up a value to pass to a recursive call.
data List = Nil 0
          | Cons 2;;

reverse x acc = case x of
  | Nil -> acc
  | Cons a b -> reverse b (Cons a acc);;

reverse ::: CF -> CF -> CF;;
