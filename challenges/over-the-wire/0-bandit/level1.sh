#!/bin/bash

# The password for the next level is stored in a file called - located in the
# home directory

ssh \
    bandit1@bandit.labs.overthewire.org \
    -p 2220

# Solution:
# $ cat ./-
# or
# $ cat < -
