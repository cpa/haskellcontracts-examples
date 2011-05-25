data Bool = True 0
          | False 0;;
  
data Nat = Zero 0
         | Succ 1;;

f x = case x of
  | Zero -> UNR
  | Succ y -> BAD;;

iszero x = case x of
  | Zero -> True
  | Succ a -> False;;

f ::: a:{ x: iszero x } -> {y: True}