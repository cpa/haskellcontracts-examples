-- Trying to create a refutation theory which has no finite counter
-- models, but not sure this makes any sense.  Idea was to create a
-- ref theory where we have
--
--   min(0), min(1), min(2), ...
--
-- and hence 'Succ' is injective and not surjective on '{x : min(x) }'.
import Lib.Arithmetic ;;
import Lib.Logic ;;

nats x = x `Cons` nats (Succ x) ;;
allMin xs = case xs of {
  ; Nil -> False
  ; Cons x xs_ -> case x of {
      ; Zero -> allMin xs_
      ; Succ x_ -> allMin xs_
    }
};;
false = allMin (nats Zero) ;;

{-# CONTRACT
false ::: {r:r}
#-};;