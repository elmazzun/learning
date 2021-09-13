#!/bin/bash

# For Nmap host discovery, refer to https://nmap.org/man/it/man-host-discovery.html

# Assuming host bit size of 24 (256 address in LAN);
# assuming that my IP address belongs to a single C class;
# assuming that only an active connection is active on this host, be it Ethernet or WLAN;
# assuming no active VPN connections;
# assuming no active Docker interfaces.
# ...lots of assumptions but gotta start from somewhere.

# Find my modem IP address
# No input
function get_modem_ip_addr() {
    ip r | grep default | awk '{print $3}'
}

# Find my IP address to exclude it from next scans
# No input
function get_my_ip_addr() {
    # Find active interface and get its assigned IP address
    local INTERFACE=$(ip r | grep default | awk '{print $5}')
    ip a show "$INTERFACE" | grep -Po "(?<=inet )[^ /]+"
}

# LAN ping sweep
# $1: my IP address
# $1: gatewat/modem IP address
function ping_sweep() {
    nmap -sn --exclude "$MY_IP_ADDR" -v "$MODEM_ADDR"/24 -oG - | awk '/Up$/{ print $2 }'
}

MODEM_ADDR=$(get_modem_ip_addr)
MY_IP_ADDR=$(get_my_ip_addr)

printf "Up hosts:\n"
ping_sweep "$MY_IP_ADDR" "$MODEM_ADDR"

