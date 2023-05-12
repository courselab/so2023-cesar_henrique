CFLAGS = -m16 -O0 -I. -Wall -fno-pic -fcf-protection=none --freestanding -nostdlib

all:  hw-a.bin hw-b.bin hw-c.bin
	@echo "Making all binaries..."

# Part a
hex2bin: hex2bin.c
	gcc -o $@ $<

hw-hex.bin: hex2bin hw-a.hex
	./../$<

# Part b
hw-b.o : hw-b.S
	as --32 $< -o $@

hw-b.bin : hw-b.o
	ld -melf_i386 --oformat=binary -Ttext=0x7c00  $< -o $@

# Part c
hw-c_utils.o hw-c_rt0.o: hw-c_utils.c hw-c_rt0.c
	gcc $(CFLAGS) -c $^

hw-c.bin: hw-c.c hw-c_rt0.o hw-c_utils.o hw-c.ld
	gcc -m16 -O0 -I. -Wall -fno-pic -fcf-protection=none  --freestanding -nostdlib -T hw-c.ld -Wl,--orphan-handling=discard hw-c.c -o $@

# QEMU
%.bin/run: %.bin
	qemu-system-i386 -drive format=raw,file=$< -net none

.PHONY: clean

clean:
	rm -rf *.bin *.o *.s hex2bin
