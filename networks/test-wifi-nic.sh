#!/bin/bash

# Promiscuous mode: capture packets on a network that you have connected to
# Monitor mode: capture packets regardless of connected network

# This script is intented for a wireless network interface:
# iwconfig will be used to try and set NIC in monitor mode

if ! which iwconfig &> /dev/null; then
    printf "You need iwconfig to run this script\n"
    exit 1
fi

# Get active interface by checking the default route
INTERFACE=$(ip r | grep default | awk '{print $5}')
printf "Interface: $INTERFACE\n"

if [[ -z "$INTERFACE" ]]; then
    printf "No active interface found. Check your connection\n"
    exit 2
fi

# Turn interface down and try to turn WIFI card to monitor mode
sudo ip link set dev "$INTERFACE" down

sudo iwconfig "$INTERFACE" mode monitor

if [[ "$?" -eq 0 ]]; then
    printf "iwconfig went fine: it seems we are in monitor mode\n"
    iwconfig "$INTERFACE"
    printf "Back to Managed mode\n"
    sudo iwconfig "$INTERFACE" mode managed
    sudo ip link set dev "$INTERFACE" up
    iwconfig "$INTERFACE"
else
    printf "iwconfig went bad: it seems we are not in monitor mode\n"
fi

# Turn interface up again: 
sudo ip link set dev "$INTERFACE" up

sudo ip link set "$INTERFACE" promisc on
if [[ "$?" -eq 0 ]]; then
    printf "Promiscuous mode supported\n"
else
    printf "Promiscuous mode not supported\n"
fi
# Showing interface current status
ip link show "$INTERFACE"

# Back to not promiscuous mode
sudo ip link set "$INTERFACE" promisc off

