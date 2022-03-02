#! /bin/bash 

# Start program for leviathan

PASS4=$(cat ./level_pass/level4)

PASS=$(sshpass -p "$PASS4" ssh leviathan4@leviathan.labs.overthewire.org -p 2223 " ./.trash/bin | tr -d ' ' ")
echo "$PASS"
echo "$PASS" > ./input.txt

PASS5=$(python3 ./python-script.py; cat ./pass5)

tput setab 7;tput setaf 1;echo "The password for level5: $PASS5";tput sgr0

echo "$PASS5" > ./level_pass/level5

#chmod u+x ./level2.sh
#./level2.sh
