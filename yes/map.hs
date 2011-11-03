data List = Nil 0
          | Cons 2;;
           
map l f = case l of           
  | Nil -> Nil
  | Cons a b -> Cons (f a) (map b f);;
    
map ::: CF;;
