data Bool = True 0
          | False 0;;
                     
and x y = case x of
  | True -> y
  | False -> False;;
  
not x = case x of
  | True -> False
  | False -> True;;

or x y = case x of
  | True -> True
  | False -> y;;

implies x y = or (not x) y;;
implies ::: a:{x:cf(x)} -> b:{y:cf(y)} -> {z:cf(z)};;

or  :::  a:{x:cf(x)} -> b:{y:cf(y)} -> {z:cf(z)};;
and :::  a:{x:cf(x)} -> b:{y:cf(y)} -> {z:cf(z)};;
not ::: a:{x:cf(x)} -> {z:cf(z)};;