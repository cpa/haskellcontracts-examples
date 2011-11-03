-- Boring because ../yes/crash-on-wrong-nat.hs is similar.
data List = Nil 0 
          | Cons 2;;

head x = case x of
  | Nil -> BAD
  | Cons a b -> a;;
    
notNil x = case x of
  | Nil -> False
  | Cons a b -> True;;

head ::: a:(CF && {x: notNil x})  -> CF;;