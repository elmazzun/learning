#!/usr/bin/env bash

set -eu

# Use of PID namespaces requires a kernel that is configured with the
# CONFIG_PID_NS option.
#
# Since Linux 3.7, the kernel limits the maximum nesting depth for PID
# namespaces to 32.

source ../utils/utils.sh

log_with_my_pid "Before unsharing PID namespace"

sudo unshare \
    --fork \
    --pid \
    --mount-proc \
    bash -c \
        'source ../utils/utils.sh && \
        log_with_my_pid "PID namespace: listing current processes..." && \
        ps aux && \
        log_with_my_pid "Quitting PID namespace..." && \
        exit 0'

log_with_my_pid "Out from unshared namespace."

