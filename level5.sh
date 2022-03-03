#! /bin/bash 

# Start program for leviathan

PASS5=$(cat ./level_pass/level5)

PASS6=$(sshpass -p "$PASS5" ssh leviathan5@leviathan.labs.overthewire.org -p 2223 "cd /tmp; ln -s /etc/leviathan_pass/leviathan6 file.log; cd; ./leviathan5; rm /tmp/file.log")

tput setab 7;tput setaf 1;echo "The password for level6: $PASS6";tput sgr0

echo "$PASS6" > ./level_pass/level6

chmod u+x ./level6.sh
./level6.sh
