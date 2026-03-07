CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy

CFLAGS=-x assembler-with-cpp -c -O0 -g3 -mcpu=cortex-m4 -mthumb -Wall

all: firmware.elf firmware.bin

start.o: start.S
	$(CC) $(CFLAGS) start.S -o start.o

lab0.o: lab0.S
	$(CC) $(CFLAGS) lab0.S -o lab0.o

firmware.elf: start.o lab0.o lscript.ld
	$(CC) start.o lab0.o -mcpu=cortex-m4 -mthumb -Wall --specs=nosys.specs -nostdlib -lgcc -T./lscript.ld -o firmware.elf

firmware.bin: firmware.elf
	$(OBJCOPY) -O binary -F elf32-littlearm firmware.elf firmware.bin

qemu: firmware.bin
	qemu-system-gnuarmeclipse --verbose --verbose --board STM32F4-Discovery --mcu STM32F407VG \
	-d unimp,guest_errors --image firmware.bin --semihosting-config enable=on,target=native -s -S

clean:
	rm -f *.o firmware.elf firmware.bin

