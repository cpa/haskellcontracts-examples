data Bool = True 0
          | False 0;;
           
data List = Nil 0
          | Cons 2;;
           
map l f = case l of           
  | Nil -> Nil
  | Cons a b -> Cons (f a) (map b f);;
    
map ::: a: {x:True} -> b:{y:True} -> {z:True};;
