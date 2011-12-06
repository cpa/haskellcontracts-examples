import Lib.Arithmetic ;;

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
; Zero -> QED
; Succ x_ -> lem_add_S_r x_ y
};;

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
lem_eqNat_reflexive ::: x:CF -> CF&&{qed: eqNat x x}
#-};;

{-# CONTRACT
lem_eqNat_reflexive2 ::: x:CF -> CF&&{qed: eqNat x x}
#-};;

{-# CONTRACT
lem_add_Z_r ::: x:CF -> CF&&{qed: eqNat (add Zero x) (add x Zero)}
#-};;

{-# CONTRACT
  lem_add_S_r ::: x:CF -> y:CF -> CF&&{qed: Succ (x `add` y) `eqNat` (x `add` Succ y)}
#-};;

{-# CONTRACT
lem_add_Z_r2 ::: x:CF -> CF&&{qed: eqNat x (add x Zero)}
#-};;
