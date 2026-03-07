.syntax unified
.cpu cortex-m4
.thumb

.global vtable
.global hard_reset

.type vtable, %object
.type hard_reset, %function

vtable:
	.word stack_start
	.word hard_reset+1
	.size vtable, .-vtable

hard_reset:
	bl lab0          @ виклик програми
_loop:
	b _loop          @ стоп
	.size hard_reset, .-hard_reset
