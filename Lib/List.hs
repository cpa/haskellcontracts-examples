module Lib.List where

import Lib.Prelude ;;

length x = case x of
  ; Nil -> Zero
  ; Cons a b -> Succ (length b);;
    
null x = case x of
  ; Nil -> False
  ; Cons a b -> True;;

reverse x acc = case x of
  ; Nil -> acc
  ; Cons a b -> reverse b (Cons a acc);;
