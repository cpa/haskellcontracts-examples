-- Predicate contracts describing when 'add' and 'mult' return
-- non-zero.
--
-- Note the '{y:True}' (i.e. 'Any') contract on 'add's second
-- argument.  We can't do the same for 'mult's second argument.
-- cf. ../no/add-and-mult-nonZero.hs.
import "../lib/arithmetic.hs";;

add  ::: {x:notZero x} -> {y:True}      -> {z:notZero z};;
mult ::: {x:notZero x} -> {y:notZero y} -> {z:notZero z};;
