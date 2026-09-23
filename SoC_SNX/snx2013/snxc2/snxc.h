/******************************************

  Simple 16bit Non-Pipeline Processor (SN/X) V1.2
  Compiler source code.

  (C)Copyright by Naohiko Shimizu, 2001-2005
  All rights are reserved.

  Contact information:
  Dr. Naohiko Shimizu

    IP Architecture Laboratory
    Email: nshimizu@ip-arch.jp
    URL: http://www.ip-arch.jp/
  
  Update informations:

    10-Sep-2005: Language specification extended, SHMZ
    04-Aug-2002: modified for PARTHENON lecture
******************************************/

#define DATAOFFSET 0x1000
// #define DATAOFFSET 0x0000

typedef enum { typeCon, typeId, typeOpr } nodeType;
typedef enum { local, argument, global, func, isr } idtype;

typedef struct node {
    char *sym;
    int  id;
    int  array;
    idtype  type;
    struct node *node;
} Node;

/* constants */
typedef struct {
    nodeType type;              /* type of node */
    int value;                  /* value of constant */
} Const;

/* identifiers */
typedef struct {
    nodeType type;              /* type of node */
    struct node *node;          /* subscript to ident array */
} Ident;

/* operators */
typedef struct {
    nodeType type;              /* type of node */
    int oper;                   /* operator */
    int nops;                   /* number of operands */
    union PnodeTag *op[1];   /* operands (expandable) */
} Operator;

typedef union PnodeTag {
    nodeType type;              /* type of node */
    Const con;            /* constants */
    Ident id;              /* identifiers */
    Operator opr;            /* operators */
} Pnode;

/* prototypes */

/* defined in snxb1.c */
void sinit(int val);
int ex(Pnode *p, int reg, int pres);

/* defined in snxc.y */
void flushlocal();
void yyerror(char *s);

/* defined in snxc.l */
char *nregist(char *s);
