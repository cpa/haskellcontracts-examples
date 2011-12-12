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


-- This is necessary because 'le x y = ge y x' and 'ge' is def
-- recursively.
{-# CONTRACT
ge ::: CF -> CF -> CF
#-};;

-- This is necessary because 'risers' scrutinizes 'le x y'.
{-# CONTRACT
le ::: CF -> CF -> CF
#-};;

-- This is necessary because we need 'not . null -> not . null' to
-- have a usable inductive hypothesis.
{-# CONTRACT
risers ::: xs:(CF&&{xs: not (null xs)}) -> CF&&{xs: not (null xs)}
#-};;

-- This is unnecessary but provable.
-- {-# CONTRACT
-- risers ::: xs:(CF&&{xs: null xs}) -> CF
-- #-};;

-- This is not provable without the 'not (null x)' version. NB: no
-- unrollings are needed.
{-# CONTRACT
risers ::: xs:CF -> CF
#-};;
