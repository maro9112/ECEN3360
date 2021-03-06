 	.syntax unified
 	.cpu cortex-m0
 	.align	2
 	.global	fibonacci
 	.thumb
 	.thumb_func
 fibonacci:
   		push {r7, lr}
		mov r7, r0
		cmp r7, #1
		beq end
		subs r1, r7, r7
		adds r0, r1, #1
		fib:
			adds r2, r0, r1
			mov r1, r0
			mov r0, r2
			subs r7, r7, #1
			cmp r7, #1
			bgt fib
		end:
  			pop	{r7, pc}
