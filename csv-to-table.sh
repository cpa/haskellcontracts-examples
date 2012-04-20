#!/bin/bash

# csv2latex can't read from stdin :P
t=$(tempfile -d /tmp)
cat > $t
csv2latex --nohlines --novlines --colorrows=0.75 $t
rm $t