	.section .text
	.globl load
	.type load @function
load:
	add a4, a0, zero    // initialized a0
	add a2, a0, a1      // store count of 10 in a2 reg
	add a3, a0, zero    // initialize a3 to 0
loop:
	add a4, a3, a4 
	addi a3, a3, 1     // increment addition
	blt a3, a2, loop
	add a0, a4, zero
	ret
	
	
