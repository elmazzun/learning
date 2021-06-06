#!/bin/bash

# The password for the next level is stored in the only human-readable file in
# the inhere directory. Tip: if your terminal is messed up, try the “reset”
# command.

ssh \
     bandit4@bandit.labs.overthewire.org \
     -p 2220

# Solution:
# bandit4@bandit:~$ cd inhere/
# bandit4@bandit:~/inhere$ find -type f -exec file {} +
# ./-file01: data
# ./-file00: data
# ./-file06: data
# ./-file03: data
# ./-file05: data
# ./-file08: data
# ./-file04: data
# ./-file07: ASCII text
# ./-file02: data
# ./-file09: data
# bandit4@bandit:~/inhere$ cat ./-file07
