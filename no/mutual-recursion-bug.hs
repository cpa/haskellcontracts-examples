-- The contract for 'f' does not hold, but with the incorrect
-- translation of multiple contracts, we conclude that it does!  The
-- problem is that we must check 'f' and 't' concurrently, since
-- they're mutually recursive, but the refutation we produce is wrong:
--
--   C |- phi_1 /\ phi_2 =trans=> C, ~ phi_1, ~ phi_2 |- _|_
--
-- but it should be
--
--   C |- phi_1 /\ phi_2 =trans=> C, ~ (phi_1 /\ phi_2) |- _|_
import Lib.Prelude ;;

t = case True of
    ; True -> True
    ; False -> f
;;

f = case True of
    ; True -> False
    ; False -> t
;;

{-# CONTRACT t ::: {r:r} #-};;
{-# CONTRACT f ::: {r:r} #-};;
