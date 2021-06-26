#!/usr/bin/env bash

# Simple connection helper: show list of available wifi devices;
# if already connected, show active connections; if not, ask what
# network you'd like to connect.

printf 'Showing list of wifi devices...\n'
nmcli device wifi list
echo

if [[ -z $(nmcli con show --active) ]]; then
    printf "Not connected: enter the SSID network you want to connect to\n"
    read SSID
    nmcli --ask device wifi connect "$SSID"
else
    printf 'Showing active connections...\n'
    nmcli con show --active
fi

