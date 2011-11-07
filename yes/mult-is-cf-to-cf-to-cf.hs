data Nat = Zero 0 
         | Succ 1;;
                   
add a b = case a of
  | Zero -> b
  | Succ x -> Succ (add x b);;
  
mult a b = case a of
  | Zero -> Zero
  | Succ x -> add b (mult x b);;

-- NB: without this 'add' contract, the 'mult' contract proof times
-- out.  We need the 'add' contract as a lemma, and it requires
-- induction, so it can't be discovered.
add  ::: CF -> CF -> CF;;
mult ::: CF -> CF -> CF;;
