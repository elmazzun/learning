# Custom Linux kernel modules

## Compiling kernel modules

From `linux-kernel-labs.github.io`:

> Compiling a kernel module differs from compiling an user program.  
> First, other headers should be used. Also, the module should not be linked to  
> libraries. And, last but not least, the module must be compiled with the same  
> options as the kernel in which we load the module. For these reasons, there is  
> a standard compilation method (kbuild).  

Each directory contains a kernel module source, a `Makefile` and `Kbuild`.