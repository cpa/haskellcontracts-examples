data Int = Zero 0
         | Succ 1;;
                   
data Bool = True 0
          | False 0;;
  
  
f x = case odd x of
  | True -> True
  | False -> False;;
  
odd x = case x of
  | Zero -> False
  | Succ a -> even a;;
    
even x = case x of
  | Zero -> True
  | Succ a -> odd a;;
    
f ::: CF;;
odd ::: CF;;
even ::: CF;;
