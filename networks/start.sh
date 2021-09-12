#!/bin/bash

function printfl {
    printf "[script] $1"
}

# Get local host external IP address
# No input needed
function get-my-external-ip {
    printf "$(curl -s ifconfig.me)\n"
}

# Get ASN of provided IP address
# $1: my external ip address
function get-my-asn {
    local MY_EXTERNAL_IP_ADDR="$1"
    whois -h whois.cymru.com " -v $MY_EXTERNAL_IP_ADDR"
}

function main {
    MY_EXTERNAL_IP_ADDR=$(get-my-external-ip)
    printfl "My external IP address is $MY_EXTERNAL_IP_ADDR\n"

    printfl "Getting ASN info about me\n"
    get-my-asn "$MY_EXTERNAL_IP_ADDR"
}

main


