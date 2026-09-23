/* A Bison parser, made by GNU Bison 3.7.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    INTEGER = 258,                 /* INTEGER  */
    SYMBOL = 259,                  /* SYMBOL  */
    INTER = 260,                   /* INTER  */
    WHILE = 261,                   /* WHILE  */
    FOR = 262,                     /* FOR  */
    IF = 263,                      /* IF  */
    PRINT = 264,                   /* PRINT  */
    MRD = 265,                     /* MRD  */
    MWT = 266,                     /* MWT  */
    MEM = 267,                     /* MEM  */
    FDEF = 268,                    /* FDEF  */
    RETURN = 269,                  /* RETURN  */
    FUNC = 270,                    /* FUNC  */
    BREAK = 271,                   /* BREAK  */
    DEF = 272,                     /* DEF  */
    FDEFA = 273,                   /* FDEFA  */
    HALT = 274,                    /* HALT  */
    LOCAL = 275,                   /* LOCAL  */
    EA = 276,                      /* EA  */
    NOP = 277,                     /* NOP  */
    IFX = 278,                     /* IFX  */
    ELSE = 279,                    /* ELSE  */
    LOR = 280,                     /* LOR  */
    LAND = 281,                    /* LAND  */
    GE = 282,                      /* GE  */
    LE = 283,                      /* LE  */
    EQ = 284,                      /* EQ  */
    NE = 285,                      /* NE  */
    UMINUS = 286,                  /* UMINUS  */
    MM = 287,                      /* MM  */
    PP = 288,                      /* PP  */
    RSHIFT = 289,                  /* RSHIFT  */
    LSHIFT = 290                   /* LSHIFT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define INTEGER 258
#define SYMBOL 259
#define INTER 260
#define WHILE 261
#define FOR 262
#define IF 263
#define PRINT 264
#define MRD 265
#define MWT 266
#define MEM 267
#define FDEF 268
#define RETURN 269
#define FUNC 270
#define BREAK 271
#define DEF 272
#define FDEFA 273
#define HALT 274
#define LOCAL 275
#define EA 276
#define NOP 277
#define IFX 278
#define ELSE 279
#define LOR 280
#define LAND 281
#define GE 282
#define LE 283
#define EQ 284
#define NE 285
#define UMINUS 286
#define MM 287
#define PP 288
#define RSHIFT 289
#define LSHIFT 290

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 57 "snxc.y"

    int IntVal;          /* integer value */
    Node *Index;         /* symbol table index */
    char *Symbol;        /* name of a symbol */
    Pnode *Node;         /* node pointer */

#line 144 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
