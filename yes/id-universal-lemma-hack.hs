import Lib.Arithmetic ;;

-- This is a hack to state the lemma: forall z. ge z z.  Seems we
-- can't prove this, since we need induction on z.
id x = x;;

{-# CONTRACT
id ::: CF -> {z: ge z z}
#-};;
