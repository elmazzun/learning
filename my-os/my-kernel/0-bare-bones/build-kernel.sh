#!/bin/bash

echo "Creating object files ready for linking"

i686-elf-gcc -std=gnu99 -ffreestanding -g -c start.s -o start.o
echo "Created start.o"

i686-elf-gcc -std=gnu99 -ffreestanding -g -c kernel.c -o kernel.o
echo "Created kernel.o"

i686-elf-gcc -ffreestanding -nostdlib -g -T linker.ld start.o kernel.o \
    -o mykernel.elf -lgcc
echo "Build kernel image"

qemu-system-i386 -kernel mykernel.elf

