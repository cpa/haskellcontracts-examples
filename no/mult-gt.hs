import "../lib/arithmetic.hs";;
import "../lib/logic.hs";;

-- Not true, e.g. 'positive 1' and 'CF 1' and '1 = 1 * 1' but not 'gt 1 1'.
mult ::: x:CF -> y:CF -> {z: implies (and (positive x) (positive y)) 
                                     (and (gt z x)     (gt z y))};;