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
#define LABELMAX 1000

typedef enum { typeCon, typeId, typeOpr } nodeEnum;

/* constants */
typedef struct {
    nodeEnum type;              /* type of node */
    int value;                  /* value of constant */
} conNodeType;

/* identifiers */
typedef struct {
    nodeEnum type;              /* type of node */
    int  index;                   /* subscript to ident array */
} idNodeType;

/* operators */
typedef struct {
    nodeEnum type;              /* type of node */
    int oper;                   /* operator */
    int nops;                   /* number of operands */
    union nodeTypeTag *op[1];   /* operands (expandable) */
} oprNodeType;

typedef union nodeTypeTag {
    nodeEnum type;              /* type of node */
    conNodeType con;            /* constants */
    idNodeType id;              /* identifiers */
    oprNodeType opr;            /* operators */
} nodeType;

extern int sym[65536];
/* prototypes */
nodeType *opr(int oper, int nops, ...);
nodeType *con(int value);
void freeNode(nodeType *p);
void sinit();
void dump();
int ex(nodeType *p, int reg, int pres);
char * id2sym(int id);
char * op2nm(int op);
extern FILE *yyin;
