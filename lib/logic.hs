-- Boolean logic.

and a b = case a of
  | True -> b
  | False -> False;;

or a b = case a of
  | True -> True
  | False -> b;;

not a = case a of
  | True -> False
  | False -> True;;

implies a b = case a of
  | False -> True
  | True -> b;;
