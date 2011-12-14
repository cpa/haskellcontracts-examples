{-# SKIP #-}
module Lem.EqNatTrans where

-- Transitivity of 'eqNat'.
--
-- Not true for non-CF args, e.g.
--
--   S UNR `eqNat` UNR = UNR
--
-- and
--
--   UNR `eqNat` BAD = UNR
--
-- but
--
--   S UNR `eqNat` BAD = BAD.
--
-- It's true for CF args.
--
-- It's interesting to note that we don't seem to be able to talk
-- about contradictions directly.  For example, we know that
--
--   x `eqNat` y
--
-- and
--
--   x = S x_
--
-- then
--
--   y = UNR \/ y = S y_,
--
-- and in particular
--
--   y /= Zero.
--
-- But we can't actually state this, and for good reason: we lose
-- probably soundness if we're allowed to talk about negation, because
-- of our "induction up to UNR".  E.g.
--
--   f ::: c
--   f ::: ~ c
--   f = f
--
-- would check and then we'd have something like '(f in c) /\ ~ (f in c)'.
--
-- However, we don't need induction to prove
--
--   y /= Zero,
--
-- so the following proof works.
import Lib.Arithmetic ;;

lem_eqNat_trans x y z = case x of {
; Zero -> case y of {
          ; Zero -> case z of {
-- x = z = Zero -> x `eqNat` z = Zero `eqNat` Zero
                    ; Zero -> QED
-- contra: x = Zero, 
--         z = Succ z_, 
-- and so  Zero `eqNat` Succ z_ = False, 
-- but we assume x `eqNat` z is not False.
                    ; Succ z_ -> QED -- contra
                    }
          ; Succ y_ -> QED -- contra
          }
; Succ x_ -> case y of {
             ; Zero -> QED -- contra
             ; Succ y_ -> case z of {
                          ; Zero -> QED -- contra
-- For any 'a' and 'b' have 
--
-- (1)  Succ a `eqNat` Succ b = a `eqNat` b
--
-- and so we can apply IH to 'x_', 'y_', 'z_', giving
--
--   x_ `eqNat` z_,
--
-- but then done, again by (1).
                          ; Succ z_ -> lem_eqNat_trans x_ y_ z_
                          }
             }
};;

{-# CONTRACT
lem_eqNat_trans ::: x:CF -> y:(CF&&{y: x `eqNat` y})
                         -> z:(CF&&{z: y `eqNat` z})
                         -> CF&&{qed: x `eqNat` z}
#-};;
