.syntax unified
.cpu cortex-m4
.thumb

.global vtable
.global reset_handler

.type vtable, %object
vtable:
	.word stack_start      @ вказівник стека
	.word hard_reset+1     @ вектор reset
	.size vtable, .-vtable
hard_reset:
	ldr r0, =stack_start
	mov sp, r0             @ встановлення SP
	b hard_reset           @ нескінченний цикл
