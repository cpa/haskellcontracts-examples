import Lib.List ;;

f x = case x of 
    ; Nil -> Nil
    ; Cons a b -> Nil;;

{-# CONTRACT
f ::: CF -> {y : not (not (null y))}
#-};;
