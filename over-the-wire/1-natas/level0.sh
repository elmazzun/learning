#!/bin/bash

# This is level is on a website, but I CURL'ed it anyway

readonly USERNAME="natas0"
readonly PASSWORD="natas0"
readonly URL="http://natas0.natas.labs.overthewire.org"

curl \
    -s \
    -u "$USERNAME:$PASSWORD" \
    "$URL" | grep password
