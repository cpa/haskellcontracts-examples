-- Relatively complicated contracts on arithmetic functions.
data Nat = Zero 0
         | Succ 1;;
                   
add a b = case a of
  | Zero -> b
  | Succ x -> Succ (add x b);;
  
mult a b = case a of
  | Zero -> Zero
  | Succ x -> add (mult x b) b;;
    
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

-- XXX: create an 'import' command and create libs for logic,
-- arithmetic, etc.
and a b = case a of
  | True -> b
  | False -> False;;

or a b = case a of
  | True -> True
  | False -> b;;

not a = case a of
  | True -> False
  | False -> True;;

implies a b = case a of
  | False -> True
  | True -> b;;

-- XXX: do these proof on paper and see what lemmas are needed.
add  ::: x:(CF&&{x: positive x}) -> y:(CF&&{y: positive y}) -> {z: and (gt z x) (gt z y)};;

-- Notice the 'implies' allows us to move any predicate contract on an
-- argument into the predicate on the conclusion. cf. the contract for
-- 'add' above.
mult ::: x:CF -> y:CF -> {z: implies (and (positive x) (positive y)) 
                                     (and (gt z x)     (gt z y))};;

fac ::: a:CF -> {b: gt b a};;
