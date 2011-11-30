-- risers []  = []
-- risers [x] = [[x]]
-- risers (x:y:etc)
--   = if x ≤y then (x:s) : ss
--             else [x] : (s : ss)
--  where s:ss = risers (y : etc)

import Lib.List ;;
import Lib.Logic ;;
import Lib.Arithmetic ;;

{-# SKIP #-}
risers :: List Nat -> List (List Nat)
risers xs = case xs of {
; Nil -> Nil
; Cons x xs_ -> case xs_ of {
  ; Nil -> Cons (Cons x Nil) Nil
  ; Cons y etc -> case risers (Cons y etc) of {
    ; Nil -> bad
    ; Cons s ss -> case le x y of {
      ; True -> Cons (Cons x s) ss
      ; False -> Cons (Cons x Nil) (Cons s ss)
      }
    }
  }
};;

{-# CONTRACT
risers ::: xs:(CF&&{xs: not (null xs)}) -> CF 
#-};;