Small CPU example m8
	Copyright 2009-2010 IP ARCH, Inc. All rights reserved.

m8 is a small CPU example to demonstrade NSL.

Registers:
  acc: 8bit accumulator
  pc : 8bit program counter (zero at reset)

Addressing mode: opcode 3:0
  1:IMM: immediate 8bit integer as #255 or label for memory instructions
  2:PC : pc
  3:acc: acc
  4:MEM: memory contents as $128 or (label) for memory instructions
  0:zero: 0

Instructions: opcode 7:4
  0:ADD	add
  1:SUB	subtract
  2:AND	logical and
  3:OR	logical or
  4:XOR	logical xor
  5:NOT	not
  6:SLT	set less than
  7:MOV	move to acc
  8:BEQ	branch when acc==0
  9:JMP	jump
  A:LOD	load from memory
  B:STO	store to memory

Subroutine call code example.

00:710A		MOV	#10
02:0424		ADD	$work
04:B124		STO	 work 
06:A125	loop:	LOD	 sp 
08:0101		ADD	#1
0A:B125		STO	 sp 
0C:72		MOV	PC
0D:B425		STO	(sp)
0F:9119		JMP	 subr 
11:A125		LOD	 sp 
13:1101		SUB	#1
15:B125		STO	 sp 
17:9106		JMP	 loop 
19:A124	subr:	LOD	 work 
1B:1101		SUB	#1
1D:B124		STO	 work 
1F:A425		LOD	(sp)
21:0104		ADD	#4
23:93		JMP	ACC
24:	work:	.byte	54
25:	sp: 	.byte	stack
26:	stack:	.space	10
