#!/bin/bash

# The password for the next level is stored in the file data.txt next to the
# word millionth

ssh \
    bandit7@bandit.labs.overthewire.org \
    -p 2220

# Solution:
# bandit7@bandit:~$ grep millionth data.txt
