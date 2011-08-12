data Int = Zero 0
         | Succ 1;;
                   
data Bool = True 0
          | False 0;;
  
notzero n flag = case n of
  | Zero -> flag
  | Succ a -> notzero a True;;

notzero ::: CF -> CF -> CF;;

