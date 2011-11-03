-- Boring because 'Any' contracts are boring and 'add' and 'multgt'
-- are already covered by ../yes/add-is-cf-to-cf-to-cf.hs and
-- ../yes/mult-is-cf-to-cf-to-cf.hs.
data Nat = Zero 0 
         | Succ 1;;
                   
add a b = case a of
  | Zero -> b
  | Succ x -> Succ (add x b);;
  
multgt a b = case a of
  | Zero -> Zero
  | Succ x -> add b (multgt x b);;
    
gt x y = case x of
  | Zero -> iszero y
  | Succ a -> aux a y;;
  
minusOne x = case x of
  | Zero -> BAD
  | Succ y -> y;;

aux x y = case y of
  | Zero -> True
  | Succ a -> gt x (minusOne y);;

notzero x = case x of
  | Zero -> False
  | Succ a -> True;;
  
or a b = case a of
  | True -> True
  | False -> b;;

minusOne ::: a:{x:notZero x} -> {y:True};;
gt ::: a:{x:True} -> b:{y:True} -> {z:True};;
aux ::: a:{x:True} -> b:{y:True} -> {z:True};;
notzero ::: a:{x:True} -> {y:True};;

add ::: CF -> CF -> CF;;

multgt ::: CF -> CF -> CF;; -- {z: or (gt z a) (gt z b)};;
