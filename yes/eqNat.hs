import Lib.Arithmetic ;;
import Lib.Logic ;;

lem_eqnat_refl x = case x of { 
; Zero -> QED
; Succ x0 -> lem_eqnat_refl x0 } ;;

-- Munich example.
any x y = x `using` (lem_eqnat_refl x) ;;

{-# CONTRACT
lem_eqnat_refl ::: x:CF -> CF&&{v : x `eqNat` x}
#-} ;;

{-# CONTRACT
any ::: x:CF -> y:CF -> { z : or (x `eqNat` z) (y `eqNat` z) }
#-} ;;

