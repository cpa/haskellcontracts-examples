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
implies ::: CF;;

or  ::: CF;;
and ::: CF;;
not ::: CF;;