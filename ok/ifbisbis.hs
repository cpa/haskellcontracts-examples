data Bool = True 0
          | False 0;;
                     
and x y = case x of
  | True -> y
  | False -> False;;
  
not x = case x of
  | True -> False
  | False -> True;;

or x y = case x of
  | True -> True
  | False -> y;;

implies x y = or (not x) y;;
implies ::: a:{x:True} -> b:{y:True} -> {z:True};;

impliesbis x y = or (not x) y;;
impliesbis ::: a:{x:True} -> b:{y:True} -> {z:True};;

iff x y = and (implies x y) (implies y x);;
iff ::: a:{x:True} -> b:{y:True} -> {z:True};;

if x a b = and (implies x a) (implies (not x) b);;
if ::: a:{x:True} -> b:{y:True} -> c:{z:True} -> {w:True};;

ifbis x a b = or (or (and a b) (and (not a) c)) (and a b);;
ifbis ::: a:{x:True} -> b:{y:True} -> c:{z:True} -> {w:True};;

ifbisbis x a b = case x of
  | True -> a
  | False -> b;;
ifbisbis ::: a:{x:True} -> b:{y:True} -> c:{z:True} -> {w:True};;
