#!/bin/bash

# The password for the next level is stored in a file called spaces in this
# filename located in the home directory

ssh \
    bandit2@bandit.labs.overthewire.org \
    -p 2220

# Solution:
# you may type 'cat' and then just Tab using autocompletition
# or prepending each space in the file name with a backslash
