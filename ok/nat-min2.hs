data Bool = True 0
          | False 0;;
  
data Nat = Zero 0
         | Succ 1;;

g x = case x of
  | Zero -> Zero
  | Succ y -> Succ x;;

iszero x = case x of
  | Zero -> True
  | Succ a -> False;;

g ::: a:{ x: iszero x } -> {y: iszero y}