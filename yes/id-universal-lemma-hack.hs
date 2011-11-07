data Int = Zero 0
         | Succ 1;;
  
max a b = case (ge a b) of
  | True -> a
  | False -> b;;
    
minusOne x = case x of
  | Zero -> BAD
  | Succ y -> y;;

ge x y = case x of
  | Zero -> isZero y
  | Succ x_ -> ge_ x_ y;;
  
ge_ x y = case y of
  | Zero -> True
  | Succ y_ -> ge x y_;;

isZero x = case x of
  | Zero -> True
  | Succ x_ -> False;;

-- This is a hack to state the lemma: forall z. ge z z.  Seems we
-- can't prove this, since we need induction on z.
id x = x;;
id ::: CF -> {z: ge z z};;
