data List = Nil 0 
          | Cons 2;;

data Int = Zero 0
         | Succ 1;;

length x = case x of
  | Nil -> Zero
  | Cons a b -> Succ (length b);;
    
notZero x = case x of
  | Nil -> False
  | Cons a b -> True;;
    
not x = case x of
  | True -> False
  | False -> True;;

f x = case x of 
    | Nil -> Nil
    | Cons a b -> Nil;;
    
f ::: a:{x : True} -> {y : not (notZero (length y))};;