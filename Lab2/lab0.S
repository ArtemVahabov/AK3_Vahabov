.syntax unified
.cpu cortex-m4
.thumb

.global lab0

/*константи*/
.equ A, 4
.equ B, 2
.equ C, 5

lab0:
	push {lr}

	/*константи, одже мій вираз – (4+2)/2+5! */
	movs r0, #A
	movs r1, #B
	adds r0, r0, r1
	lsrs r0, r0, #1

	/* r2 = c! */
	movs r2, #1
	movs r3, #C

fact_loop:
	cmp  r3, #1
	blt  fact_done
	muls r2, r2, r3
	subs r3, r3, #1
	b    fact_loop

fact_done:
	adds r0, r0, r2      /* r0 += c! */

	pop {pc}
