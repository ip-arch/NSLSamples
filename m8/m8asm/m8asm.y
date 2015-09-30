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
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "m8asm.h"

extern int yydebug;

FILE *ofile;
FILE *lfile;

void yyerror(char *s);

typedef   enum {unused, defined} status;
typedef struct {
   status stat;
   int sft;
   unsigned int data;
   unsigned int len;
   unsigned int pc;
   int offset,id;
   void *link;
} labelp;

labelp labeltable[LABELMAX];
static unsigned int pc = 0;
static labelp imem[65536];
static enum {Seconds, Intel, Hex, Binary} fmt;
int Line = 1;
int lst = 0;
%}

%union {
    int iValue;                 /* integer value */
    nodeType *nPtr;             /* node pointer */
};

%token <iValue> INTEGER REG LABEL ITYPE MTYPE
%token DEFLBL EQU ALIGN BYTE WORD LONG ACC PC ZERO SPACE

%type <nPtr> stmt expr con

%%

program:
        init function                { dump(); exit(0); }
        ;

init:
        /* NULL */  	                { sinit();}
        ;

function:
          function stmt                 { ex($2,1,0); freeNode($2); }
        | /* NULL */
        ;

con:	INTEGER		{ $$ = con($1); }
	| '-' INTEGER 	{ $$ = con(-$2); }
	| '*'		{ $$ = con(pc); }
	| '-' '*'	{ $$ = con(-pc); }
	;

expr:	con		{ $$ = $1; }
	| LABEL		{ if(labeltable[$1].stat == defined) 
				$$ = con(labeltable[$1].data + imem[pc].offset);
			   else $$ = opr(LABEL,1,$1); }
	| expr '+' con 	{ imem[pc].offset += $3->con.value; $$ = $1;}
	| expr '-' con 	{ imem[pc].offset -= $3->con.value; $$ = $1;}
	;

stmt:
          '\n'          { $$ = opr(';', 2, NULL, NULL); }
        | LABEL ':'     { $$ = opr(DEFLBL, 1, con($1)); }
        | LABEL EQU expr { $$ = opr(DEFLBL, 2, con($1), $3); }
        | ALIGN expr     { $$ = opr(ALIGN, 1, $2); }
        | BYTE expr      { $$ = opr(BYTE, 1, $2); }
        | SPACE expr      { $$ = opr(SPACE, 1, $2); }
	| MTYPE  ZERO '\n'
			{ $$ = opr(MTYPE,1,con($1<<4)); }
	| MTYPE  expr '\n'
			{ $$ = opr(MTYPE,2,con(($1<<4)+1), $2); }
	| MTYPE  PC '\n'
			{ $$ = opr(MTYPE,1,con(($1<<4)+2)); }
	| MTYPE  ACC '\n'
			{ $$ = opr(MTYPE,1,con(($1<<4)+3)); }
	| MTYPE  '(' expr ')' '\n'
			{ $$ = opr(MTYPE,2,con(($1<<4)+4), $3); }
	| ITYPE  ZERO '\n'
			{ $$ = opr(ITYPE,1,con($1<<4)); }
	| ITYPE  '#' expr '\n'
			{ $$ = opr(ITYPE,2,con(($1<<4)+1), $3); }
	| ITYPE  PC '\n'
			{ $$ = opr(ITYPE,1,con(($1<<4)+2)); }
	| ITYPE  ACC '\n'
			{ $$ = opr(ITYPE,1,con(($1<<4)+3)); }
	| ITYPE  '$' expr '\n'
			{ $$ = opr(ITYPE,2,con(($1<<4)+4), $3); }
	| ITYPE  expr '\n'
			{ $$ = opr(ITYPE,2,con(($1<<4)+4), $2); }
        ;



%%

nodeType *con(int value) {
    nodeType *p;

    /* allocate node */
    if ((p = malloc(sizeof(conNodeType))) == NULL)
        yyerror("out of memory");

    /* copy information */
    p->type = typeCon;
    p->con.value = value;

    return p;
}

nodeType *opr(int oper, int nops, ...) {
    va_list ap;
    nodeType *p;
    size_t size;
    int i;

    /* allocate node */
    size = sizeof(oprNodeType) + (nops - 1) * sizeof(nodeType*);
    if ((p = malloc(size)) == NULL)
        yyerror("out of memory");

    /* copy information */
    p->type = typeOpr;
    p->opr.oper = oper;
    p->opr.nops = nops;
    va_start(ap, nops);
    for (i = 0; i < nops; i++)
        p->opr.op[i] = va_arg(ap, nodeType*);
    va_end(ap);
    return p;
}

void freeNode(nodeType *p) {
    int i;

    if (!p) return;
    if (p->type == typeOpr && p->opr.oper != LABEL) {
        for (i = 0; i < p->opr.nops; i++)
            freeNode(p->opr.op[i]);
    }
    free (p);
}

void yyerror(char *s) {
    extern char * yytext;
    fprintf(stderr, "%s (%s) at %d\n", s, yytext, Line);
}
void sinit() {
int i;
 for(i=0;i<LABELMAX;i++) {
   labeltable[i].stat = unused;
   labeltable[i].id = -1;
   labeltable[i].link = NULL;
   }
 for(i=0;i<65536;i++) {
   		imem[i].offset = 0;
   		imem[i].data = 0;
   		imem[i].link = NULL;
    }

}

int ex(nodeType *p, int reg, int pres) {
 labelp *link;
 int id, data, i;
 if(!p) return 0;
 if(p->type != typeOpr) return 1;
 switch(p->opr.oper) {
  case ALIGN:
  	data = p->opr.op[0]->con.value;
	  imem[pc].len = (data - (pc & (data -1)))&(data -1);
	  imem[pc].data = -1;
	  imem[pc].offset = 0;
	  pc+= (data - (pc & (data -1)))&(data -1);
  	  if(lst) fprintf(lfile,"%02X:\t\t\t.align\t%d\n", pc, data);
	break;
  case SPACE:
	  imem[pc].len = p->opr.op[0]->con.value;
	  imem[pc].data = -1;
	  imem[pc].offset = 0;
  	  if(lst) fprintf(lfile,"%02X:\t\t\t.space\t%d\n", pc, imem[pc].len);
	  pc+= imem[pc].len;
	break;
  case BYTE:
	imem[pc].len = 1;
	if(p->opr.op[0]->type == typeCon) {
		imem[pc].data = p->opr.op[0]->con.value + imem[pc].offset;
  	if(lst) fprintf(lfile,"%02X:\t\t\t.byte\t%d\n", pc, imem[pc].data&255);
	}
	else {
		id=(int)p->opr.op[0]->opr.op[0];
		if(labeltable[id].stat == defined) {
			imem[pc].data = ((labeltable[id].data + imem[pc].offset) & 0xff);
			if(lst) fprintf(lfile,"%02X:\t\t\t.byte\t%d\n", pc, imem[pc].data&255);
		  }
		else {
			imem[pc].sft = 0;
			imem[pc].pc = pc;
			if(labeltable[id].link) {
				imem[pc].link = labeltable[id].link;
			}
			labeltable[id].link = &imem[pc]; 
			if(lst) fprintf(lfile,"%02X:\t\t\t.byte\t%s\n", pc, id2sym(id));
		}
	}
	pc +=1;
	break;
  case ITYPE:
  case MTYPE:
	imem[pc].len = p->opr.nops;
	imem[pc].data = (p->opr.op[0]->con.value);
	if(p->opr.nops==1) {
		char *oprand;
		switch(imem[pc].data & 15) {
		case 2: oprand = "PC"; break;
		case 3: oprand = "ACC"; break;
		case 0: oprand = "ZERO"; break;
		}
		if(lst) fprintf(lfile,"%02X:%02X\t\t%s\t%s\n",
		pc, imem[pc].data&0xff, op2nm(p->opr.op[0]->con.value),  oprand);
		}
	else {
	if(p->opr.op[1]->type == typeCon) {
		imem[pc].data += (((p->opr.op[1]->con.value + imem[pc].offset) & 0xff)<<8);
		if(lst) 
		switch(p->opr.oper) {
		case ITYPE: fprintf(lfile,"%02X:%02X%02X\t\t%s\t%c%02X\n",
			pc, imem[pc].data&0xff,(imem[pc].data + imem[pc].offset)>>8, op2nm(p->opr.op[0]->con.value),  (imem[pc].data&1)?'#':'$', (imem[pc].data>>8)&0xff);
			break;
		case MTYPE: fprintf(lfile,"%02X:%02X%02X\t\t%s\t%c%02X%c\n",
			pc, imem[pc].data&0xff,(imem[pc].data + imem[pc].offset)>>8, op2nm(p->opr.op[0]->con.value),  (imem[pc].data&1)?' ':'(', (imem[pc].data>>8)&0xff,  (imem[pc].data&1)?' ':')');
		}
		}
	else {
		nodeType *t;
		t = p->opr.op[1];
		id = (int) t->opr.op[0];
		if(labeltable[id].stat == defined) {
		imem[pc].data += 
		((labeltable[id].data + imem[pc].offset) & 0xff) << 8;
		if(lst) 
		switch(p->opr.oper) {
		case ITYPE:  fprintf(lfile,"%02X:%02X%02X\t\t%s\t%c%02X\n",
			pc, imem[pc].data&0xff,(imem[pc].data + imem[pc].offset)>>8, op2nm(p->opr.op[0]->con.value),  (imem[pc].data&1)?'#':'$', labeltable[id].data&0xff);
			break;
		case MTYPE: fprintf(lfile,"%02X:%02X%02X\t\t%s\t%c%02X%c\n",
			pc, imem[pc].data&0xff,(imem[pc].data + imem[pc].offset)>>8, op2nm(p->opr.op[0]->con.value),  (imem[pc].data&1)?' ':'(', (labeltable[id].data>>8)&0xff,  (imem[pc].data&1)?' ':')');
		}
	        }
	else {
		if(lst) 
		switch(p->opr.oper) {
		case ITYPE: fprintf(lfile,"%02X:%02X%02X\t\t%s\t%c%s\n",
			pc, imem[pc].data&0xff,(imem[pc].data + imem[pc].offset)>>8, op2nm(p->opr.op[0]->con.value),  (imem[pc].data&1)?'#':'$', id2sym(id));
			break;
		case MTYPE: fprintf(lfile,"%02X:%02X%02X\t\t%s\t%c%s%c\n",
			pc, imem[pc].data&0xff,(imem[pc].data + imem[pc].offset)>>8, op2nm(p->opr.op[0]->con.value),  (imem[pc].data&1)?' ':'(', id2sym(id),  (imem[pc].data&1)?' ':')');
		}
		imem[pc].sft = 8;
		imem[pc].pc = pc;
		if(labeltable[id].link) {
			imem[pc].link = labeltable[id].link;
		}
		labeltable[id].link = &imem[pc]; 
	   }
	  }
	}
	pc += p->opr.nops; break;
  case DEFLBL:
              id = p->opr.op[0]->con.value;
              if(labeltable[id].stat == defined) {
				fprintf(stderr,"Double defined label %s\n",	id2sym(id));
				exit(1);
				}
              labeltable[id].stat = defined;
	      labeltable[id].id = id; 
  	      if(p->opr.nops == 1) {
		if(lst) fprintf(lfile,"%02X:\t\t%s:\n", pc, id2sym(id));
                    data = pc;
	      }
	      else if(p->opr.nops == 2) {
					if(p->opr.op[1]->type == typeCon)
	                    data = p->opr.op[1]->con.value;
	                 else {
						fprintf(stderr,"equ does not support forward reference.\n");
						exit(1);
						   }
      	      }
              labeltable[id].data = data;
              link = labeltable[id].link;
              while(link) {
                link->data += ((data + link->offset) & 0xff) << link->sft;
                link = link->link;
                }
              break;
 }
return 0;
}

void dump() {
int i,j,sum;
for(i=0; i<pc; i+= imem[i].len) {
switch(fmt) {
case Intel:
 fprintf(ofile,":%02X%04X00", imem[i].len, i);
 sum = 0;
 for(j=0; j<imem[i].len; j++) {
   fprintf(ofile,"%02X", (imem[i].data>>((j)*8)) & 0xff);
   sum  = sum + (imem[i].data>>((j)*8)) & 0xff;
   }
   sum = (-( imem[i].len + (i>>8) + (i & 0xff) + sum)) & 0xff;
   fprintf(ofile,"%02X\n", sum);
 break;
case Binary:
 for(j=0; j<imem[i].len; j++)
   fprintf(ofile,"%c", (imem[i].data>>((j)*8)) & 0xff);
 break;
case Hex:
 for(j=0; j<imem[i].len; j++)
   fprintf(ofile,"%02X ", (imem[i].data>>((j)*8)) & 0xff);
 fprintf(ofile,"\n");
 break;
 }
 }
if(fmt==Intel) fprintf(ofile,":00000001FF\n");
if(fmt==Binary) for(i=i;i<128;i++) fprintf(ofile,"%c%c",'\0','\0');
}

int main(int argc, char *argv[]) {
  int i;
  fmt=Hex;
  ofile=stdout;
  if(argc<2) {
	printf("Usage: m8asm -fmt {intel,bin,hex} -f infile -o outfile -l listfile\n");
	exit(0);
  }
  for(i=1; i<argc; i++ ) {
    if(!strcmp(argv[i],"-fmt") && argc>i) {
      switch(argv[i+1][0]) {
      case 's': fmt=Seconds; break;
      case 'i': fmt=Intel; break;
      case 'b': fmt=Binary; break;
      default:  fmt=Hex; break;
      }
      i++;
    }
    else if(!strcmp(argv[i],"-f") && argc>i) {
	    if(argv[i+1][0] == '-') yyin=stdin;
	    else yyin = fopen(argv[i+1],"r");
	    if(!yyin) yyerror("cannot find input file.");
	    i++;
	    }
    else if(!strcmp(argv[i],"-o") && argc>i) {
	    if(argv[i+1][0] == '-') ofile=stdout;
	    else ofile = fopen(argv[i+1],"w");
	    if(!ofile) yyerror("cannot open output file.");
	    i++;
    }
    else if(!strcmp(argv[i],"-l") && argc>i) {
	    lst = 1;
	    if(argv[i+1][0] == '-') lfile=stderr;
	    else lfile = fopen(argv[i+1],"w");
	    if(!lfile)  yyerror("cannot open list file.");
	    i++;
    }
    
    else if(!strcmp(argv[i],"-d")) {
	    yydebug = 1;
    }
    
    else  {
	    yyin = fopen(argv[i],"r");
	    if(!yyin) yyerror("cannot find input file.");
    }
  }
  yyparse();
  fprintf(ofile,"\n\n");
  fclose(ofile);
  if(lfile) fclose(lfile);
  fclose(yyin);
  return 0;
}

