-- Boolean logic.
{-# SKIP #-}
module Lib.Logic (module Lib.Logic, module Lib.Prelude) where

import Lib.Prelude ;;

and a b = case a of {
; True -> b
; False -> False
};;

or a b = case a of {
; True -> True
; False -> b
};;

not a = case a of {
; True -> False
; False -> True
};;

implies a b = case a of {
; False -> True
; True -> b
};;

ite c a b = case c of {
; True -> a
; False -> b
};;