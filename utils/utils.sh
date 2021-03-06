# This file is not meant to be executed: it is just a utils BASH file to be
# included in other scripts.

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

error() {
    printf "${RED}$@${NC}\n" >&2
}

warning() {
    printf "${YELLOW}$@${NC}\n"
}

ok() {
    printf "${GREEN}$@${NC}\n"
}

get_my_pid() {
    printf "%d\n" $$
}

get_my_parent_pid() {
    printf "%d\n" $PPID
}

get_last_cmd_pid() {
    printf "%d\n" $!
}

am_i_root() {
    [[ $(id -u) -eq 0 ]];
}

log_with_my_pid() {
    printf "[PID %d] %s\n" $(get_my_pid) "$@"
}

# By stracing "lsns", I saw that it iterates over all /proc directories
# containing details about running processes.
what_are_my_ns_proc() {
    local my_pid
    my_pid=$(get_my_pid)
    ls -la /proc/$my_pid/ns
}
