#!/bin/bash

# The password for the next level is stored in a hidden file in the inhere
# directory.

ssh \
    bandit3@bandit.labs.overthewire.org \
    -p 2220

# Solution:
# bandit3@bandit:~$ ls -la inhere/
# total 12
# drwxr-xr-x 2 root    root    4096 May  7  2020 .
# drwxr-xr-x 3 root    root    4096 May  7  2020 ..
# -rw-r----- 1 bandit4 bandit3   33 May  7  2020 .hidden
# bandit3@bandit:~$ cat inhere/.hidden
