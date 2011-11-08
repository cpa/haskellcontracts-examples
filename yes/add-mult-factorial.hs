-- Relatively complicated contracts on arithmetic functions.
import "../lib/arithmetic.hs";;
import "../lib/logic.hs";;
    
fac n = case n of
  | Zero -> Succ Zero
  | Succ a -> mult n (fac a);;

-- Or, 'positive x = gt x Zero'.
positive x = case x of
  | Zero -> False
  | Succ a -> True;;

gt x y = case x of
  | Zero -> False
  | Succ x_ -> gtAux x_ y;;

gtAux x y = case y of
  | Zero -> True
  | Succ y_ -> gt x y_;;

-- XXX: do these proof on paper and see what lemmas are needed.
add  ::: x:(CF&&{x: positive x}) -> y:(CF&&{y: positive y}) -> {z: and (gt z x) (gt z y)};;

-- Notice the 'implies' allows us to move any predicate contract on an
-- argument into the predicate on the conclusion. cf. the contract for
-- 'add' above.
mult ::: x:CF -> y:CF -> {z: implies (and (positive x) (positive y)) 
                                     (and (gt z x)     (gt z y))};;

fac ::: a:CF -> {b: gt b a};;
