-- Mutual recursion and scrutinizing a function call.
import Lib.Arithmetic ;;
                   
f x = case odd x of
  ; True -> True
  ; False -> False;;
  
odd x = case x of
  ; Zero -> False
  ; Succ a -> even a;;
    
even x = case x of
  ; Zero -> True
  ; Succ a -> odd a;;

{-# CONTRACT
f    ::: CF -> CF
#-};;
{-# CONTRACT
odd  ::: CF -> CF
#-};;
{-# CONTRACT
even ::: CF -> CF
#-};;
