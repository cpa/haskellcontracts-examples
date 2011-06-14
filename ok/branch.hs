data Bool = True 0
          | False 0;;
  
data Nat = Zero 0
         | Succ 1;;

branch x = case x of
  | Zero -> UNR
  | Succ y -> BAD;;

iszero x = case x of
  | Zero -> True
  | Succ a -> False;;

branch ::: a:{ x: iszero x } -> {y: True}
