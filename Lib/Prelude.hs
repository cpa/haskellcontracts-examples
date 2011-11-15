module Lib.Prelude(module Prelude,module Lib.Prelude) where

{- SKIP -}
import Prelude(error,Show)

data Bool
    = False
    | True
    {- SKIP -}
    deriving Show
    ;;

data Nat
    = Zero
    | Succ Nat
    {- SKIP -}
    deriving Show
    ;;

data List
    = Nil 
    | Cons Nat List
    {- SKIP -}
    deriving Show
    ;;

{- SKIP -}
unr = unr
{- SKIP -}
bad = error "BAD"
