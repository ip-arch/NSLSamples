 MOV #10
 ADD $work
 STO work
loop:
 LOD sp
 ADD #1
 STO sp
 MOV PC
 STO (sp)
 JMP subr
 LOD sp
 SUB #1
 STO sp
 JMP loop
subr:
 LOD work
 SUB #1
 STO work
 LOD (sp)
 ADD #4
 JMP ACC    ;retrun from subroutine

work:
 .byte 54

sp:
 .byte stack


stack:
 .space 10
