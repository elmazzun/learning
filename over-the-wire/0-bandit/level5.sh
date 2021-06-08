#!/bin/bash

# The password for the next level is stored in a file somewhere under the
# inhere directory and has all of the following properties:
# 1 - human-readable
# 2 - 1033 bytes in size
# 3 - not executable

ssh \
    bandit5@bandit.labs.overthewire.org \
    -p 2220

# Solution:
# bandit5@bandit:~$ find ./inhere/ -type f -size 1033c ! -executable -exec file {} +
# ./inhere/maybehere07/.file2: ASCII text, with very long lines
#     That's it ^^^ but I want just the file name
# bandit5@bandit:~$ cat $(find ./inhere/ -type f -size 1033c ! -executable -exec file {} + | cut -d ':' -f 1)
