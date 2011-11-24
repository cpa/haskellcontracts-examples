module Lib.Arithmetic(module Lib.Prelude, module Lib.Arithmetic) where

import Lib.Prelude ;;

one = Succ Zero;;
two = Succ one;;

add x y = case x of {
; Zero -> y
; Succ x_ -> Succ (add x_ y)
};;

mult a b = case a of {
; Zero -> Zero
; Succ x -> add b (mult x b)
};;

notZero x = case x of {
; Zero -> False
; Succ x_ -> True
};;

isZero x = case x of {
; Zero -> True
; Succ x_ -> False
};;

eqNat x y = case x of {
; Zero -> isZero y
; Succ x_ -> case y of {
             ; Zero -> False
             ; Succ y_ -> eqNat x_ y_
             }
};;

gt x y = case x of {
; Zero -> False
; Succ x_ -> case y of {
             ; Zero -> True
             ; Succ y_ -> gt x_ y_
             }
};;

max a b = case (ge a b) of {
; True -> a
; False -> b
};;
    
ge x y = case x of {
; Zero -> isZero y
; Succ x_ -> case y of {
             ; Zero -> True
             ; Succ y_ -> ge x_ y_
             }
};;
