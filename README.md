# LEVIATHAN

#### This is another project from overthewire.org. This is slightly harder than bandit but with time we are going to destroy it as we did with bandit. So wish me luck.

## Level0:

Loging in at level0 with pass given by the website 'leviathan0', we can see a directory named '.backup' which contains a html file named 'bookmarks.html'. For getting the pass for level1 we can grep the html file with leviathan1 or password so that we can retrive the pass from this large file as follows:
```shell
cat ~/.backup/bookmarks.html | grep 'leviathan1' | tr ' ' '\n' | grep -m 1 '\"\$' | tr -d '\"'
```

Doing this gives the pass for level1.

## Level1

After loging in at level1, we can ls to see a binary with its setuid set. Running this binary prompts us to enter a pass. Now we can ltrace the binary with a random string as pass for figuring more information abaout the binary. We can see a 'strcmp' functions which compares to strings. The first string inside strcmp is the pass for the binary. Now we can run the binary with the acquired pass as an argument. Doing so gives us a sh shell with temporary elivated privilages of level2 so that we can cat the pass of level2 inside the file '/etc/leviathan\_pass/leviathan2'.

## Level2

After loging in as level2, we can ls to see a binary with its setuid set. Running this binary with a argument as a file prints the content of the file, but thought its setuid as set as leviathan3 it doesnt print the pass for level3. Using ltrace to this binary we find that first the binary check the permission to open the file or not without setting its setuid. If it can them it prints the file but if cant then it returns with error. As the binary calls the 'system()'
 function if it can read a file to use cat to print the file. system() function executes shell commands. So to hack the pass, we can create a symbolic link with a file that this binary has permission to read with a name such as 'somename;bash'. The ';bash' portion of the file name makes it possible to execute bash in the system() call after the setuid is set so that now we can print the pass for level3 as leviathan3.

## Level3

After loging in as level3, we can ls to see a binary with its setuid set. Running this binary prompts for password. So again we can use ltrace with this binary. Doing so we again get a prompt, entering a random pass to further execute the binary gives a 'strcmp()' function with its first argument as 'snlprintf' and its second argument as the password we just entered. This function compares the strings in its arguments and return true its the strings matches else false. So now we know the pass is 'snlprintf'. Now entering the pass to the prompt gives a sh shell. Now as the setuid is set we can get the pass for level4.

## Level4

After loging in as level4, we can ls to '~/.trash/' see a binary named 'bin' with its setuid set. This binary gives the binary form for the pass of level5. Now to convert the binary data to ascii form we can create a python script to use the 'chr()' function. This function converts binary data to its ascii equivalent character. Doing this gives the pass for level5.

## Level5

After loging in as level5, we can ls to see a binary with its setuid set. This binary located a file named 'file.log' in the /tmp/ directory and read its content. Now we can create a symbolic link named as file.log which links to '/etc/leviathan\_pass/leviathan6' so that as the binary with temporary privilages of level6 can read the pass file which is linked by the symbolic link we created named 'file.log' inside /tmp/. Now runnung the binary we get the pass for level6.

## Level6


