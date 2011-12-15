import Lib.BinaryTree ;;

-- For 'height', which uses 'max', which uses 'ge' :P
{-# CONTRACT
ge ::: CF -> CF -> CF
#-};;

{-# CONTRACT
height ::: CF -> CF
#-};;

{-# CONTRACT
add ::: CF -> CF -> CF
#-};;

{-# CONTRACT
size ::: CF -> CF
#-};;

{-# CONTRACT
isLeaf ::: CF -> CF
#-};;
