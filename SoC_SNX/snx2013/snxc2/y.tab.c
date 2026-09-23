/* A Bison parser, made by GNU Bison 3.7.4.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30704

/* Bison version string.  */
#define YYBISON_VERSION "3.7.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 24 "snxc.y"

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

#line 104 "y.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
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

#line 234 "y.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_INTEGER = 3,                    /* INTEGER  */
  YYSYMBOL_SYMBOL = 4,                     /* SYMBOL  */
  YYSYMBOL_INTER = 5,                      /* INTER  */
  YYSYMBOL_WHILE = 6,                      /* WHILE  */
  YYSYMBOL_FOR = 7,                        /* FOR  */
  YYSYMBOL_IF = 8,                         /* IF  */
  YYSYMBOL_PRINT = 9,                      /* PRINT  */
  YYSYMBOL_MRD = 10,                       /* MRD  */
  YYSYMBOL_MWT = 11,                       /* MWT  */
  YYSYMBOL_MEM = 12,                       /* MEM  */
  YYSYMBOL_FDEF = 13,                      /* FDEF  */
  YYSYMBOL_RETURN = 14,                    /* RETURN  */
  YYSYMBOL_FUNC = 15,                      /* FUNC  */
  YYSYMBOL_BREAK = 16,                     /* BREAK  */
  YYSYMBOL_DEF = 17,                       /* DEF  */
  YYSYMBOL_FDEFA = 18,                     /* FDEFA  */
  YYSYMBOL_HALT = 19,                      /* HALT  */
  YYSYMBOL_LOCAL = 20,                     /* LOCAL  */
  YYSYMBOL_EA = 21,                        /* EA  */
  YYSYMBOL_NOP = 22,                       /* NOP  */
  YYSYMBOL_IFX = 23,                       /* IFX  */
  YYSYMBOL_ELSE = 24,                      /* ELSE  */
  YYSYMBOL_LOR = 25,                       /* LOR  */
  YYSYMBOL_LAND = 26,                      /* LAND  */
  YYSYMBOL_GE = 27,                        /* GE  */
  YYSYMBOL_LE = 28,                        /* LE  */
  YYSYMBOL_EQ = 29,                        /* EQ  */
  YYSYMBOL_NE = 30,                        /* NE  */
  YYSYMBOL_31_ = 31,                       /* '>'  */
  YYSYMBOL_32_ = 32,                       /* '<'  */
  YYSYMBOL_33_ = 33,                       /* '|'  */
  YYSYMBOL_34_ = 34,                       /* '+'  */
  YYSYMBOL_35_ = 35,                       /* '-'  */
  YYSYMBOL_36_ = 36,                       /* '*'  */
  YYSYMBOL_37_ = 37,                       /* '/'  */
  YYSYMBOL_38_ = 38,                       /* '&'  */
  YYSYMBOL_UMINUS = 39,                    /* UMINUS  */
  YYSYMBOL_40_ = 40,                       /* '~'  */
  YYSYMBOL_MM = 41,                        /* MM  */
  YYSYMBOL_PP = 42,                        /* PP  */
  YYSYMBOL_RSHIFT = 43,                    /* RSHIFT  */
  YYSYMBOL_LSHIFT = 44,                    /* LSHIFT  */
  YYSYMBOL_45_ = 45,                       /* '('  */
  YYSYMBOL_46_ = 46,                       /* ')'  */
  YYSYMBOL_47_ = 47,                       /* '{'  */
  YYSYMBOL_48_ = 48,                       /* '}'  */
  YYSYMBOL_49_ = 49,                       /* ';'  */
  YYSYMBOL_50_ = 50,                       /* '['  */
  YYSYMBOL_51_ = 51,                       /* ']'  */
  YYSYMBOL_52_ = 52,                       /* ','  */
  YYSYMBOL_53_ = 53,                       /* '='  */
  YYSYMBOL_YYACCEPT = 54,                  /* $accept  */
  YYSYMBOL_program = 55,                   /* program  */
  YYSYMBOL_defundec = 56,                  /* defundec  */
  YYSYMBOL_defisrdec = 57,                 /* defisrdec  */
  YYSYMBOL_defun = 58,                     /* defun  */
  YYSYMBOL_stmt = 59,                      /* stmt  */
  YYSYMBOL_l_def = 60,                     /* l_def  */
  YYSYMBOL_l_list = 61,                    /* l_list  */
  YYSYMBOL_a_list = 62,                    /* a_list  */
  YYSYMBOL_astmt = 63,                     /* astmt  */
  YYSYMBOL_stmt_list = 64,                 /* stmt_list  */
  YYSYMBOL_v_list = 65,                    /* v_list  */
  YYSYMBOL_expr = 66                       /* expr  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                            \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  2
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   679

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  54
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  13
/* YYNRULES -- Number of rules.  */
#define YYNRULES  73
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  172

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   290


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    38,     2,
      45,    46,    36,    34,    52,    35,     2,    37,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    49,
      32,    53,    31,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    50,     2,    51,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    47,    33,    48,    40,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    39,    41,    42,    43,
      44
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    84,    84,    85,    86,    90,    94,    98,   100,   102,
     104,   106,   111,   112,   113,   115,   116,   118,   119,   120,
     121,   122,   123,   124,   125,   129,   130,   138,   139,   143,
     144,   145,   150,   158,   159,   160,   162,   164,   165,   166,
     169,   172,   176,   180,   187,   188,   192,   193,   197,   198,
     202,   203,   204,   205,   206,   207,   211,   212,   213,   214,
     215,   216,   217,   218,   219,   220,   221,   222,   223,   224,
     225,   226,   227,   228
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "INTEGER", "SYMBOL",
  "INTER", "WHILE", "FOR", "IF", "PRINT", "MRD", "MWT", "MEM", "FDEF",
  "RETURN", "FUNC", "BREAK", "DEF", "FDEFA", "HALT", "LOCAL", "EA", "NOP",
  "IFX", "ELSE", "LOR", "LAND", "GE", "LE", "EQ", "NE", "'>'", "'<'",
  "'|'", "'+'", "'-'", "'*'", "'/'", "'&'", "UMINUS", "'~'", "MM", "PP",
  "RSHIFT", "LSHIFT", "'('", "')'", "'{'", "'}'", "';'", "'['", "']'",
  "','", "'='", "$accept", "program", "defundec", "defisrdec", "defun",
  "stmt", "l_def", "l_list", "a_list", "astmt", "stmt_list", "v_list",
  "expr", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_int16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,    62,    60,   124,    43,    45,    42,    47,    38,   286,
     126,   287,   288,   289,   290,    40,    41,   123,   125,    59,
      91,    93,    44,    61
};
#endif

#define YYPACT_NINF (-128)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
    -128,    83,  -128,  -128,   111,    12,   -14,    34,    35,   301,
      32,    36,    59,    97,    62,   301,   301,   105,   301,   301,
     254,  -128,    67,    69,  -128,  -128,    71,   587,  -128,  -128,
       6,   301,   301,  -128,   301,   317,   301,   -21,    72,   301,
     446,   301,  -128,   471,  -128,    74,  -128,    63,   -40,  -128,
      63,   521,   121,  -128,   132,     4,    80,  -128,   301,   301,
     301,   301,   301,   301,   301,   301,   301,   301,   301,   301,
     301,   301,   301,  -128,    -3,   587,   338,   587,   543,    78,
     565,   301,   301,    63,  -128,   365,  -128,   128,   301,  -128,
      74,  -128,  -128,  -128,   129,   -11,    23,    87,   606,   624,
     635,   635,   635,   635,   635,   635,   635,    60,    60,    63,
      63,  -128,  -128,  -128,   301,   -19,   254,   301,   254,   392,
     419,    52,    91,   587,  -128,  -128,  -128,    -2,     2,  -128,
     587,  -128,  -128,   301,  -128,   496,   119,  -128,  -128,  -128,
    -128,   301,    96,   279,  -128,  -128,  -128,   143,   279,   587,
     317,   254,   587,  -128,   151,   179,   279,  -128,   204,   112,
    -128,    74,    21,  -128,   229,  -128,   254,  -128,   155,  -128,
    -128,  -128
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       4,     0,     1,    48,    49,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    12,     0,     0,     3,     2,     0,    33,    40,    39,
       0,     0,     0,     6,     0,     0,     0,    49,     0,     0,
       0,     0,    19,     0,    20,     5,    24,    50,    53,    52,
      51,     0,     0,    44,     0,     0,     0,    13,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    57,     0,    46,     0,    37,     0,     0,
       0,     0,     0,    53,    15,     0,    18,     0,     0,    73,
       0,    23,    45,    30,     0,     0,     0,     0,    66,    65,
      67,    68,    70,    69,    64,    63,    59,    61,    62,    60,
      58,    71,    72,    56,     0,    55,     0,     0,     0,     0,
       0,    54,     0,    38,    29,    25,     9,     0,     0,    25,
      47,    42,    41,     0,    17,     0,    21,    55,    54,    36,
      35,     0,     0,     0,    25,    10,    31,     0,     0,    43,
       0,     0,    34,    14,     0,     0,     0,    32,     0,     0,
      22,    27,     0,     8,     0,    11,     0,    26,     0,     7,
      16,    28
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -128,  -128,  -128,  -128,  -128,    -1,  -127,  -128,  -128,   -34,
    -123,  -128,    -4
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,    22,    23,    24,    53,   143,   162,    96,    26,
      54,    74,    27
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      25,    79,   148,    71,    72,    40,   146,    43,    93,     3,
      37,    47,    48,    88,    50,    51,    33,   156,    38,   147,
     155,    94,   131,   132,    30,   158,    75,    76,    77,    81,
      78,    34,    80,   164,   133,    83,   125,    85,   126,     3,
      37,    15,    39,   113,    17,   144,    18,   145,    38,   114,
      95,    19,    73,    92,    98,    99,   100,   101,   102,   103,
     104,   105,   106,   107,   108,   109,   110,   111,   112,   127,
     167,    15,    39,   168,    17,   128,    18,   119,   120,    35,
      36,    19,    41,     2,   123,    42,     3,     4,     5,     6,
       7,     8,     9,   139,   140,    10,    69,    11,    70,    12,
      13,    45,    14,    71,    72,   141,    71,    72,    44,    49,
     130,    46,    55,   135,    56,   134,   159,   136,    15,    16,
      57,    17,    82,    18,    87,    90,    97,   117,    19,   149,
      20,   122,    21,   124,   129,     3,     4,   152,     6,     7,
       8,     9,   142,   151,    10,   153,    11,   157,    12,    52,
     160,    14,    28,    29,    92,   161,    30,    92,   166,   171,
       0,    31,     0,    92,    32,   170,     0,    15,    16,     0,
      17,     0,    18,     0,     0,     0,     0,    19,     0,    20,
      91,    21,     3,     4,     0,     6,     7,     8,     9,     0,
       0,    10,     0,    11,     0,    12,    52,     0,    14,     0,
       0,     0,     0,     0,     0,     0,     0,     3,     4,     0,
       6,     7,     8,     9,    15,    16,    10,    17,    11,    18,
      12,    52,     0,    14,    19,     0,    20,   163,    21,     0,
       0,     0,     3,     4,     0,     6,     7,     8,     9,    15,
      16,    10,    17,    11,    18,    12,    52,     0,    14,    19,
       0,    20,   165,    21,     0,     0,     0,     3,     4,     0,
       6,     7,     8,     9,    15,    16,    10,    17,    11,    18,
      12,    52,     0,    14,    19,     0,    20,   169,    21,     0,
       0,     0,     3,     4,     0,     6,     7,     8,     9,    15,
      16,    10,    17,    11,    18,    12,   154,     0,    14,    19,
       0,    20,     0,    21,     3,    37,     0,     0,     0,     0,
       0,     0,     0,    38,    15,    16,     0,    17,     0,    18,
       3,     4,     0,     0,    19,     0,    20,     0,    21,    10,
       0,     0,     0,     0,     0,     0,    15,    39,     0,    17,
       0,    18,     0,     0,     0,     0,    19,     0,     0,     0,
       0,     0,    15,    16,     0,    17,     0,    18,     0,     0,
       0,     0,    19,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,     0,    70,     0,     0,     0,
       0,    71,    72,     0,     0,     0,     0,     0,     0,   115,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,     0,    70,     0,     0,     0,     0,    71,    72,
       0,     0,     0,     0,     0,     0,   121,    58,    59,    60,
      61,    62,    63,    64,    65,    66,    67,    68,    69,     0,
      70,     0,     0,     0,     0,    71,    72,     0,     0,     0,
       0,     0,     0,   137,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,     0,    70,     0,     0,
       0,     0,    71,    72,     0,     0,     0,     0,     0,     0,
     138,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,     0,    70,     0,     0,     0,     0,    71,
      72,     0,     0,     0,     0,    84,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,     0,    70,
       0,     0,     0,     0,    71,    72,     0,     0,     0,     0,
      86,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,     0,    70,     0,     0,     0,     0,    71,
      72,     0,     0,     0,     0,   150,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,     0,    70,
       0,     0,     0,     0,    71,    72,     0,    89,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
       0,    70,     0,     0,     0,     0,    71,    72,     0,   116,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,     0,    70,     0,     0,     0,     0,    71,    72,
       0,   118,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,     0,    70,     0,     0,     0,     0,
      71,    72,    59,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    69,     0,    70,     0,     0,     0,     0,    71,
      72,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,     0,    70,     0,     0,     0,     0,    71,    72,    67,
      68,    69,     0,    70,     0,     0,     0,     0,    71,    72
};

static const yytype_int16 yycheck[] =
{
       1,    35,   129,    43,    44,     9,     4,    11,     4,     3,
       4,    15,    16,    53,    18,    19,     4,   144,    12,    17,
     143,    17,    41,    42,    45,   148,    30,    31,    32,    50,
      34,    45,    36,   156,    53,    39,    47,    41,    49,     3,
       4,    35,    36,    46,    38,    47,    40,    49,    12,    52,
      46,    45,    46,    54,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,    72,    46,
      49,    35,    36,    52,    38,    52,    40,    81,    82,    45,
      45,    45,    50,     0,    88,    49,     3,     4,     5,     6,
       7,     8,     9,    41,    42,    12,    36,    14,    38,    16,
      17,     4,    19,    43,    44,    53,    43,    44,    49,     4,
     114,    49,    45,   117,    45,   116,   150,   118,    35,    36,
      49,    38,    50,    40,    50,     4,    46,    49,    45,   133,
      47,     3,    49,     4,    47,     3,     4,   141,     6,     7,
       8,     9,    51,    24,    12,    49,    14,     4,    16,    17,
     151,    19,    41,    42,   155,     4,    45,   158,    46,     4,
      -1,    50,    -1,   164,    53,   166,    -1,    35,    36,    -1,
      38,    -1,    40,    -1,    -1,    -1,    -1,    45,    -1,    47,
      48,    49,     3,     4,    -1,     6,     7,     8,     9,    -1,
      -1,    12,    -1,    14,    -1,    16,    17,    -1,    19,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,     4,    -1,
       6,     7,     8,     9,    35,    36,    12,    38,    14,    40,
      16,    17,    -1,    19,    45,    -1,    47,    48,    49,    -1,
      -1,    -1,     3,     4,    -1,     6,     7,     8,     9,    35,
      36,    12,    38,    14,    40,    16,    17,    -1,    19,    45,
      -1,    47,    48,    49,    -1,    -1,    -1,     3,     4,    -1,
       6,     7,     8,     9,    35,    36,    12,    38,    14,    40,
      16,    17,    -1,    19,    45,    -1,    47,    48,    49,    -1,
      -1,    -1,     3,     4,    -1,     6,     7,     8,     9,    35,
      36,    12,    38,    14,    40,    16,    17,    -1,    19,    45,
      -1,    47,    -1,    49,     3,     4,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    12,    35,    36,    -1,    38,    -1,    40,
       3,     4,    -1,    -1,    45,    -1,    47,    -1,    49,    12,
      -1,    -1,    -1,    -1,    -1,    -1,    35,    36,    -1,    38,
      -1,    40,    -1,    -1,    -1,    -1,    45,    -1,    -1,    -1,
      -1,    -1,    35,    36,    -1,    38,    -1,    40,    -1,    -1,
      -1,    -1,    45,    25,    26,    27,    28,    29,    30,    31,
      32,    33,    34,    35,    36,    -1,    38,    -1,    -1,    -1,
      -1,    43,    44,    -1,    -1,    -1,    -1,    -1,    -1,    51,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    -1,    38,    -1,    -1,    -1,    -1,    43,    44,
      -1,    -1,    -1,    -1,    -1,    -1,    51,    25,    26,    27,
      28,    29,    30,    31,    32,    33,    34,    35,    36,    -1,
      38,    -1,    -1,    -1,    -1,    43,    44,    -1,    -1,    -1,
      -1,    -1,    -1,    51,    25,    26,    27,    28,    29,    30,
      31,    32,    33,    34,    35,    36,    -1,    38,    -1,    -1,
      -1,    -1,    43,    44,    -1,    -1,    -1,    -1,    -1,    -1,
      51,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    -1,    38,    -1,    -1,    -1,    -1,    43,
      44,    -1,    -1,    -1,    -1,    49,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    -1,    38,
      -1,    -1,    -1,    -1,    43,    44,    -1,    -1,    -1,    -1,
      49,    25,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    -1,    38,    -1,    -1,    -1,    -1,    43,
      44,    -1,    -1,    -1,    -1,    49,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,    35,    36,    -1,    38,
      -1,    -1,    -1,    -1,    43,    44,    -1,    46,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      -1,    38,    -1,    -1,    -1,    -1,    43,    44,    -1,    46,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    -1,    38,    -1,    -1,    -1,    -1,    43,    44,
      -1,    46,    25,    26,    27,    28,    29,    30,    31,    32,
      33,    34,    35,    36,    -1,    38,    -1,    -1,    -1,    -1,
      43,    44,    26,    27,    28,    29,    30,    31,    32,    33,
      34,    35,    36,    -1,    38,    -1,    -1,    -1,    -1,    43,
      44,    27,    28,    29,    30,    31,    32,    33,    34,    35,
      36,    -1,    38,    -1,    -1,    -1,    -1,    43,    44,    34,
      35,    36,    -1,    38,    -1,    -1,    -1,    -1,    43,    44
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    55,     0,     3,     4,     5,     6,     7,     8,     9,
      12,    14,    16,    17,    19,    35,    36,    38,    40,    45,
      47,    49,    56,    57,    58,    59,    63,    66,    41,    42,
      45,    50,    53,     4,    45,    45,    45,     4,    12,    36,
      66,    50,    49,    66,    49,     4,    49,    66,    66,     4,
      66,    66,    17,    59,    64,    45,    45,    49,    25,    26,
      27,    28,    29,    30,    31,    32,    33,    34,    35,    36,
      38,    43,    44,    46,    65,    66,    66,    66,    66,    63,
      66,    50,    50,    66,    49,    66,    49,    50,    53,    46,
       4,    48,    59,     4,    17,    46,    62,    46,    66,    66,
      66,    66,    66,    66,    66,    66,    66,    66,    66,    66,
      66,    66,    66,    46,    52,    51,    46,    49,    46,    66,
      66,    51,     3,    66,     4,    47,    49,    46,    52,    47,
      66,    41,    42,    53,    59,    66,    59,    51,    51,    41,
      42,    53,    51,    60,    47,    49,     4,    17,    60,    66,
      49,    24,    66,    49,    17,    64,    60,     4,    64,    63,
      59,     4,    61,    48,    64,    48,    46,    49,    52,    48,
      59,     4
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    54,    55,    55,    55,    56,    57,    58,    58,    58,
      58,    58,    59,    59,    59,    59,    59,    59,    59,    59,
      59,    59,    59,    59,    59,    60,    60,    61,    61,    62,
      62,    62,    62,    63,    63,    63,    63,    63,    63,    63,
      63,    63,    63,    63,    64,    64,    65,    65,    66,    66,
      66,    66,    66,    66,    66,    66,    66,    66,    66,    66,
      66,    66,    66,    66,    66,    66,    66,    66,    66,    66,
      66,    66,    66,    66
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     2,     2,     0,     2,     2,     8,     7,     4,
       5,     7,     1,     2,     6,     3,     9,     5,     3,     2,
       2,     5,     7,     3,     2,     0,     4,     1,     3,     2,
       1,     3,     4,     1,     6,     5,     5,     3,     4,     2,
       2,     5,     5,     6,     1,     2,     1,     3,     1,     1,
       2,     2,     2,     2,     4,     4,     4,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
# ifndef YY_LOCATION_PRINT
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif


# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YYUSE (yyoutput);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yykind < YYNTOKENS)
    YYPRINT (yyo, yytoknum[yykind], *yyvaluep);
# endif
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    goto yyexhaustedlab;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* program: program stmt  */
#line 84 "snxc.y"
                    { debug((yyvsp[0].Node)); ex((yyvsp[0].Node),1,0); freeNode((yyvsp[0].Node)); }
#line 1482 "y.tab.c"
    break;

  case 3: /* program: program defun  */
#line 85 "snxc.y"
                    { debug((yyvsp[0].Node)); ex((yyvsp[0].Node),1,0); freeNode((yyvsp[0].Node)); flushlocal(); }
#line 1488 "y.tab.c"
    break;

  case 5: /* defundec: DEF SYMBOL  */
#line 90 "snxc.y"
                   { (yyval.Index) = fregist((yyvsp[0].Symbol)); }
#line 1494 "y.tab.c"
    break;

  case 6: /* defisrdec: INTER SYMBOL  */
#line 94 "snxc.y"
                   { (yyval.Index) = iregist((yyvsp[0].Symbol)); }
#line 1500 "y.tab.c"
    break;

  case 7: /* defun: defundec '(' a_list ')' '{' l_def stmt_list '}'  */
#line 99 "snxc.y"
    { (yyval.Node) = opr(FDEFA, 4, id((yyvsp[-7].Index)), (yyvsp[-1].Node), (yyvsp[-5].Node), (yyvsp[-2].Node)); }
#line 1506 "y.tab.c"
    break;

  case 8: /* defun: defundec '(' ')' '{' l_def stmt_list '}'  */
#line 101 "snxc.y"
    { (yyval.Node) = opr(FDEF, 3, id((yyvsp[-6].Index)), (yyvsp[-1].Node), (yyvsp[-2].Node)); debug((yyvsp[-2].Node)); }
#line 1512 "y.tab.c"
    break;

  case 9: /* defun: defundec '(' ')' ';'  */
#line 103 "snxc.y"
    { (yyval.Node) = opr(NOP, 0 ); }
#line 1518 "y.tab.c"
    break;

  case 10: /* defun: defundec '(' a_list ')' ';'  */
#line 105 "snxc.y"
    { (yyval.Node) = opr(NOP, 0 ); }
#line 1524 "y.tab.c"
    break;

  case 11: /* defun: defisrdec '(' ')' '{' l_def stmt_list '}'  */
#line 107 "snxc.y"
    { (yyval.Node) = opr(INTER, 3, id((yyvsp[-6].Index)), (yyvsp[-1].Node), (yyvsp[-2].Node)); debug((yyvsp[-2].Node)); }
#line 1530 "y.tab.c"
    break;

  case 12: /* stmt: ';'  */
#line 111 "snxc.y"
                             { (yyval.Node) = opr(';', 2, NULL, NULL); }
#line 1536 "y.tab.c"
    break;

  case 13: /* stmt: astmt ';'  */
#line 112 "snxc.y"
                             { (yyval.Node) = (yyvsp[-1].Node); }
#line 1542 "y.tab.c"
    break;

  case 14: /* stmt: DEF SYMBOL '[' INTEGER ']' ';'  */
#line 114 "snxc.y"
    { (yyval.Node) = opr(';',2,NULL,NULL); gregist((yyvsp[-4].Symbol),global,(yyvsp[-2].IntVal)); }
#line 1548 "y.tab.c"
    break;

  case 15: /* stmt: PRINT expr ';'  */
#line 115 "snxc.y"
                             { (yyval.Node) = opr(PRINT, 1, (yyvsp[-1].Node)); }
#line 1554 "y.tab.c"
    break;

  case 16: /* stmt: FOR '(' astmt ';' expr ';' astmt ')' stmt  */
#line 117 "snxc.y"
    { (yyval.Node) = opr(FOR, 4, (yyvsp[-6].Node), (yyvsp[-4].Node), (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1560 "y.tab.c"
    break;

  case 17: /* stmt: WHILE '(' expr ')' stmt  */
#line 118 "snxc.y"
                             { (yyval.Node) = opr(WHILE, 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1566 "y.tab.c"
    break;

  case 18: /* stmt: RETURN expr ';'  */
#line 119 "snxc.y"
                             { (yyval.Node) = opr(RETURN, 1, (yyvsp[-1].Node)); }
#line 1572 "y.tab.c"
    break;

  case 19: /* stmt: RETURN ';'  */
#line 120 "snxc.y"
                             { (yyval.Node) = opr(RETURN, 0); }
#line 1578 "y.tab.c"
    break;

  case 20: /* stmt: BREAK ';'  */
#line 121 "snxc.y"
                             { (yyval.Node) = opr(BREAK, 0); }
#line 1584 "y.tab.c"
    break;

  case 21: /* stmt: IF '(' expr ')' stmt  */
#line 122 "snxc.y"
                                      { (yyval.Node) = opr(IF, 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1590 "y.tab.c"
    break;

  case 22: /* stmt: IF '(' expr ')' stmt ELSE stmt  */
#line 123 "snxc.y"
                                      { (yyval.Node) = opr(IF, 3, (yyvsp[-4].Node), (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1596 "y.tab.c"
    break;

  case 23: /* stmt: '{' stmt_list '}'  */
#line 124 "snxc.y"
                             { (yyval.Node) = (yyvsp[-1].Node); }
#line 1602 "y.tab.c"
    break;

  case 24: /* stmt: HALT ';'  */
#line 125 "snxc.y"
                             { (yyval.Node) = opr(HALT, 0); }
#line 1608 "y.tab.c"
    break;

  case 25: /* l_def: %empty  */
#line 129 "snxc.y"
               { (yyval.Node) = NULL; }
#line 1614 "y.tab.c"
    break;

  case 26: /* l_def: l_def DEF l_list ';'  */
#line 131 "snxc.y"
    { Pnode *x = (yyvsp[-1].Node);
      while (x->opr.op[1]) x = x->opr.op[1];
      x->opr.op[1] = (yyvsp[-3].Node);
      (yyval.Node) = (yyvsp[-1].Node); }
#line 1623 "y.tab.c"
    break;

  case 27: /* l_list: SYMBOL  */
#line 138 "snxc.y"
                       { (yyval.Node) = opr(',', 2, id(lregist((yyvsp[0].Symbol))), NULL); }
#line 1629 "y.tab.c"
    break;

  case 28: /* l_list: l_list ',' SYMBOL  */
#line 139 "snxc.y"
                       { (yyval.Node) = opr(',', 2, id(lregist((yyvsp[0].Symbol))), (yyvsp[-2].Node)); }
#line 1635 "y.tab.c"
    break;

  case 29: /* a_list: DEF SYMBOL  */
#line 143 "snxc.y"
                  { (yyval.Node) = opr(',', 2, id(aregist((yyvsp[0].Symbol))), NULL); }
#line 1641 "y.tab.c"
    break;

  case 30: /* a_list: SYMBOL  */
#line 144 "snxc.y"
                  { (yyval.Node) = opr(',', 2, id(aregist((yyvsp[0].Symbol))), NULL); }
#line 1647 "y.tab.c"
    break;

  case 31: /* a_list: a_list ',' SYMBOL  */
#line 146 "snxc.y"
    { Pnode *x = (yyvsp[-2].Node);
      while (x->opr.op[1]) x = x->opr.op[1];
      x->opr.op[1] = opr(',', 2, id(aregist((yyvsp[0].Symbol))), NULL);
      (yyval.Node) = (yyvsp[-2].Node); }
#line 1656 "y.tab.c"
    break;

  case 32: /* a_list: a_list ',' DEF SYMBOL  */
#line 151 "snxc.y"
    { Pnode *x = (yyvsp[-3].Node);
      while (x->opr.op[1]) x = x->opr.op[1];
      x->opr.op[1] = opr(',', 2, id(aregist((yyvsp[0].Symbol))), NULL);
      (yyval.Node) = (yyvsp[-3].Node); }
#line 1665 "y.tab.c"
    break;

  case 33: /* astmt: expr  */
#line 158 "snxc.y"
                                { (yyval.Node) = (yyvsp[0].Node); }
#line 1671 "y.tab.c"
    break;

  case 34: /* astmt: MEM '[' expr ']' '=' expr  */
#line 159 "snxc.y"
                                { (yyval.Node) = opr(MWT, 2, (yyvsp[-3].Node), (yyvsp[0].Node)); }
#line 1677 "y.tab.c"
    break;

  case 35: /* astmt: MEM '[' expr ']' PP  */
#line 161 "snxc.y"
    { (yyval.Node) = opr(MWT, 2, (yyvsp[-2].Node), opr('+',2,con(1),opr(MRD,1,copyStree((yyvsp[-2].Node))))); }
#line 1683 "y.tab.c"
    break;

  case 36: /* astmt: MEM '[' expr ']' MM  */
#line 163 "snxc.y"
    { (yyval.Node) = opr(MWT, 2, (yyvsp[-2].Node), opr('-',2,opr(MRD,1,copyStree((yyvsp[-2].Node))),con(1))); }
#line 1689 "y.tab.c"
    break;

  case 37: /* astmt: SYMBOL '=' expr  */
#line 164 "snxc.y"
                                { (yyval.Node) = opr('=', 2, id(slookup((yyvsp[-2].Symbol))), (yyvsp[0].Node)); }
#line 1695 "y.tab.c"
    break;

  case 38: /* astmt: '*' expr '=' expr  */
#line 165 "snxc.y"
                                    { (yyval.Node) = opr(MWT, 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1701 "y.tab.c"
    break;

  case 39: /* astmt: SYMBOL PP  */
#line 167 "snxc.y"
    { Node *p = slookup((yyvsp[-1].Symbol));
      (yyval.Node) = opr('=', 2, id(p), opr('+', 2, id(p), con(1))); }
#line 1708 "y.tab.c"
    break;

  case 40: /* astmt: SYMBOL MM  */
#line 170 "snxc.y"
    { Node *p = slookup((yyvsp[-1].Symbol));
      (yyval.Node) = opr('=', 2, id(p), opr('-', 2, id(p), con(1))); }
#line 1715 "y.tab.c"
    break;

  case 41: /* astmt: SYMBOL '[' expr ']' PP  */
#line 173 "snxc.y"
    { Node *p = slookup((yyvsp[-4].Symbol));
      (yyval.Node) = opr(MWT, 3, (yyvsp[-2].Node), opr('+', 2, opr(MRD, 2, copyStree((yyvsp[-2].Node)), id(p)), con(1)), id(p));
      if(!p->array) yyerror("not defined as array\n"); }
#line 1723 "y.tab.c"
    break;

  case 42: /* astmt: SYMBOL '[' expr ']' MM  */
#line 177 "snxc.y"
    { Node *p = slookup((yyvsp[-4].Symbol));
      (yyval.Node) = opr(MWT, 3, (yyvsp[-2].Node), opr('-', 2, opr(MRD, 2, copyStree((yyvsp[-2].Node)), id(p)), con(1)), id(p));
      if (!p->array) yyerror("not defined as array\n"); }
#line 1731 "y.tab.c"
    break;

  case 43: /* astmt: SYMBOL '[' expr ']' '=' expr  */
#line 181 "snxc.y"
    { Node *p = slookup((yyvsp[-5].Symbol));
      (yyval.Node) = opr(MWT, 3, (yyvsp[-3].Node), (yyvsp[0].Node), id(p)); 
      if (!p->array) yyerror("not defined as array\n"); }
#line 1739 "y.tab.c"
    break;

  case 44: /* stmt_list: stmt  */
#line 187 "snxc.y"
                    { (yyval.Node) = (yyvsp[0].Node); }
#line 1745 "y.tab.c"
    break;

  case 45: /* stmt_list: stmt_list stmt  */
#line 188 "snxc.y"
                    { (yyval.Node) = opr(';', 2, (yyvsp[-1].Node), (yyvsp[0].Node)); }
#line 1751 "y.tab.c"
    break;

  case 46: /* v_list: expr  */
#line 192 "snxc.y"
                    { (yyval.Node) = opr(',', 2, NULL, (yyvsp[0].Node)); }
#line 1757 "y.tab.c"
    break;

  case 47: /* v_list: v_list ',' expr  */
#line 193 "snxc.y"
                    { (yyval.Node) = opr(',', 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1763 "y.tab.c"
    break;

  case 48: /* expr: INTEGER  */
#line 197 "snxc.y"
                             { (yyval.Node) = con((yyvsp[0].IntVal)); }
#line 1769 "y.tab.c"
    break;

  case 49: /* expr: SYMBOL  */
#line 199 "snxc.y"
    { Node *p =slookup((yyvsp[0].Symbol));
      Pnode *ip = id(p);  
      (yyval.Node) = (p->type == func) ? opr(EA, 1, ip) : ip; }
#line 1777 "y.tab.c"
    break;

  case 50: /* expr: '-' expr  */
#line 202 "snxc.y"
                             { (yyval.Node) = opr(UMINUS, 1, (yyvsp[0].Node)); }
#line 1783 "y.tab.c"
    break;

  case 51: /* expr: '~' expr  */
#line 203 "snxc.y"
                             { (yyval.Node) = opr('~', 1, (yyvsp[0].Node)); }
#line 1789 "y.tab.c"
    break;

  case 52: /* expr: '&' SYMBOL  */
#line 204 "snxc.y"
                             { (yyval.Node) = opr(EA, 1, id(slookup((yyvsp[0].Symbol)))); }
#line 1795 "y.tab.c"
    break;

  case 53: /* expr: '*' expr  */
#line 205 "snxc.y"
                             { (yyval.Node) = opr(MRD, 1, (yyvsp[0].Node)); }
#line 1801 "y.tab.c"
    break;

  case 54: /* expr: MEM '[' expr ']'  */
#line 206 "snxc.y"
                             { (yyval.Node) = opr(MRD, 1, (yyvsp[-1].Node)); }
#line 1807 "y.tab.c"
    break;

  case 55: /* expr: SYMBOL '[' expr ']'  */
#line 208 "snxc.y"
    { Node *p = slookup((yyvsp[-3].Symbol));
      (yyval.Node) = opr(MRD, 2, (yyvsp[-1].Node), id(p));
      if (!p->array) yyerror("not defined as array\n"); }
#line 1815 "y.tab.c"
    break;

  case 56: /* expr: SYMBOL '(' v_list ')'  */
#line 211 "snxc.y"
                             { (yyval.Node) = opr(FUNC, 2, id(slookup((yyvsp[-3].Symbol))), (yyvsp[-1].Node)); }
#line 1821 "y.tab.c"
    break;

  case 57: /* expr: SYMBOL '(' ')'  */
#line 212 "snxc.y"
                             { (yyval.Node) = opr(FUNC, 1, id(slookup((yyvsp[-2].Symbol)))); }
#line 1827 "y.tab.c"
    break;

  case 58: /* expr: expr '&' expr  */
#line 213 "snxc.y"
                             { (yyval.Node) = opr('&', 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1833 "y.tab.c"
    break;

  case 59: /* expr: expr '|' expr  */
#line 214 "snxc.y"
                             { (yyval.Node) = opr('|', 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1839 "y.tab.c"
    break;

  case 60: /* expr: expr '*' expr  */
#line 215 "snxc.y"
                             { (yyval.Node) = opr('*', 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1845 "y.tab.c"
    break;

  case 61: /* expr: expr '+' expr  */
#line 216 "snxc.y"
                             { (yyval.Node) = opr('+', 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1851 "y.tab.c"
    break;

  case 62: /* expr: expr '-' expr  */
#line 217 "snxc.y"
                             { (yyval.Node) = opr('-', 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1857 "y.tab.c"
    break;

  case 63: /* expr: expr '<' expr  */
#line 218 "snxc.y"
                             { (yyval.Node) = opr('<', 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1863 "y.tab.c"
    break;

  case 64: /* expr: expr '>' expr  */
#line 219 "snxc.y"
                             { (yyval.Node) = opr('>', 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1869 "y.tab.c"
    break;

  case 65: /* expr: expr LAND expr  */
#line 220 "snxc.y"
                             { (yyval.Node) = opr(LAND, 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1875 "y.tab.c"
    break;

  case 66: /* expr: expr LOR expr  */
#line 221 "snxc.y"
                             { (yyval.Node) = opr(LOR, 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1881 "y.tab.c"
    break;

  case 67: /* expr: expr GE expr  */
#line 222 "snxc.y"
                             { (yyval.Node) = opr(GE, 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1887 "y.tab.c"
    break;

  case 68: /* expr: expr LE expr  */
#line 223 "snxc.y"
                             { (yyval.Node) = opr(LE, 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1893 "y.tab.c"
    break;

  case 69: /* expr: expr NE expr  */
#line 224 "snxc.y"
                             { (yyval.Node) = opr(NE, 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1899 "y.tab.c"
    break;

  case 70: /* expr: expr EQ expr  */
#line 225 "snxc.y"
                             { (yyval.Node) = opr(EQ, 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1905 "y.tab.c"
    break;

  case 71: /* expr: expr RSHIFT expr  */
#line 226 "snxc.y"
                             { (yyval.Node) = opr(RSHIFT, 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1911 "y.tab.c"
    break;

  case 72: /* expr: expr LSHIFT expr  */
#line 227 "snxc.y"
                             { (yyval.Node) = opr(LSHIFT, 2, (yyvsp[-2].Node), (yyvsp[0].Node)); }
#line 1917 "y.tab.c"
    break;

  case 73: /* expr: '(' expr ')'  */
#line 228 "snxc.y"
                             { (yyval.Node) = (yyvsp[-1].Node); }
#line 1923 "y.tab.c"
    break;


#line 1927 "y.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;


#if !defined yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturn;
#endif


/*-------------------------------------------------------.
| yyreturn -- parsing is finished, clean up and return.  |
`-------------------------------------------------------*/
yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 231 "snxc.y"


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
