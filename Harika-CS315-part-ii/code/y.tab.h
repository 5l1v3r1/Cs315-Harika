/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ENTRYPOINT = 258,
     IFSTATEMENT = 259,
     ELSEIFSTATEMENT = 260,
     ELSESTATEMENT = 261,
     FORLOOP = 262,
     WHILELOOP = 263,
     BOOLEANTYPE = 264,
     BOOLEAN = 265,
     ATTRIBUTE = 266,
     CLASSWITHARG = 267,
     FUNCTIONCALL = 268,
     FUNCTION = 269,
     IDENTIFIER = 270,
     PARAMETERIDENTIFIER = 271,
     CLASS = 272,
     LPARAN = 273,
     RPARAN = 274,
     LBRACKET = 275,
     RBRACKET = 276,
     RANGE = 277,
     GREATER = 278,
     LESS = 279,
     GREATEROREQUAL = 280,
     LESSOREQUAL = 281,
     NOTEQUAL = 282,
     NOT = 283,
     ASSIGNMENT = 284,
     COMPARISON = 285,
     SEMICOLON = 286,
     CHARTYPE = 287,
     CHARACTER = 288,
     SET = 289,
     COMMA = 290,
     OR = 291,
     AND = 292,
     INTEGERTYPE = 293,
     INTEGER = 294,
     DOUBLETYPE = 295,
     DOUBLE = 296,
     FLOATTYPE = 297,
     FLOAT = 298,
     MULTIPLICATION = 299,
     DIVISION = 300,
     SUBTRACTION = 301,
     ADDITION = 302,
     REMAINDER = 303,
     STRINGTYPE = 304,
     STRING = 305,
     COMMENT = 306,
     SPACE = 307,
     NEWLINE = 308
   };
#endif
/* Tokens.  */
#define ENTRYPOINT 258
#define IFSTATEMENT 259
#define ELSEIFSTATEMENT 260
#define ELSESTATEMENT 261
#define FORLOOP 262
#define WHILELOOP 263
#define BOOLEANTYPE 264
#define BOOLEAN 265
#define ATTRIBUTE 266
#define CLASSWITHARG 267
#define FUNCTIONCALL 268
#define FUNCTION 269
#define IDENTIFIER 270
#define PARAMETERIDENTIFIER 271
#define CLASS 272
#define LPARAN 273
#define RPARAN 274
#define LBRACKET 275
#define RBRACKET 276
#define RANGE 277
#define GREATER 278
#define LESS 279
#define GREATEROREQUAL 280
#define LESSOREQUAL 281
#define NOTEQUAL 282
#define NOT 283
#define ASSIGNMENT 284
#define COMPARISON 285
#define SEMICOLON 286
#define CHARTYPE 287
#define CHARACTER 288
#define SET 289
#define COMMA 290
#define OR 291
#define AND 292
#define INTEGERTYPE 293
#define INTEGER 294
#define DOUBLETYPE 295
#define DOUBLE 296
#define FLOATTYPE 297
#define FLOAT 298
#define MULTIPLICATION 299
#define DIVISION 300
#define SUBTRACTION 301
#define ADDITION 302
#define REMAINDER 303
#define STRINGTYPE 304
#define STRING 305
#define COMMENT 306
#define SPACE 307
#define NEWLINE 308




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

