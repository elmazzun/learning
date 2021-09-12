#!/bin/bash

# $1: hostname to reach
if [[ $# -eq 0 ]]; then
    printf "Provide domain to reach\n"
    exit 1
fi

printf "Launching traceroute with following parameters:\n"
# Using format string because printf does not like dashes
printf "%s\n" "-n: don't resolve IP addresses"
printf "%s\n" "-A: perform AS path lookup"
printf "If you see multiple routers on the same line, it means there are\n"
printf "multiple paths to reach my destination starting from router\n\n"
traceroute -nA "$1"
