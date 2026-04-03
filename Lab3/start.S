.syntax unified
.cpu cortex-m4
.thumb

.global vtable
.global hard_reset

.extern dbgput_line
.extern bootload

.section .interrupt_vector
vtable:
    	.word __stack_start
    	.word hard_reset+1

.section .rodata
d: .asciz "starting\n"

.section .text
hard_reset:
	ldr r0, =d
    	bl dbgput_line

    	bl bootload

1:
    	b 1b
