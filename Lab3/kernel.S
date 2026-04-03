.syntax unified
.cpu cortex-m4
.thumb

.global vtable
.global k_reset

.extern dbgput_line
.extern dbgput_num

.equ A, 4
.equ B, 2
.equ C, 5

.section .interrupt_vector
vtable:
    	.word __stack_start
    	.word k_reset + 1

.section .rodata
msg: .asciz "kernel started!\n"

.section .text
k_reset:
    	ldr r0, =msg
    	bl dbgput_line

    	@ r0 = (A+B)/2
    	movs r0, #A
    	movs r1, #B
    	adds r0, r0, r1
    	lsrs r0, r0, #1

    	@ r2 = C!
    	movs r2, #1
    	movs r3, #C
fact_loop:
    	cmp r3, #1
	blt fact_done
    	muls r2, r2, r3
    	subs r3, r3, #1
    	b fact_loop
fact_done:
    adds r0, r0, r2

    	bl dbgput_num           @ print r0 (hex in your print.S)
1:
    	b 1b
