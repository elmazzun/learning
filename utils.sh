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
    printf "%s\n" $$
}

get_my_parent_pid() {
    printf "%s\n" $PPID
}

get_last_cmd_pid() {
    printf "%s\n" $!
}

am_i_root() {
    [[ $(id -u) -eq 0 ]];
}
