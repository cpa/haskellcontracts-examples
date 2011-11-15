-- This is probably boring ... but I don't recall another example that
-- builds up a value to pass to a recursive call.
import Lib.List ;;

{-# CONTRACT
reverse ::: CF -> CF -> CF
#-};;
