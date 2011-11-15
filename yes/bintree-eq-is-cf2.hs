-- Probalby boring, but a more complicated CF example.
import Lib.BinaryTree ;;
import Lib.Logic ;;
    
{-# CONTRACT    
isLeaf ::: CF -> CF
#-};;
{-# CONTRACT    
and ::: CF -> CF -> CF
#-};;