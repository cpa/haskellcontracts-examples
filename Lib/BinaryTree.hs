-- Trees with nothing in them :P
{-# SKIP #-}
module Lib.BinaryTree (module Lib.BinaryTree, module Lib.Arithmetic, module Lib.Logic) where

import Lib.Arithmetic ;;
import Lib.Logic ;;

data Tree
   = Leaf
   | Node Tree Tree;;

isLeaf t = case t of {
; Leaf -> True
; Node a b -> False
};;

eqTree t1 t2 = case t1 of {
; Leaf -> isLeaf t2
; Node a1 b1 -> case t2 of {
  ; Leaf -> False
  ; Node a2 b2 -> eqTree a1 a2 `and` eqTree b1 b2
  }
};;

height t = case t of {
; Leaf -> Zero
; Node l r -> Succ (height l `max` height r)
};;

size t = case t of {
; Leaf -> Succ Zero
; Node l r -> Succ (size l `add` size r)
};;
