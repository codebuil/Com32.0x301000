printf "\ec\e[40;33m\n"
nasm -felf32 -o boot.o boot.S
gcc -c kernel.c -o kernel.o -nostdlib
gcc link.ld boot.o kernel.o -o kernel.elf -nostdlib
nasm model.asm -o model.o
objdump -D kernel.elf > out.txt
cat out.txt | grep kernel_main
dd if=kernel.elf of=hello.c32 
dd if=model.o of=hello.c32 count=1 conv=notrunc



