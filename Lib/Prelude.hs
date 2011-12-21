{-# SKIP #-}
module Lib.Prelude(module Prelude,module Lib.Prelude) where

{-# SKIP #-}
import Prelude(error,Show)

data Bool
   = False
   | True
   {-# SKIP #-}
   deriving Show
   ;;

data Nat
   = Zero
   | Succ Nat
   {-# SKIP #-}
   deriving Show
   ;;

data List a
   = Nil 
   | Cons a (List a)
   {-# SKIP #-}
   deriving Show
   ;;

data Lemma
   = QED
   {-# SKIP #-}
   deriving Show
   ;;

-- Composition
o f g x = f (g x) ;;

{-# SKIP #-}
using :: a -> Lemma -> a
e `using` lem = case lem of {
; QED -> e
};;

{-# SKIP #-}
usingMany :: a -> List Lemma -> a
-- List version of 'using'.  Not so useful for us, since we don't have
-- nice list syntax.
--
-- usingMany x prfs = foldl using x prfs
usingMany x prfs = case prfs of {
                   ; Nil -> x 
                   ; Cons p ps -> usingMany x ps `using` p
                   } ;;

{-# SKIP #-}
unr = unr
{-# SKIP #-}
bad = error "BAD"
