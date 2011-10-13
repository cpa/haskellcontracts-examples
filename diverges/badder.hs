-- BUG: no arguments here causes problems: generates a Forall with no
-- arguments which confuses equinox.
--
-- badder = BAD;;
-- badder ::: CF;;

-- Times out!
badder x = BAD;;
badder ::: CF -> CF;;
