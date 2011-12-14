import Lib.Arithmetic ;;
import Lem.EqNatTrans ;;

lem_eqNat_reflexive x = case x of {
; Zero -> QED
; Succ x_ -> lem_eqNat_reflexive x_
};;

-- using a lemma in the most trivial way possible.
--
-- if we use a lemma to prove itself, we don't need cf, because if the
-- lemma is bad, then we get the goal.
lem_eqNat_reflexive2 x = QED `using` lem_eqNat_reflexive x;;

-- the min's let us prove this, but it diverges without min's. first
-- such example.
lem_add_Z_r x = case x of {
; Zero -> QED
; Succ x_ -> lem_add_Z_r x_
};;

lem_add_S_r x y = case x of {
; Zero -> QED `using` lem_eqNat_reflexive y
; Succ x_ -> lem_add_S_r x_ y
};;

-- In the base case
--
--   (Zero `add` y) `eqNat` (y `add` Zero)
--
-- by 'lem_add_Z_r y'.
--
-- In the inductive case, where 'x = Succ x_', we have
-- 
--   (x_ `add` y) `eqNat` (y `add` x_)
--
-- by IH, and so *could* get
--
--   Succ (x_ `add` y) `eqNat` Succ (y `add` x_)
--
-- by computation, *if* we have 'min' for the latter. But I don't
-- think we do.  We have
--
--   min((Succ x_ `add` y) `eqNat` (y `add` Succ x_)),
--
-- since that's what we're evaluating in the contract predicate, and
-- that in turn gives us
--
--   min(Succ x_ `add` y)
--
-- from the outer 'case' of 'eqNat', and then we get
--
--   min(y `add` Succ x_)
--
-- from nested 'case' of 'eqNat', in the 'x = Succ (pred x)'
-- branch. The
--
--   min(Succ x_ `add` y)
--
-- gives us
--
--   Succ x_ `add` y = Succ (x_ `add` y)
--
-- by computation, but I don't see how we could get
--
--   min(Succ (y `add` x_)),
--
-- since it's certainly not the case that
--
--   Succ (y `add` x_) = y `add` Succ x_
--
-- (e.g. take 'y = UNR').  Adding that 'min' as an axiom
--
--   fof(free_mins,
--       axiom,
--       (! [Y,X]  : ($min(f__add(Y , c_Succ(f__p1_Succ(X)))) 
--                 => $min(c_Succ(f__add(Y , f__p1_Succ(X))))))).
--
-- doesn't seem to help though :P
--
-- Now, if we could get
--
--   Succ (x_ `add` y) `eqNat` Succ (y `add` x_)
--
-- above, via appropriate mins, then using
--
--   Succ (y `add` x_) `eqNat` (y `add` Succ x_),
--
-- by 'lem_add_S_r y x_', we'd get
--
--   Succ (x_ `add` y) `eqNat` (y `add` Succ x_)
--
-- by 'lem_eqNat_trans ...', and be done.
lem_add_symmetric x y = case x of {
; Zero -> QED `using` lem_add_Z_r y
; Succ x_ -> lem_add_symmetric x_ y
             `using` lem_add_S_r y x_
             `using` lem_eqNat_trans (Succ (x_ `add` y))
                                     (Succ (y `add` x_))
                                     (y `add` Succ x_)
};;
-- Need this above for 'lem_eqNat_trans' to be applicable.
{-# CONTRACT
add ::: CF -> CF -> CF
#-};;

-- using an irrelevant lemma causes divergence here!
--
-- UPDATE: not if you add 'CF' to the irrel lemma. the problem is that
-- if the rec call is unr and the lemma is BAD (not ruled out by the
-- predicate contract), then we need to prove the goal with no
-- IH. adding the CF to the irrel lemma rules out the bad there, so we
-- only consider unr.
--
-- this also matters when the lemma *is* relevant.
lem_add_Z_r2 x = case x of {
; Zero -> QED `using` (lem_eqNat_reflexive Zero)
; Succ x_ -> lem_add_Z_r2 x_ `using` lem_eqNat_reflexive x_
};;

{-# CONTRACT
lem_eqNat_reflexive ::: x:CF -> CF&&{qed: x `eqNat` x}
#-};;

{-# CONTRACT
lem_eqNat_reflexive2 ::: x:CF -> CF&&{qed: x `eqNat` x}
#-};;

{-# CONTRACT
lem_add_Z_r ::: x:CF -> CF&&{qed: (Zero `add` x) `eqNat` (x `add` Zero)}
#-};;

{-# CONTRACT
lem_add_S_r ::: x:CF -> y:CF -> CF&&{qed: Succ (x `add` y) `eqNat` (x `add` Succ y)}
#-};;

{-# CONTRACT
lem_add_Z_r2 ::: x:CF -> CF&&{qed: eqNat x (add x Zero)}
#-};;

{-# CONTRACT
lem_add_symmetric ::: x:CF -> y:CF -> CF&&{qed: (x `add` y) `eqNat` (y `add` x)}
#-};;
