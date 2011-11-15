import Lib.Arithmetic ;;
import Lib.Logic ;;

-- Not true, e.g. 'positive 1' and 'CF 1' and '1 = 1 * 1' but not 'gt 1 1'.
{-# CONTRACT
mult ::: x:CF -> y:CF -> {z: implies (and (positive x) (positive y)) 
                                     (and (gt z x)     (gt z y))}
#-};;