//Harika Part II is coming. HYPE!

%{
	#include<stdio.h>
	int yylex(void);
	void yyerror(char *);

	extern int yylineno;
%}

//Harika's Tokens
%token ENTRYPOINT
%token IFSTATEMENT
%token ELSEIFSTATEMENT
%token ELSESTATEMENT
%token FORLOOP
%token WHILELOOP
%token BOOLEAN
%token ATTRIBUTE
%token CLASSWITHARG
%token METHODCALL
%token METHOD
%token IN
%token IDENTIFIER
%token PARAMETERIDENTIFIER
%token CONSTANT
%token CLASS
%token INHERITANCE
%token LPARAN
%token RPARAN
%token LBRACKET
%token RBRACKET
%token RANGE
%token GREATER
%token LESS
%token GREATEROREQUAL
%token LESSOREQUAL
%token NOTEQUAL
%token NOT
%token ASSIGNMENT
%token COMPARISON
%token SEMICOLON
%token COMMA
%token OR
%token AND
%token INTEGER
%token DOUBLE
%token MULTIPLICATION
%token DIVISION
%token SUBTRACTION
%token ADDITION
%token REMAINDER
%token STRING
%token DOT

%%

Harika:
	  main		{printf("Harika says: main function is fine\n");}
	| functiondecleration
	| inheritance
	;

inheritance:
	CLASS INHERITANCE CLASS LBRACKET functionbody RBRACKET {printf("Harika says: inheritance is fine\n");}
	| error					{printf("Harika says: Invalid inheritance around line %d\n", yylineno);}
	;

op:
	  IDENTIFIER            {printf("Harika says: expression identifier\n");}
	| INTEGER
	| op ASSIGNMENT op		{printf("Harika says: assigment\n");}
	| op LESS op			{printf("Harika says: less\n");}
	| op LESSOREQUAL op		{printf("Harika says: lessOrEqual\n");}
	| op GREATER op			{printf("Harika says: greater\n");}
	| op GREATEROREQUAL op	{printf("Harika says: greaterOrEqual\n");}
	| op COMPARISON op		{printf("Harika says: comparison\n");}
	| op ADDITION op		{printf("Harika says: addition\n");}
	| op SUBTRACTION op		{printf("Harika says: subtraction\n");}
	| op MULTIPLICATION op	{printf("Harika says: multiplication\n");}
	| op DIVISION op		{printf("Harika says: division\n");}
	| op REMAINDER op		{printf("Harika says: remainder\n");}
	;

objectCreation:
	  CLASS IDENTIFIER ASSIGNMENT CLASS LPARAN args RPARAN {printf("Harika says: object creation\n");}
	  | CLASS IDENTIFIER ASSIGNMENT CONSTANT {printf("Harika says: object creation\n");}
	  | CLASS IDENTIFIER ASSIGNMENT STRING {printf("Harika says: object creation\n");}
	  | error {printf("Harika says: object creation\n");}
	;

stmt:
	  SEMICOLON 		{printf("Harika says: semicolon\n");}
	  | error			{printf("");}
	;

main:
	  ENTRYPOINT LBRACKET functionbody RBRACKET {printf("Harika says: main function\n");}
	;

functiondecleration:
	  IDENTIFIER DOT IDENTIFIER LPARAN args RPARAN LBRACKET functionbody RBRACKET	{printf("Harika says: funtion decleration 1\n"); {yyerrok;}}
	  | IDENTIFIER DOT IDENTIFIER LPARAN args RPARAN stmt	{printf("Harika says: funtion decleration 2\n"); {yyerrok;}}
	  | IDENTIFIER DOT METHODCALL LPARAN args RPARAN stmt {printf("Harika says: funtion decleration 3\n"); {yyerrok;}} 
	  | error {printf("Harika says: Invalid function decleration around line %d\n", yylineno);}
	;

functionbody:
	
	 stmt	{yyerrok;}
	| op stmt	{yyerrok;}
	| objectCreation stmt	{yyerrok;}
	| functiondecleration functionbody {yyerrok;}
	| functiondecleration {yyerrok;}
	| stmt functionbody	{yyerrok;}
	| op stmt functionbody	{yyerrok;}
	| objectCreation stmt functionbody	{yyerrok;}
	| conditional	{yyerrok;}
	;

args:
	  					//{printf("Harika says: there is no argument\n");}
	| PARAMETERIDENTIFIER argsTail IDENTIFIER argsTail	{printf("Harika says: identifier param\n");yyerrok;}
	| PARAMETERIDENTIFIER argsTail INTEGER argsTail	{printf("Harika says: integer param\n");yyerrok;}
	| PARAMETERIDENTIFIER argsTail BOOLEAN argsTail	{printf("Harika says: boolean param\n");yyerrok;}
	| PARAMETERIDENTIFIER argsTail CONSTANT argsTail	{printf("Harika says: constant param\n");yyerrok;}
	| PARAMETERIDENTIFIER argsTail METHODCALL argsTail	{printf("Harika says: methodcall param\n");yyerrok;}
	| PARAMETERIDENTIFIER argsTail CLASS argsTail	{printf("Harika says: methodcall param\n");yyerrok;}
	| error {printf("Harika says: parameter\n");}
	;

argsTail:
	| COMMA args	{yyerrok;}
	;

conditional:
	  IFSTATEMENT LPARAN op RPARAN LBRACKET functionbody RBRACKET	{printf("Harika says: if statement\n");yyerrok;}
	| ELSESTATEMENT LPARAN op RPARAN LBRACKET functionbody RBRACKET	{printf("Harika says: else statement\n");yyerrok;}
	| ELSEIFSTATEMENT LPARAN op RPARAN LBRACKET functionbody RBRACKET	{printf("Harika says: else if statement\n");yyerrok;}
	| FORLOOP IDENTIFIER IN RANGE LBRACKET functionbody RBRACKET	{printf("Harika says: for loop\n");yyerrok;}
	| WHILELOOP LPARAN op RPARAN LBRACKET functionbody RBRACKET	{printf("Harika says: while loop\n");yyerrok;}
	| error {printf("Harika says: Invalid conditional statement around line %d\n", yylineno);}
	;

%%



void yyerror(char *s) {	
	printf("");
}

int main(void) {
	yyparse();
	return 0;
}
