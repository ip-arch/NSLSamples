/******************************************

  M8 Assembler source code.
  (C)Copyright by Naohiko Shimizu, 2009.
  All rights are reserved.  

  Contact information:
  Naohiko Shimizu, Ph.D.

  IP Architecture Laboratory
  Email: naohiko.shimizu@gmail.com
  URL: http://www.ip-arch.jp/

  
  Update informations:

    27-Feb-2009: Initial vesion from tepasm.
******************************************/

%{
#include <stdlib.h>
#include "m8asm.h"
#include "m8asm.tab.h"

struct node {
	char *sym;
	int  id;
	struct node *node;
};

void yyerror(char *s);
int slookup(char *s);
int hextoi(char *s);
int bintoi(char *s);

extern int Line;
int labelindex=0;
char *optable[256];
%}

%%

"0"[xX][0-9a-fA-F]+	{
                yylval.iValue = hextoi(&yytext[2]);
                return INTEGER;
		}
"0"[bB][0-1]+	{
                yylval.iValue = bintoi(&yytext[2]);
                return INTEGER;
		}
[\-0-9][0-9]*      {
                yylval.iValue = atoi(yytext);
                return INTEGER;
            }

[,():<+\-$#] {
                return *yytext;
             }
"*" {
                return *yytext;
             }

[\n] {
                Line++; return *yytext;
             }

";".*$      ;       /* ignore comments */
"\.globl".*$      ;       /* ignore comments */
"\.text".*$      ;       /* ignore comments */
"\.type".*$      ;       /* ignore comments */
"\.size".*$      ;       /* ignore comments */
"\.ident".*$      ;       /* ignore comments */
"\.data".*$      ;       /* ignore comments */

"\.align"	{
		return ALIGN; 
		}
"\.byte"	{
		return BYTE; 
		}

"db"	{
		return BYTE; 
		}

"\.space"	{
		return SPACE; 
		}

"ds"	{
		return BYTE; 
		}

"equ"|"EQU"		{
		return EQU;
		}

"acc"|"ACC"		{
		return ACC;
		}

"pc"|"PC"		{
		return PC;
		}

"zero"|"ZERO"		{
		return ZERO;
		}

"add"|"ADD"            {
                yylval.iValue = 0x0;
		if(!optable[yylval.iValue])
		optable[yylval.iValue] = strcpy((char *)malloc(sizeof(yytext)+1),yytext);
                return ITYPE;
             }


"sub"|"SUB"            {
                yylval.iValue = 0x1;
		if(!optable[yylval.iValue])
		optable[yylval.iValue] = strcpy((char *)malloc(sizeof(yytext)+1),yytext);
                return ITYPE;
             }


"and"|"AND"            {
                yylval.iValue = 0x2;
		if(!optable[yylval.iValue])
		optable[yylval.iValue] = strcpy((char *)malloc(sizeof(yytext)+1),yytext);
                return ITYPE;
             }


"or"|"OR"            {
                yylval.iValue = 0x3;
		if(!optable[yylval.iValue])
		optable[yylval.iValue] = strcpy((char *)malloc(sizeof(yytext)+1),yytext);
                return ITYPE;
             }


"xor"|"XOR"            {
                yylval.iValue = 0x4;
		if(!optable[yylval.iValue])
		optable[yylval.iValue] = strcpy((char *)malloc(sizeof(yytext)+1),yytext);
                return ITYPE;
             }


"not"|"NOT"            {
                yylval.iValue = 0x5;
		if(!optable[yylval.iValue])
		optable[yylval.iValue] = strcpy((char *)malloc(sizeof(yytext)+1),yytext);
                return ITYPE;
             }


"slt"|"SLT"            {
                yylval.iValue = 0x6;
		if(!optable[yylval.iValue])
		optable[yylval.iValue] = strcpy((char *)malloc(sizeof(yytext)+1),yytext);
                return ITYPE;
             }


"mov"|"MOV"            {
                yylval.iValue = 0x7;
		if(!optable[yylval.iValue])
		optable[yylval.iValue] = strcpy((char *)malloc(sizeof(yytext)+1),yytext);
                return ITYPE;
             }


"beq"|"BEQ"            {
                yylval.iValue = 0x8;
		if(!optable[yylval.iValue])
		optable[yylval.iValue] = strcpy((char *)malloc(sizeof(yytext)+1),yytext);
                return MTYPE;
             }


"jmp"|"JMP"            {
                yylval.iValue = 0x9;
		if(!optable[yylval.iValue])
		optable[yylval.iValue] = strcpy((char *)malloc(sizeof(yytext)+1),yytext);
                return MTYPE;
             }


"lod"|"LOD"            {
                yylval.iValue = 0xa;
		if(!optable[yylval.iValue])
		optable[yylval.iValue] = strcpy((char *)malloc(sizeof(yytext)+1),yytext);
                return MTYPE;
             }

"sto"|"STO"            {
                yylval.iValue = 0xb;
		if(!optable[yylval.iValue])
		optable[yylval.iValue] = strcpy((char *)malloc(sizeof(yytext)+1),yytext);
                return MTYPE;
             }


[\._a-zA-Z][\._a-zA-Z0-9]*  { 
		yylval.iValue = slookup(yytext);
                return LABEL;
            }

[ \t\r]+        ;       /* ignore whitespace */

.               yyerror("Unknown character");
%%
static struct node *stable = NULL;

int slookup(char *s) {
  struct node *p;
  for(p=stable;p;p=p->node) {
    if(!strcmp(s,p->sym)) return p->id;
    }
  p=(struct node *)malloc(sizeof(struct node));
  p->id = labelindex++;
  if(labelindex>=LABELMAX) {fprintf(stderr,"label too much\n");exit(1);}
  p->sym = (char *)malloc(strlen(s) + 1);
  strcpy(p->sym,s);
  p->node = stable;
  stable = p;
  return p->id;
}

char * op2nm(int op) {
  return optable[(255&op)>>4];
}
char * id2sym(int id) {
 struct node *p;
 for(p=stable;p;p=p->node) {
   if(p->id == id) return p->sym;
 }
 fprintf(stderr,"id2sym does not find ID(%d)\n", id);
 return NULL;
}

int hextoi(char *s) {
  int val=0;
  while(s[0]) {
    val *= 16;
    if(s[0]>='0' && s[0]<='9') val += s[0] - '0';
    else
    if(s[0]>='a' && s[0]<='f') val += s[0] - 'a' + 10;
    else
    if(s[0]>='A' && s[0]<='F') val += s[0] - 'a' + 10;
    s++;
    }
  return val;
}

int bintoi(char *s) {
  int val=0;
  while(s[0]) {
    val *= 2;
    if(s[0]>='0' && s[0]<='1') val += s[0] - '0';
    s++;
    }
  return val;
}

int yywrap(void) {
    return 1;
}
