-- The correctness of this depends on the CF axioms, i.e. we need
-- (CF -> CF) -> CF.
id x = x;;
{-# CONTRACT
id ::: CF
#-};;
