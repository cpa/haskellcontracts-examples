import Lib.Prelude ;;
import Lib.Arithmetic ;;
           
-- Higher order examples make clear the desire for richer contracts.
-- The best we could do here is probably something like
--
--   forall c1, c2[x]. (x:c1 -> c2)
--                  -> xs:(letrec c3.(Nil | Cons(c1,c3)))
--                  -> ys:({ys:length ys = length xs} 
--                         && zip(xs,ys):(letrec c4. Nil | Cons((x:c1,c2),c4)))
--
-- What's a nice way to say that the result mirrors the input, but
-- satisfying c2 where the input satisfied c1? 'zip' is general here,
-- but length would be 'shape' more generally.
{-# CONTRACT
map ::: (CF -> CF) -> CF -> CF
#-};;
