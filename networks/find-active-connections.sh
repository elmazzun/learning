#!/bin/bash

# Show active connections towards external hosts

# -a: show both listening and non-listening sockets
# -t: display TCP sockets
# -u: display UDP sockets
# -n: don't try to resolve service names
# -p: show process using socket
# '! ( dst 127.0.0.1 or dst [::1] )': don't show local connections

ss -atunp '! ( dst 127.0.0.1 or dst [::1] )'

