-- Relatively complicated contracts on arithmetic functions.
import "../lib/arithmetic.hs";;
import "../lib/logic.hs";;

fac n = case n of
  | Zero -> Succ Zero
  | Succ n_ -> mult n (fac n_);;

positive x = notZero x;;

lem x y = case x of
  | Zero -> True
  | Succ x_ -> lem x_ y;;



gt ::: x:CF -> {y: eqNat (Succ y) x} -> {z: z};;
gtAux ::: x:CF -> {y: eqNat y x} -> {z: z};;
-- If this even made sense, would still need lem to prove add, but add
-- doesn't mention lem, and so lem would never be included in add's
-- env.
--lem ::: x:CF -> y:CF -> {z: eq (add x (Succ y)) (add (Succ x) y)}

-- XXX: do these proofs on paper and see what lemmas are needed.
--add  ::: x:(CF&&{x: positive x}) -> y:(CF&&{y: positive y}) -> {z: and (gt z x) (gt z y)};;
--add  ::: x:CF                    -> y:(CF&&{y: positive y}) -> {z: gt z x};;

-- The following 'add' contract fails, and also fails with:
--
-- fof(gt,axiom,
-- (! [Y] : (cf(Y) => (f__gt(('f__Succ'(Y)),Y) = 'True' |
--                     f__gt(('f__Succ'(Y)),Y) = 'UNR')))).
add  ::: x:(CF&&{x: positive x}) -> y:CF                    -> {z: gt z y};;

-- Notice the 'implies' allows us to move any predicate contract on an
-- argument into the predicate on the conclusion. cf. the contract for
-- 'add' above.
--
-- Not true, since e.g. 1*1 = 1.  Equinox returns "satisfiable" :)
--mult ::: x:CF -> y:CF -> {z: implies (and (positive x) (positive y)) 
--                                     (and (gt z x)     (gt z y))};;
--mult ::: x:(CF&&{x:gt x one}) -> y:(CF&&{y:gt y one}) -> {z: and (gt z x) (gt z y)};;

--fac ::: a:(CF&&{a:gt a two}) -> {b: gt b a};;
