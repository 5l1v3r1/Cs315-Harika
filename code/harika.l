space	[ \t]+
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
constant {class}{dot}{class}
integer {digit}+
double [-+]?{digit}*(\.{digit}+)
float [-+]?{digit}*(\.{digit}+)[f]
setelem {space}?{integer}|{string}{space}?
setbody ({space}?|{setelem}(,{setelem})*)
set \[{setbody}\]
range {digit}\.\.\.{digit}

%%
{entryPoint}	printf("<ENTRYPOINT>");
{ifstatement}	printf("<IFSTATEMENT>");
{elseifstatement}	printf("<ELSEIFSTATEMENT>");
{elsestatement}	printf("<ELSESTATEMENT>");
{forloop}	printf("<FORLOOP>");
{whileloop}	printf("<WHILELOOP>");
{boolean}	printf("<BOOLEAN>");
{attribute}	printf("<ATTRIBUTE>");
{string_t} printf("<STRINGTYPE>");
{int_t} printf("<INTEGERTYPE>");
{double_t} printf("<DOUBLETYPE>");
{float_t} printf("<FLOATTYPE>");
{bool_t} printf("<BOOLEANTYPE>");
{char_t} printf("<CHARTYPE>");
{char} printf("<CHARACTER>");
{set} printf("<SET>");

{classwitharg}	printf("<CLASSWITHARG>");

{functioncall}	printf("<FUNCTIONCALL>");

{function}	printf("<FUNCTION>");
{identifier}	printf("<IDENTIFIER>");
{parameterIdentifier}    printf("<PARAMETERIDENTIFIER>");
{constant}	printf("<CONSTANT>");
{class}	printf("<CLASS>");
{lparan}	printf("<LPARAN>");
{rparan}	printf("<RPARAN>");
{lbrackets}	printf("<LBRACKET>");
{rbrackets}	printf("<RBRACKET>");

{range}	printf("<RANGE>");

{greater}	printf("<GREATER>");
{less}	printf("<LESS>");
{greaterequal}	printf("<GREATEROREQUAL>");
{lessequal}	printf("<LESSOREQUAL>");
{notequal}	printf("<NOTEQUAL>");
{not}	printf("<NOT>");
{comparison}	printf("<COMPARISON>");
{assignment}	printf("<ASSIGNMENT>");

{semicolon}	printf("<SEMICOLON>");
{comma}	printf("<COMMA>");

{or}	printf("<OR>");
{and}	printf("<AND>");

{integer}	printf("<INTEGER>");
{double}	printf("<DOUBLE>");

{multiplication} printf("<MULTIPLICATION>");
{division}	printf("<DIVISION>");
{subtraction}	printf("<SUBTRACTION>");
{addition}	printf("<ADDITION>");
{remainder}	printf("<REMAINDER>");

{string} printf("<STRING>");

{comment}	;
{space}	;
{newline}	printf("\n");

%%

int yywrap(void) {
	return 1;
}

int main(void) {
	yylex();
	return 0;
}
