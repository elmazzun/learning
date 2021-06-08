#!/bin/bash

# The password for the next level is stored somewhere on the server and has all
# of the following properties:
# 1 - owned by user bandit7
# 2 - owned by group bandit6
# 3 - 33 bytes in size

ssh \
    bandit6@bandit.labs.overthewire.org \
    -p 2220

# Solution:
# bandit6@bandit:~$ find / -user bandit7 -group bandit6 -size 33c
#     ...lots of Permission denied...
# /var/lib/dpkg/info/bandit7.password
#     ^^^ found ya!
