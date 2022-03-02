#! /bin/bash 

# Start program for leviathan

PASS3=$(cat ./level_pass/level3)

PASS=$(sshpass -p "$PASS3" ssh leviathan3@leviathan.labs.overthewire.org -p 2223 "tmux new -d -s asim; tmux send-keys -t asim.0 './level3' ENTER; tmux send-keys -t asim.0 'snlprintf' ENTER; tmux send-keys -t asim.0 'cat /etc/leviathan_pass/leviathan4' ENTER")

PASS4=$(sshpass -p "$PASS3" ssh leviathan3@leviathan.labs.overthewire.org -p 2223 "tmux new -d -s asim; tmux send-keys -t asim.0 './level3' ENTER; tmux send-keys -t asim.0 'snlprintf' ENTER; tmux send-keys -t asim.0 'cat /etc/leviathan_pass/leviathan4 > /tmp/uniqu.txt' ENTER; tmux kill-session -t asim; cat /tmp/uniqu.txt")

tput setab 7;tput setaf 1;echo "The password for level4: $PASS4";tput sgr0

echo "$PASS4" > ./level_pass/level4

#chmod u+x ./level2.sh
#./level2.sh
