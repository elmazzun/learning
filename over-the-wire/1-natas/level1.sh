#!/bin/bash

# "You can find the password for the next level on this page, but rightclicking
# has been blocked!"
# Just press CTRL+U on the page in order to show page source or just run this
# script and password will be shown

readonly USERNAME="natas1"
readonly PASSWORD=$(grep "level0" passwords | cut -d ':' -f 2)
readonly URL="http://natas1.natas.labs.overthewire.org"

curl \
    -s \
    -u "$USERNAME:$PASSWORD" \
    "$URL" | grep password
