#!/bin/bash

rm *.o mykernel.elf

echo "Creating object files ready for linking"

i686-elf-gcc -std=gnu99 -ffreestanding -g -c start.s -o start.o
echo "Created start.o"

i686-elf-gcc -std=gnu99 -ffreestanding -g -c kernel.c -o kernel.o
echo "Created kernel.o"

i686-elf-gcc -ffreestanding -nostdlib -g -T linker.ld start.o kernel.o \
    -o mykernel.elf -lgcc
echo "Build kernel image"

# forum.osdev.org/viewtopic.php?f=1&t=33638
# Broken PVH ELF note handling can be bypassed by passing
# -machine type=pc-i440fx-3.1 on the command line
qemu-system-i386 -machine type=pc-i440fx-3.1 -kernel mykernel.elf
