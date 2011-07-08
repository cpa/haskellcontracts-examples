data Bool = False 0 
          | True 0;; 

not x = case x of
  | True -> False
  | False -> True;;

not ::: a:{x:cf(x)} -> {y:cf(y)};;

