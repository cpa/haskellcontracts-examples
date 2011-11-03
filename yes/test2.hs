data Int = Zero 0
         | Succ 1;;
                   
notzero n flag = case n of
  | Zero -> flag
  | Succ a -> notzero a True;;

notzero ::: CF -> CF -> CF;;

