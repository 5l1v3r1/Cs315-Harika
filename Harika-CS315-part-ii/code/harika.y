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
%token BOOLEANTYPE
%token BOOLEAN
%token ATTRIBUTE
%token CLASSWITHARG
%token FUNCTIONCALL
%token FUNCTION
%token IDENTIFIER
%token PARAMETERIDENTIFIER
%token CLASS
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
%token CHARTYPE
%token CHARACTER
%token SET
%token COMMA
%token OR
%token AND
%token INTEGERTYPE
%token INTEGER
%token DOUBLETYPE
%token DOUBLE
%token FLOATTYPE
%token FLOAT
%token MULTIPLICATION
%token DIVISION
%token SUBTRACTION
%token ADDITION
%token REMAINDER
%token STRINGTYPE
%token STRING
%token COMMENT
%token SPACE
%token NEWLINE
%%

Harika:
	  main		{printf("main function \n");}
	| functiondecleration
	;

op:
	  IDENTIFIER            {printf("Expression identifier\n");}
	| INTEGER
	| op ASSIGNMENT op		{printf("Assigment\n");}
	| op LESS op			{printf("Less\n");}
	| op LESSOREQUAL op		{printf("LessOrEqual\n");}
	| op GREATER op			{printf("Greater\n");}
	| op GREATEROREQUAL op	{printf("GreaterOrEqual\n");}
	| op COMPARISON op		{printf("Comparison\n");}
	| op ADDITION op		{printf("Addition\n");}
	| op SUBTRACTION op		{printf("Subtraction\n");}
	| op MULTIPLICATION op	{printf("Multiplication\n");}
	| op DIVISION op		{printf("Division\n");}
	| op REMAINDER op		{printf("Remainder\n");}
	;

objectCreation:
	  CLASS IDENTIFIER ASSIGNMENT LPARAN args RPARAN {printf("Object creation\n");}
	  | CLASS IDENTIFIER {printf("Object creation\n");}
	  | error {printf(" Invalid class creation around line %d\n", yylineno);}
	;

stmt:
	  SEMICOLON 		{printf("Semicolon\n");}
	  | error			{printf("You forgot semicolon around line %d\n", yylineno);}
	;

main:
	  ENTRYPOINT LPARAN RPARAN LBRACKET functionbody RBRACKET {printf("Main function\n");}
	;

functiondecleration:
	  IDENTIFIER LPARAN args RPARAN LBRACKET functionbody RBRACKET	{printf("Function decleration 1\n"); {yyerrok;}}
	  | IDENTIFIER LPARAN args RPARAN stmt	{printf("Function decleration 2\n"); {yyerrok;}}
	  | FUNCTIONCALL LPARAN args RPARAN stmt {printf("Function decleration 3\n"); {yyerrok;}} 
	  | error {printf(" Invalid function decleration around line %d\n", yylineno);}
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
	 //{printf("There is no argument\n");}
	| PARAMETERIDENTIFIER argsTail IDENTIFIER argsTail	{printf("Identifier param\n");yyerrok;}
	| PARAMETERIDENTIFIER argsTail INTEGER argsTail	{printf("Integer param\n");yyerrok;}
	| PARAMETERIDENTIFIER argsTail BOOLEAN argsTail	{printf("Boolean param\n");yyerrok;}
	| PARAMETERIDENTIFIER argsTail FUNCTIONCALL argsTail	{printf("Functioncall param\n");yyerrok;}
	| PARAMETERIDENTIFIER argsTail CLASS argsTail	{printf("Functioncall param\n");yyerrok;}
	| error {printf(" Invalid arguments list around line %d\n", yylineno);}
	;

argsTail:
	| COMMA args	{yyerrok;}
	;

conditional:
	  IFSTATEMENT LPARAN op RPARAN LBRACKET functionbody RBRACKET	{printf(" if statement\n");yyerrok;}
	| ELSESTATEMENT LPARAN op RPARAN LBRACKET functionbody RBRACKET	{printf(" else statement\n");yyerrok;}
	| ELSEIFSTATEMENT LPARAN op RPARAN LBRACKET functionbody RBRACKET	{printf(" else if statement\n");yyerrok;}
	| WHILELOOP LPARAN op RPARAN LBRACKET functionbody RBRACKET	{printf(" while loop\n");yyerrok;}
	;

%%



void yyerror(char *s) {	
	fprintf(stderr, " %s\n", s);
}

int main(void) {
	yyparse();
	return 0;
}
