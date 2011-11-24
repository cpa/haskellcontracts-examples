-- Wrongly assert that 'BAD' is CF.

import Lib.Prelude ;;

-- XXX: doesn't work to simply use 'bad' below?  I don't think it's
-- worth fixing.
f = bad ;;

{-# CONTRACT
f ::: CF
#-};;
