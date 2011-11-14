-- Something that is 'obviously' true, but for which we need some
-- inductive lemmas, e.g.
--
-- - forall x. gt (Succ x) x.
--
-- - forall x. eqNat x x. or maybe
-- - forall x y. x = y -> eqNat x y, or maybe
-- - forall x. eqNat (Succ x) (Succ x), or maybe
-- - forall x y. eqNat x y -> eqNat (Succ x) (Succ y)
--
-- We can state and prove the first one, but I'm not sure how to state
-- any of the second group in our system.
--
-- This loops as Dimitrios claimed it would.
import "../lib/arithmetic.hs";;

inc x = Succ x;;

gt ::: x:CF -> {y: eqNat (Succ y) x} -> {z: z};;
gtAux ::: x:CF -> {y: eqNat y x} -> {z: z};;

inc ::: x:CF -> {r : gt r x};;
