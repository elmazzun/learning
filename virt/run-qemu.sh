#!/bin/bash

qemu-system-x86_64 \
    -boot d \
    -cdrom ../isos/alpine-standard-3.13.5-x86_64.iso \
    -m 1024 \
    -net nic \
    -net user

