{-# SKIP #-}
module Lib.List(module Lib.List, module Lib.Prelude) where

import Lib.Prelude ;;

length x = case x of {
; Nil -> Zero
; Cons a b -> Succ (length b)
};;
    
null x = case x of {
; Nil -> True
; Cons a b -> False
};;

reverse x acc = case x of {
; Nil -> acc
; Cons a b -> reverse b (Cons a acc)
};;

map f xs = case xs of {
; Nil -> Nil
; Cons x ys -> Cons (f x) (map f ys)
};;

concatMap f = concat `o` map f ;;

concat xss = case xss of {
; Nil -> Nil
; Cons xs xss_ -> case xs of {
  ; Nil -> concat xss_
  ; Cons x xs_ -> x `Cons` concat (xs_ `Cons` xss_)
  }
};;

foldr1 f xs = case xs of {
; Nil -> bad
; Cons x xs_ -> foldr f x xs_
};;

foldr f s xs = case xs of {
; Nil -> s
; Cons x xs_ -> foldr f (x `f` s) xs_
};;
