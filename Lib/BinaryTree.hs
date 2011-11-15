module Lib.BinaryTree where

import Lib.Arithmetic ;;
import Lib.Logic ;;

data Tree
    = Leaf
    | Node Tree Tree;;

isLeaf t = case t of
  ; Leaf -> True
  ; Node a b -> False;;

eqTree t1 t2 = case t1 of
  ; Leaf -> isLeaf t2
  ; Node a b -> eqTreeAux t2 a b;;
    
eqTreeAux t a b = case t of
  ; Leaf -> False
  ; Node c d -> and (eqTree a c) (eqTree b d);;

height t = case t of
  ; Leaf -> Zero
  ; Node l r -> Succ (max (height l) (height r));;

size t = case t of
  ; Leaf -> Succ Zero
  ; Node l r -> Succ (add (size l) (size r));;
