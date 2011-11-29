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

{-# SKIP #-}
using :: a -> Lemma -> a
e `using` lem = case lem of {
; QED -> e
};;

{-# SKIP #-}
unr = unr
{-# SKIP #-}
bad = error "BAD"
