/******************************************

  Simple 16bit Non-Pipeline Processor (SN/X) V1.3
  Compiler source code.

  (C)Copyright by Naohiko Shimizu, 2001-2011
  All rights are reserved.

  Contact information:
  Dr. Naohiko Shimizu

    IP Architecture Laboratory
    Email: nshimizu@ip-arch.jp
    URL: http://www.ip-arch.jp/
  
  Update informations:

    12-Mar-2015: symbol table moved to snxc.y, Suzuki
    15-Sep-2011: array, break, comments, etc. added, SHMZ
    10-Sep-2005: Language specification extended, SHMZ
    04-Aug-2002: modified for PARTHENON lecture
******************************************/

%{
#include <stdlib.h>
#include <string.h>
#include "snxc.h"
#include "y.tab.h"
#define MAXSYMBOL 65536

/* prototypes */
static char *nlookup(char *s);
static int htoi(char *s);

int Line = 1;
int LineBak ;
FILE *yyinbak = NULL;
extern FILE *yyin;
YY_BUFFER_STATE bstate;
%}

%start COMM INCLUDE

digit	[0-9]
integer	{digit}({digit})*
hexdigit	[0-9A-Fa-f]
hexdecimal	0[xX]{hexdigit}({hexdigit})*
symbols		[_a-zA-Z][_a-zA-Z0-9]*
%%

"//".*$	; // comments
<INITIAL>"/*"		{ BEGIN COMM;}
<COMM>"*/"	{ BEGIN INITIAL;}
<COMM>.		;
<INITIAL>"#include" {BEGIN INCLUDE;}
<INCLUDE>[ \t\r\n] ;
<INCLUDE>["].*["]	{
	char *filename;
	filename = (char *)calloc(strlen(yytext),sizeof(char));
	memcpy(filename, &yytext[1], strlen(yytext)-2);
	if(yyinbak) yyerror("include nesting");
	yyinbak = yyin;	
	LineBak=Line;
	bstate = YY_CURRENT_BUFFER;
	yyin = fopen(filename,"r");
	if(!yyin) yyerror("file open error");
	Line = 1;
	yy_switch_to_buffer(yy_create_buffer(yyin, YY_BUF_SIZE));
	BEGIN INITIAL;
	}

<INITIAL>{integer} {
                yylval.IntVal = atoi(yytext);
                return INTEGER;
            }

<INITIAL>{hexdecimal}      {
                yylval.IntVal = htoi(&yytext[2]);
                return INTEGER;
            }

<INITIAL>[-()<>=+*&|~/;{},.\[\]] {
                return *yytext;
             }

<INITIAL>"&&"            return LAND;
<INITIAL>"||"            return LOR;
<INITIAL>">>"            return RSHIFT;
<INITIAL>"<<"            return LSHIFT;
<INITIAL>"++"            return PP;
<INITIAL>"--"            return MM;
<INITIAL>">="            return GE;
<INITIAL>"<="            return LE;
<INITIAL>"=="            return EQ;
<INITIAL>"!="            return NE;
<INITIAL>"interrupt"     return INTER;
<INITIAL>"for"           return FOR;
<INITIAL>"while"         return WHILE;
<INITIAL>"if"            return IF;
<INITIAL>"else"          return ELSE;
<INITIAL>"return"        return RETURN;
<INITIAL>"break"         return BREAK;
<INITIAL>"print"         return PRINT;
<INITIAL>"mem"           return MEM;
<INITIAL>"void"          return DEF;
<INITIAL>"int"           return DEF;
<INITIAL>"halt"          return HALT;

<INITIAL>{symbols}       { 
    yylval.Symbol = nlookup(yytext);
   return SYMBOL;
  }

[ \t\r]+        ;       /* ignore whitespace */
[\n]		Line++;

<INITIAL>.               yyerror("Unknown character");
%%
int yywrap(void) {
    fclose(yyin);
    if(yyinbak) {
	yy_switch_to_buffer(bstate);
	Line=LineBak;
	yyinbak=NULL;
	return 0;
    }
    else
	    return 1;
}

/* type of nodes in a name table */

typedef struct namelist {
  char *name;
  struct namelist *next;
}  NameNode;

static NameNode *ntable = NULL;

/* functions for the name table */

static char *nlookup(char *s)
{
  NameNode *p = ntable;

  while (p) {
    if (!strcmp(s,p->name)) return(p->name);
    p = p->next;
  }
  return nregist(s);
}

char *nregist(char *s)
{
  NameNode *p = ntable;

  if ((p = (NameNode *)malloc(sizeof(NameNode))) == NULL)  {
    yyerror("memory exhausted");
  }
  p->name = (char *)malloc(strlen(s)+1);
  strcpy(p->name,s);
  p->next = ntable;
  ntable = p;
  return(p->name);
}

/* convert a hexadecimal representation to a number */
int htoi(char *s)
{
  int value = 0;
  char c;

  while((c = *s) != 0) {
    value = value<<4;
    c = c - '0'; 
    if (c < 10)
      value += c;
    else {
      c -= 7;
      if (c < 16)
        value += c;
      else
        value += (c - 32);
    }
    s++;
  }
  return value;
}
  
