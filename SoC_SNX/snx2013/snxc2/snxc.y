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

    12-Mar-2015: modified symbol tables, Suzuki
    15-Sep-2011: array, break, etc. added, SHMZ
    10-Sep-2005: Language specification extended, SHMZ
    04-Aug-2002: modified for PARTHENON lecture
******************************************/

%{
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include "snxc.h"
#define YYDEBUG 1
#ifndef STACKTOP
#define STACKTOP 4095
#endif

/* prototypes */
int yylex();

/* prototypes for static functions */
static Pnode *opr(int oper, int nops, ...);
static Pnode *id(struct node *node);
static Pnode *con(int value);
static void freeNode(Pnode *p);
static Node *gregist(char *s, idtype type, int size);
static Node *lregist(char *s);
static Node *aregist(char *s);
static Node *fregist(char *s);
static Node *iregist(char *s);
static Node *slookup(char *s);
static Pnode *copyStree(Pnode *p);

extern int Line;
extern char *yytext;

static void debug(Pnode *p) {}
%}

%union {
    int IntVal;          /* integer value */
    Node *Index;         /* symbol table index */
    char *Symbol;        /* name of a symbol */
    Pnode *Node;         /* node pointer */
};

%token <IntVal> INTEGER
%token <Symbol> SYMBOL
%token INTER WHILE FOR IF PRINT MRD MWT MEM FDEF RETURN FUNC BREAK
%token DEF FDEFA HALT LOCAL EA NOP
%nonassoc IFX
%nonassoc ELSE

%left LOR
%left LAND
%left GE LE EQ NE '>' '<' '|'
%left '+' '-'
%left '*' '/' '&'
%right UMINUS '~'
%left MM PP RSHIFT LSHIFT
%type <Node> astmt stmt expr stmt_list a_list l_list v_list l_def defun
%type <Index> defundec defisrdec

%%

program:
    program stmt    { debug($2); ex($2,1,0); freeNode($2); }
  | program defun   { debug($2); ex($2,1,0); freeNode($2); flushlocal(); }
  | /* NULL */
  ;

defundec:
    DEF SYMBOL     { $$ = fregist($2); }
  ;

defisrdec:
    INTER SYMBOL   { $$ = iregist($2); }
  ;

defun:
    defundec '(' a_list ')' '{' l_def stmt_list '}'
    { $$ = opr(FDEFA, 4, id($1), $7, $3, $6); }
  | defundec '(' ')' '{' l_def stmt_list '}'
    { $$ = opr(FDEF, 3, id($1), $6, $5); debug($5); }
  | defundec '(' ')' ';'
    { $$ = opr(NOP, 0 ); }
  | defundec '(' a_list ')' ';'
    { $$ = opr(NOP, 0 ); }
  | defisrdec '(' ')' '{' l_def stmt_list '}'
    { $$ = opr(INTER, 3, id($1), $6, $5); debug($5); }
  ;

stmt:
    ';'                      { $$ = opr(';', 2, NULL, NULL); }
  | astmt ';'                { $$ = $1; }
  | DEF SYMBOL '[' INTEGER ']' ';'
    { $$ = opr(';',2,NULL,NULL); gregist($2,global,$4); }
  | PRINT expr ';'           { $$ = opr(PRINT, 1, $2); }
  | FOR '(' astmt ';' expr ';' astmt ')' stmt  
    { $$ = opr(FOR, 4, $3, $5, $7, $9); }
  | WHILE '(' expr ')' stmt  { $$ = opr(WHILE, 2, $3, $5); }
  | RETURN expr ';'          { $$ = opr(RETURN, 1, $2); }
  | RETURN ';'               { $$ = opr(RETURN, 0); }
  | BREAK ';'                { $$ = opr(BREAK, 0); }
  | IF '(' expr ')' stmt %prec IFX    { $$ = opr(IF, 2, $3, $5); }
  | IF '(' expr ')' stmt ELSE stmt    { $$ = opr(IF, 3, $3, $5, $7); }
  | '{' stmt_list '}'        { $$ = $2; }
  | HALT ';'                 { $$ = opr(HALT, 0); }
  ;

l_def:
    /* NULL */ { $$ = NULL; }
  | l_def DEF l_list ';' 
    { Pnode *x = $3;
      while (x->opr.op[1]) x = x->opr.op[1];
      x->opr.op[1] = $1;
      $$ = $3; }
  ;

l_list:
    SYMBOL             { $$ = opr(',', 2, id(lregist($1)), NULL); }
  | l_list ',' SYMBOL  { $$ = opr(',', 2, id(lregist($3)), $1); }
  ;

a_list:
    DEF SYMBOL    { $$ = opr(',', 2, id(aregist($2)), NULL); }
  | SYMBOL        { $$ = opr(',', 2, id(aregist($1)), NULL); }
  | a_list ',' SYMBOL
    { Pnode *x = $1;
      while (x->opr.op[1]) x = x->opr.op[1];
      x->opr.op[1] = opr(',', 2, id(aregist($3)), NULL);
      $$ = $1; }
  | a_list ',' DEF SYMBOL
    { Pnode *x = $1;
      while (x->opr.op[1]) x = x->opr.op[1];
      x->opr.op[1] = opr(',', 2, id(aregist($4)), NULL);
      $$ = $1; }
  ;

astmt:
    expr                        { $$ = $1; }
  | MEM '[' expr ']' '=' expr   { $$ = opr(MWT, 2, $3, $6); }
  | MEM '[' expr ']' PP
    { $$ = opr(MWT, 2, $3, opr('+',2,con(1),opr(MRD,1,copyStree($3)))); }
  | MEM '[' expr ']' MM
    { $$ = opr(MWT, 2, $3, opr('-',2,opr(MRD,1,copyStree($3)),con(1))); }
  | SYMBOL '=' expr             { $$ = opr('=', 2, id(slookup($1)), $3); }
  | '*' expr %prec UMINUS '=' expr  { $$ = opr(MWT, 2, $2, $4); }
  | SYMBOL  PP
    { Node *p = slookup($1);
      $$ = opr('=', 2, id(p), opr('+', 2, id(p), con(1))); }
  | SYMBOL  MM
    { Node *p = slookup($1);
      $$ = opr('=', 2, id(p), opr('-', 2, id(p), con(1))); }
  | SYMBOL '[' expr ']' PP
    { Node *p = slookup($1);
      $$ = opr(MWT, 3, $3, opr('+', 2, opr(MRD, 2, copyStree($3), id(p)), con(1)), id(p));
      if(!p->array) yyerror("not defined as array\n"); }
  | SYMBOL '[' expr ']' MM
    { Node *p = slookup($1);
      $$ = opr(MWT, 3, $3, opr('-', 2, opr(MRD, 2, copyStree($3), id(p)), con(1)), id(p));
      if (!p->array) yyerror("not defined as array\n"); }
  | SYMBOL '[' expr ']' '=' expr
    { Node *p = slookup($1);
      $$ = opr(MWT, 3, $3, $6, id(p)); 
      if (!p->array) yyerror("not defined as array\n"); }
  ;

stmt_list:
    stmt            { $$ = $1; }
  | stmt_list stmt  { $$ = opr(';', 2, $1, $2); }
  ;

v_list:
    expr            { $$ = opr(',', 2, NULL, $1); }
  | v_list ',' expr { $$ = opr(',', 2, $1, $3); }
  ;

expr:
    INTEGER                  { $$ = con($1); }
  | SYMBOL
    { Node *p =slookup($1);
      Pnode *ip = id(p);  
      $$ = (p->type == func) ? opr(EA, 1, ip) : ip; }
  | '-' expr %prec UMINUS    { $$ = opr(UMINUS, 1, $2); }
  | '~' expr %prec UMINUS    { $$ = opr('~', 1, $2); }
  | '&' SYMBOL %prec UMINUS  { $$ = opr(EA, 1, id(slookup($2))); }
  | '*' expr %prec UMINUS    { $$ = opr(MRD, 1, $2); }
  | MEM '[' expr ']'         { $$ = opr(MRD, 1, $3); }
  | SYMBOL '[' expr ']'
    { Node *p = slookup($1);
      $$ = opr(MRD, 2, $3, id(p));
      if (!p->array) yyerror("not defined as array\n"); }
  | SYMBOL '(' v_list ')'    { $$ = opr(FUNC, 2, id(slookup($1)), $3); }
  | SYMBOL '(' ')'           { $$ = opr(FUNC, 1, id(slookup($1))); }
  | expr '&' expr            { $$ = opr('&', 2, $1, $3); }
  | expr '|' expr            { $$ = opr('|', 2, $1, $3); }
  | expr '*' expr            { $$ = opr('*', 2, $1, $3); }
  | expr '+' expr            { $$ = opr('+', 2, $1, $3); }
  | expr '-' expr            { $$ = opr('-', 2, $1, $3); }
  | expr '<' expr            { $$ = opr('<', 2, $1, $3); }
  | expr '>' expr            { $$ = opr('>', 2, $1, $3); }
  | expr LAND expr           { $$ = opr(LAND, 2, $1, $3); }
  | expr LOR expr            { $$ = opr(LOR, 2, $1, $3); }
  | expr GE expr             { $$ = opr(GE, 2, $1, $3); }
  | expr LE expr             { $$ = opr(LE, 2, $1, $3); }
  | expr NE expr             { $$ = opr(NE, 2, $1, $3); }
  | expr EQ expr             { $$ = opr(EQ, 2, $1, $3); }
  | expr RSHIFT expr         { $$ = opr(RSHIFT, 2, $1, $3); }
  | expr LSHIFT expr         { $$ = opr(LSHIFT, 2, $1, $3); }
  | '(' expr ')'             { $$ = $2; }
  ;

%%

Pnode *con(int value) {
  Pnode *p;

  /* allocate node */
  if ((p = malloc(sizeof(Const))) == NULL)
    yyerror("out of memory");

  /* copy information */
  p->type = typeCon;
  p->con.value = value;

  return p;
}

Pnode *id(struct node *node) {
  Pnode *p;

  /* allocate node */
  if ((p = malloc(sizeof(Ident))) == NULL)
    yyerror("out of memory");

  /* copy information */
  p->type = typeId;
  p->id.node = node;
  return p;
}

Pnode *opr(int oper, int nops, ...) {
  va_list ap;
  Pnode *p;
  size_t size;
  int i;

  /* allocate a node */
  size = sizeof(Operator) + (nops - 1) * sizeof(Pnode*);
  if ((p = malloc(size)) == NULL)
    yyerror("out of memory");

  /* copy information */
  p->type = typeOpr;
  p->opr.oper = oper;
  p->opr.nops = nops;
  va_start(ap, nops);
  for (i = 0; i < nops; i++)
    p->opr.op[i] = va_arg(ap, Pnode*);
  va_end(ap);
  return p;
}

static void freeNode(Pnode *p) {
  int i;

  if (!p) return;
  if (p->type == typeOpr) {
    for (i = 0; i < p->opr.nops; i++)
      	freeNode(p->opr.op[i]);
  }
  free (p);
}

static Node *stable = NULL;
static Node *ltable = NULL;
static int idindex = DATAOFFSET;
static int localid = 0;
static int argid = 0;

static Pnode *copyStree(Pnode *p) {
  Pnode *cp;

  if (!p) return NULL;
  if (p->type == typeCon)  {
    cp = con(p->con.value);
  }
  else if (p->type == typeId)  {
    cp = id(p->id.node);
  }
  else if (p->type == typeOpr) {
    int i;
    /* allocate a node */
    int nops = p->opr.nops;
    int size = sizeof(Operator) + (nops - 1) * sizeof(Pnode*);
    if ((cp = malloc(size)) == NULL)
      yyerror("out of memory");
    /* copy information */
    cp->type = typeOpr;
    cp->opr.oper = p->opr.oper;
    cp->opr.nops = nops;
    for (i = 0; i < nops; i++)
      cp->opr.op[i] = copyStree(p->opr.op[i]);
  }
  else  {
    yyerror("internal error: illegal type of syntax tree");
  }
  return cp;
}

void flushlocal()
{
  struct node *p = ltable;

  while (p) {
    ltable = p->node;
    free(p);
    p = ltable;
  }
  localid = argid = 0;
}

static Node *regist(char *s, idtype type, int array, Node *table)
{
  Node *p = (Node *)malloc(sizeof(Node));
  p->sym = s;
  p->node = table;
  p->type = type;
  p->array = array;
  return p;
}
 
static Node *lregist(char *s)
{
  ltable = regist(s,local,0,ltable);
  ltable->id = localid++;
  return ltable;
}

static Node *aregist(char *s)
{
  ltable = regist(s,argument,0,ltable);
  ltable->id = argid++;
  return ltable;
}

static Node *gregist(char *s, idtype type, int size)
{
  int array = type == global ? 1 : 0;

  stable = regist(s,type,array,stable);
  if (type == global)  {
    stable->id = idindex;
    idindex += size;
  }
  return stable;
}

static Node *lookup(char *s, Node *table)
{
  Node *p = table;

  while (p) {
    if (!strcmp(s,p->sym)) return(p);
    p = p->node; 
  }
  return NULL;
}

static Node *fregist(char *s)
{
  Node *p;

  /* look for the function from the global symbol table
     NOTE: It doesn't check if the symbol found is a function.
           If it's not a function, it causes a serious problem. */
  if ((p=lookup(s,stable)) != NULL) return p;  

  /* register the function to the global symbol table if it's new */
  return gregist(s,func,0);
}

static Node *iregist(char *s)
{
  return gregist(s,isr,0);
}

static Node *slookup(char *s)
{
  Node *p;
  /* look for the symbol from the local symbol table */
  if ((p=lookup(s,ltable)) != NULL) return p;
  /* look for the symbol from the global symbol table */
  if ((p=lookup(s,stable)) != NULL) return p;
  /* register the symbol to the global symbol table if it's new */
  return gregist(s,global,1);
}

/* initialize symbol table for global symbols */
static void initSymtable()
{
  char name[2];

  name[1] = '\0';
  for (name[0] = 'a'; name[0] <= 'z'; name[0]++) {
    gregist(nregist(name),global,1);
  }
}

void yyerror(char *s) {
    fprintf(stdout, "%s(%s) at %d\n", s, yytext, Line);
    exit(1);
}

extern int yydebug;
extern FILE *yyin;
int main(int argc, char *argv[]) {
    int i=1;
    if(argc>i && !strcmp(argv[1],"-d")) {
	 yydebug=1;
	 i++;
    }
    if(argc>i) yyin=fopen(argv[i],"r");

    initSymtable();
    sinit(STACKTOP);
    yyparse();
    return 0;
}
