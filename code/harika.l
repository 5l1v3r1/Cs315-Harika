space	[ \t]+
newline	[\n]
comment [/]+.*

digit	[0-9]
lowercase	[_|a-z|_]
uppercase	[_|A-Z|_]

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
methodcall {identifier}{dot}{identifier}
method {identifier}{lparan}{rparan}
classwitharg {class}{lparan}({identifier}|{string}){rparan}
constant {class}{dot}{class}
integer {digit}+
double [-+]?{digit}*(\.{digit}+)
float [-+]?{digit}*(\.{digit}+)[f]
listelem {space}?{integer}{space}?
listbody ({space}?|{listelem}(,{listelem})*)
list \[{listbody}\]
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
{classwitharg}	printf("<CLASSWITHARG>");
{methodcall}	printf("<METHODCALL>");
{method}	printf("<METHOD>");
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
