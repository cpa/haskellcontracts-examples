-- Something that is 'obviously' true, but for which we need an
-- inductive lemma that forall x. gt (Succ x) x.
--
-- This loops as Dimitrios claimed it would.
import "../lib/arithmetic.hs";;

inc x = Succ x;;

inc ::: x:CF -> {r : gt r x};;