# Kernel virtualization

One may download kernel source code, compile it and then launch QEMU providing  
it the fresh compiled kernel...or just use the binary kernel stored in his  
`/boot` directory: if you have no need to virtualize a different kernel from  
the one running on your machine, you may run QEMU with the same kernel binary  
your PC used to boot.  
For now, I will use kernel binaries already present on my running system.

My system has the following infos:

```bash
$ uname -m
x86_64

$ uname -r
5.12.6-arch1-1

$ qemu-system-x86_64 --version | grep version
QEMU emulator version 6.0.0
```

## Kernel binaries

Linux kernel binaries formats differ in size and format.  

* `vmlinuz`: *compressed* and *bootable* kernel; it is located in the `boot/`
  directory, which holds the files needed to begin booting the system.

  `vmlinuz` might be the actual kernel executable or it could be a link to the
  kernel executable.

  `vmlinuz` also has a `gzip` decompressor code built into it.

  Looking for `vmlinuz` in my system produces the following output:
  ```bash
  $ sudo find / -type f -name "*vmlinuz*"
  /boot/vmlinuz-linux
  /usr/lib/modules/5.12.6-arch1-1/vmlinuz
  ```

* `vmlinux`: *non-compressed* and *non-bootable* kernel; `vmlinux` is generally
  just an intermediate step to producing `vmlinuz`.

  Looking for `vmlinux` in my system produces the following output:
  ```bash
  $ sudo find / -type f -name "*vmlinux*"
  /usr/lib/modules/5.12.6-arch1-1/build/scripts/extract-vmlinux
  /usr/lib/modules/5.12.6-arch1-1/build/scripts/gdb/vmlinux-gdb.py
  /usr/lib/modules/5.12.6-arch1-1/build/scripts/link-vmlinux.sh
  /usr/lib/modules/5.12.6-arch1-1/build/vmlinux
  /usr/lib/modules/5.12.6-arch1-1/build/include/asm-generic/vmlinux.lds.h
  /sys/kernel/btf/vmlinux
  ```

* `bzImage`: Linux kernel is compiled by issuing `make bzImage`, which results
  in the creation of a file named `bzImage`; such file is then copied in `boot/`
  and renamed `vmlinuz`.

* `zImage`: a compiled kernel named `zImage` is created on some older systems
  and is retained on newer ones for backward compatibility.

## Sources

* [www.linfo.org/vmlinuz.html](http://www.linfo.org/vmlinuz.html)

