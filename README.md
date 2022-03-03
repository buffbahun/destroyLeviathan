# LEVIATHAN

### This is another project from overthewire.org. This is slightly harder than bandit but with time we are going to destroy it as we did with bandit. So wish me luck.

## Level0:

Loging in at level0 with pass given by the website 'leviathan0', we can see a directory named '.backup' which contains a html file named 'bookmarks.html'. For getting the pass for level1 we can grep the html file with leviathan1 or password so that we can retrive the pass from this large file as follows:
```shell
cat ~/.backup/bookmarks.html | grep 'leviathan1' | tr ' ' '\n' | grep -m 1 '\"\$' | tr -d '\"'
```

Doing this gives the pass for level1.

## Level1

After loging in at level1, we can ls to see a binary with its setuid set. Running this binary prompts us to enter a pass. Now we can ltrace the binary with a random string as pass for figuring more information abaout the binary. We can see a 'strcmp' functions which compares to strings. The first string inside strcmp is the pass for the binary. Now we can run the binary with the acquired pass as an argument. Doing so gives us a sh shell with temporary elivated privilages of level2 so that we can cat the pass of level2 inside the file '/etc/leviathan\_pass/leviathan2'.

