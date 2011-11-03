-- Mutual recursion and scrutinizing a function call.
data Nat = Zero 0
         | Succ 1;;
                   
f x = case odd x of
  | True -> True
  | False -> False;;
  
odd x = case x of
  | Zero -> False
  | Succ a -> even a;;
    
even x = case x of
  | Zero -> True
  | Succ a -> odd a;;
    
f    ::: CF -> CF;;
odd  ::: CF -> CF;;
even ::: CF -> CF;;
