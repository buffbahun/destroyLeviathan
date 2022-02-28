#! /bin/bash

# Start program for leviathan

PASS1=$(cat ./level_pass/level1)

PASS=$(sshpass -p "$PASS1" ssh leviathan1@leviathan.labs.overthewire.org -p 2223 " yes | ltrace ./check &> /tmp/str ; cat /tmp/str | grep 'strcmp' | tr ' ' '\n' | grep '^\"' | tr -cd [a-z] ")

PASS2=$(sshpass -p "$PASS1" ssh leviathan1@leviathan.labs.overthewire.org -p 2223 " yes '${PASS};cat /etc/leviathan_pass/leviathan2;exit' | ./check 2> /dev/null | head -n 1")

tput setab 7;tput setaf 1;echo "The password for level2: $PASS2";tput sgr0

echo "$PASS2" > ./level_pass/level2

chmod u+x ./level2.sh
./level2.sh
