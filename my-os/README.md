# My OS

`wiki.osdev.org` tutorial requires`i686-elf-gcc` package: such package is  
present in AUR, thus I built the package via `makepkg`.  
It was not a painless build, that's why I versionate fixes I added in  
`i686-elf-gcc-mkdir.patch`: also, I wrote a custom makepkg.config  
called `my-makepkg.conf`, which is to be passed as parameter in case  
I will rebuild `i686-elf-gcc` package with  
`makepkg -si --config my-makepkg.conf.`

