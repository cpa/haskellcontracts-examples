import Lib.Prelude ;;

-- Wrongly assert that 'const BAD' is CF.
const x y = x;;
cbad = const bad;;

{-# CONTRACT
cbad ::: CF -> CF
#-};;
