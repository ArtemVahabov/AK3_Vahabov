.syntax unified
.cpu cortex-m4
.thumb

.global bootload

.equ KERNEL_RAM, 0x20000000

.section .text
bootload:
    	ldr r1, =image          @ src
    	ldr r2, =KERNEL_RAM     @ dst
    	movs r4, #0             @ offset = 0

    	ldr r5, =end_of_image   @ end
	subs r5, r5, r1         @ size bytes

copy_loop:
    	cmp r4, r5
    	bge copy_done

    	ldrh r3, [r1, r4]       @ read 16-bit
    	strh r3, [r2, r4]       @ write 16-bit
    	adds r4, r4, #2         @ +2 bytes
    	b copy_loop

copy_done:
    	ldr r0, =KERNEL_RAM     @ vector base in RAM
    	ldr r0, [r0, #4]        @ reset handler (2nd word)
    	bx  r0                  @ jump kernel

.align 2
image:
    .incbin "kernel.bin"
end_of_image:
