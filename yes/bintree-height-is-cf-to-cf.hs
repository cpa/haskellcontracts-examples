import Lib.BinaryTree ;;

{-# CONTRACT
ge  ::: CF -> CF -> CF
#-};;
{-# CONTRACT
ge_ ::: CF -> CF -> CF
#-};;
{-# CONTRACT
max ::: CF -> CF -> CF
#-};;
-- Could we weaken the precondition to '{x: isZero x `or` isSucc x}' ?
{-# CONTRACT
isZero ::: CF -> CF
#-};;
{-# CONTRACT
height ::: CF -> CF
#-};;