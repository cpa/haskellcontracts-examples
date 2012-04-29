-- #CATCH _
-- NSC Open Assessment
-- A brute force solution to Q2 using Ant paths
-- Exam Number: 39250

{-# SKIP #-}
module Regress.Ant where

import Lib.Prelude ;;
import Lib.List ;;
import Lib.Logic ;;
import Lib.Arithmetic ;;

-- main x = shortest x

-- isPrefix [] _ = True
-- isPrefix _ [] = False
-- isPrefix (x:xs) (y:ys) = x == y && isPrefix xs ys
isPrefix xs ys = case xs of {
  ; Nil -> True
  ; Cons x xs_ -> case ys of {
      ; Nil -> False
      -- Specializing to 'Nat'
      ; Cons y ys_ -> (x `eqNat` y) `and` isPrefix xs_ ys_
    }
};;

-- cat [] ys = ys
-- cat (x:xs) ys = if isPrefix (x:xs) ys then ys else x : cat xs ys
cat xs ys = case xs of {
  ; Nil -> ys
  ; Cons x xs_ -> ite (isPrefix xs ys) ys (Cons x (cat xs_ ys))
};;

-- path [] = ""
-- path (n:ns) = cat n (path ns)
path ns = case ns of {
  ; Nil -> Nil
  ; Cons n ns_ -> cat n (path ns)
};;


-- permutations [] = [[]]
-- permutations (x:xs) = concatMap (place x) (permutations xs)
--   where place x [] = [[x]]
--         place x (y:ys) = (x:y:ys) : map (y:) (place x ys)
permutations xs = case xs of {
  ; Nil -> Cons Nil Nil
  ; Cons x xs_ -> concatMap (place x) (permutations xs_)
};;
place x ys = case ys of {
  ; Nil -> Cons (Cons x Nil) Nil
  ; Cons y ys_ -> (Cons x ys) `Cons` map (Cons y) (place x ys_)
};;

-- shortest = foldr1 shorter . map path . permutations
--   where shorter x y = if length x < length y then x else y

-- But 
--
--   shortest = foldr1 shorter `o` map path `o` permutations ;;
--
-- and
--
--   shortest = foldr1 shorter `o` (map path `o` permutations) ;;
--
-- don't work ???  Do we need a contract for 'o'?  It' not
-- inductive ...
shortest xs = foldr1 shorter (map path (permutations xs)) ;;
shorter x y = ite (length x `lt` length y) x y ;;

{-# CONTRACT
shortest ::: CF -> CF
#-};;
{-# CONTRACT
shorter ::: CF -> CF -> CF
#-};;

{-# CONTRACT
ite ::: CF -> CF -> CF -> CF
#-};;

-- for lt ::: CF -> CF -> CF :P
{-# CONTRACT
gt ::: CF -> CF -> CF
#-};;

{-# CONTRACT
length ::: CF -> CF
#-};;

{-# CONTRACT
path ::: CF -> CF
#-};;

{-# CONTRACT
cat ::: CF -> CF -> CF
#-};;

{-# CONTRACT
isPrefix ::: CF -> CF -> CF
#-};;

{-# CONTRACT
eqNat ::: CF -> CF -> CF
#-};;

{-# CONTRACT
permutations ::: CF -> (CF&&{xs: not (null xs)})
#-};;

{-# CONTRACT
concatMap ::: (CF -> CF) -> CF -> CF
#-};;

{-# CONTRACT
concat ::: CF -> CF
#-};;

{-# CONTRACT
map ::: (CF -> CF) -> CF -> CF
#-};;

{-# CONTRACT
foldr1 ::: (CF -> CF -> CF) -> (CF&&{xs: not (null xs)}) -> CF
#-};;

{-# CONTRACT
foldr ::: (CF -> CF -> CF) -> CF -> CF -> CF
#-};;

{-# CONTRACT
place ::: CF -> CF -> CF
#-};;
