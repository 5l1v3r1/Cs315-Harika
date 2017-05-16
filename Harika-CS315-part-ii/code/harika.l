%{
    #include <cstdlib>
    #include <iostream>
    void yyerror(char const *);
    #include "y.tab.h"
%}

%option yylineno
space	[' '\t]+
newline	[\n]
comment [/]+.*

string_t "string"
int_t "int"
double_t "double"
float_t "float"
bool_t "bool"
char_t "char"

char \'[A-Za-z0-9_]\'

digit	[0-9]
lowercase	[_*a-z_*]
uppercase	[_*A-Z_*]

lparan \(
rparan \)

lbrackets \{
rbrackets \}

semicolon \;
comma	\,
dot	\.

assignment =
comparison ==
greater	>
less <
greaterequal	>=
lessequal	<=
notequal !=
not !
doubledash --
dashgreater ->

multiplication \*
division	\/
subtraction	\-
addition	\+
remainder \%


or \|\|
and \&\&

entryPoint main

ifstatement	if
elseifstatement	"else if"
elsestatement	else
boolean	true|false

forloop	for
whileloop while

string \"([^\\\"]|\\\"|\>|\\\\)*\"

alphanumeric ({lowercase}|{uppercase}|{digit})
identifier {lowercase}{alphanumeric}*
parameterIdentifier {identifier}:
class {uppercase}{alphanumeric}*
attribute {identifier}{dot}{class}
functioncall {identifier}{dot}{identifier}
function {identifier}{lparan}{alphanumeric}*{double}*{rparan}
classwitharg {class}{lparan}({identifier}|{string}){rparan}
integer {digit}+
double [-+]?{digit}*(\.{digit}+)
float [-+]?{digit}*(\.{digit}+)[f]
setelem {space}?{integer}|{string}{space}?
setbody ({space}?|{setelem}(,{setelem})*)
set \[{setbody}\]
range {digit}\.\.\.{digit}

%%
{entryPoint}	return ENTRYPOINT;
{ifstatement}	return IFSTATEMENT;
{elseifstatement}	return ELSEIFSTATEMENT;
{elsestatement}	return ELSESTATEMENT;
{forloop}	return FORLOOP;
{whileloop}	return WHILELOOP;
{boolean}	return BOOLEAN;
{attribute}	return ATTRIBUTE;
{string_t} return STRINGTYPE;
{int_t} return INTEGERTYPE;
{double_t} return DOUBLETYPE;
{float_t} return FLOATTYPE;
{bool_t} return BOOLEANTYPE;
{char_t} return CHARTYPE;
{char} return CHARACTER;
{set} return SET;

{classwitharg}	return CLASSWITHARG;

{functioncall}	return FUNCTIONCALL;

{function}	return FUNCTION;
{identifier}	return IDENTIFIER;
{parameterIdentifier}    return PARAMETERIDENTIFIER;
{class}	return CLASS;
{lparan}	return LPARAN;
{rparan}	return RPARAN;
{lbrackets}	return LBRACKET;
{rbrackets}	return RBRACKET;

{range}	return RANGE;

{greater}	return GREATER;
{less}	return LESS;
{greaterequal}	return GREATEROREQUAL;
{lessequal}	return LESSOREQUAL;
{notequal}	return NOTEQUAL;
{not}	return NOT;
{comparison}	return COMPARISON;
{assignment}	return ASSIGNMENT;

{semicolon}	return SEMICOLON;
{comma}	return COMMA;

{or}	return OR;
{and}	return AND;

{integer}	return INTEGER;
{double}	return DOUBLE;

{multiplication} return MULTIPLICATION;
{division}	return DIVISION;
{subtraction}	return SUBTRACTION;
{addition}	return ADDITION;
{remainder}	return REMAINDER;

{string} return STRING;

{comment} return COMMENT;
{space}	return SPACE;
{newline}	return NEWLINE;

%%

int yywrap(void) {
	return 1;
}
