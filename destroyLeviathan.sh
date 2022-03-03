#! /bin/bash

# Start program for leviathan

PASS0="$1"

if [ -z "$1" ]
then
	echo "USAGE: $0 <password>"
	exit 1
fi

if [ -d ./level_pass ]
then
	rm -r ./level_pass
fi

mkdir ./level_pass

PASS1=$(sshpass -p "$PASS0" ssh leviathan0@leviathan.labs.overthewire.org -p 2223 "cat ~/.backup/bookmarks.html | grep 'leviathan1' | tr ' ' '\n' | grep -m 1 '\"\$' | tr -d '\"' ")

tput setab 7;tput setaf 1;echo "The password for level1: $PASS1";tput sgr0

echo "$PASS1" > ./level_pass/level1

chmod u+x ./level1.sh
./level1.sh
