data List = Nil 0
          | Cons 2;;
           
map f l = case l of           
  | Nil -> Nil
  | Cons a b -> Cons (f a) (map f b);;
    
map ::: a: {x: True} -> a:{z:True} -> b:{y:True} -> {z:True};;
