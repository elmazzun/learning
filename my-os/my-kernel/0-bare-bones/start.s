// We declare 'kernel_main' label as being external to this file: that's
// because it's the name of the main C function in 'kernel.c'
.extern kernel_main

// We declare 'start' label as global (accessible from outside this file),
// since the linker will need to know where it is. In a bit, we'll actually
// take a look at the code that defines this label.
.global start

.set MB_MAGIC, 0x1BADB002
.set MB_FLAGS, (1 << 0) | (1 << 1)
.set MB_CHECKSUM, (0 - (MB_MAGIC + MB_FLAGS))

.section .multiboot
    .align 4
    .long MB_MAGIC
    .long MB_CHECKSUM

.section .bss
    .align 16
    stack_bottom:
        .skip 4096
    stack_top:

.section .text
    start:
        mov $stack_top, %esp

        call kernel_main

        hang:
            cli
            hlt
            jmp hang

