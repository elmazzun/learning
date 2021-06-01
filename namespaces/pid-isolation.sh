#!/usr/bin/env bash

set -eu

# Use of PID namespaces requires a kernel that is configured with the
# CONFIG_PID_NS option.
#
# Since Linux 3.7, the kernel limits the maximum nesting depth for PID
# namespaces to 32.

printf "Before unsharing PID namespace, my PID is %s\n" $$

sudo unshare \
    --fork \
    --pid \
    --mount-proc \
    sh -c \
    'printf "PID namespace unshared: my PID is %s\n" $$ && exit 0'

printf "Out from unshared namespace, my PID is %s again\n" $$

