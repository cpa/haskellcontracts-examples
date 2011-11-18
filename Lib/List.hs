module Lib.List(module Lib.List, module Lib.Prelude) where

import Lib.Prelude ;;

length x = case x of
  ; Nil -> Zero
  ; Cons a b -> Succ (length b);;
    
null x = case x of
  ; Nil -> True
  ; Cons a b -> False;;

reverse x acc = case x of
  ; Nil -> acc
  ; Cons a b -> reverse b (Cons a acc);;
