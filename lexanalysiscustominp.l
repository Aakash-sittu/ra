%{
#include "P1.tab.h"  
#include<stdio.h>
#include<stdlib.h>
%}

STARTCMNT "/*"
ENDCMNT "*/"
SIMPLE [^*]
SPACE [ \t\n]
COMPLEX "*"[^/]
LETTER ([a-z]|[A-Z]|_)
IDENTIFIER ({LETTER}({LETTER}|0|[1-9])*)
%s newstate

%%
 /* Write code to ignore empty spaces and newlines.   */
[ \t]+ { ; }
 /* Write code to ignore comments (single line and multiline).   */
"//"(.*[ \t]*.*)*[\n]+ { printf("\n"); }
{STARTCMNT}                    {yymore();BEGIN newstate;}
 <newstate>{SIMPLE}        {yymore();BEGIN newstate;}
 <newstate>{COMPLEX}      {yymore();BEGIN newstate;}
 <newstate>{SPACE}        {yymore();BEGIN newstate;}
 <newstate>{ENDCMNT}  {printf("\n");BEGIN 0;}
 /* Write code to scan all the operators, paranthesis etc. Example shown *below. */
"=" {char* str=yytext;printf ("<%s> ", "ASSIGNMENT");}
"+" {char* str = yytext; printf("<%s> ", "ADD");}
"-" {char* str = yytext; printf("<%s> ", "SUB");}
"/" {char* str = yytext; printf("<%s> ", "DIV");}
"*" {char* str = yytext; printf("<%s> ", "MUL");}
">" {char* str = yytext; printf("<%s> ", "GREATER_THAN");}
"<" {char* str = yytext; printf("<%s> ", "LESS_THAN");}
">=" {char* str = yytext; printf("<%s> ", "GREATER_THAN_EQUAL");}
"<=" {char* str = yytext; printf("<%s> ", "LESS_THAN_EQUAL");}
"!" {char* str = yytext; printf("<%s> ", "NOT");}
"(" {char* str = yytext; printf("<%s> ", "PAR_OPEN");}
")" {char* str = yytext; printf("<%s> ", "PAR_CLOSE");}
"{" {char* str = yytext; printf("<%s> ", "BRACE_OPEN");}
"}" {char* str = yytext; printf("<%s> ", "BRACE_CLOSE");}
"[" {char* str = yytext; printf("<%s> ", "SQR_OPEN");}
"]" {char* str = yytext; printf("<%s> ", "SQR_CLOSE");}
 /* Write code to scan all the keywords. Example shown below. */
"if" {char* str=yytext;printf ("<KW, %s> ", "if");}
"while" {char* str = yytext; printf("<KW, %s> ", "while");}
"class" {char* str = yytext; printf("<KW, %s> ", "class");}
"public" {char* str = yytext; printf("<KW, %s> ", "public");}
"static" {char* str = yytext; printf("<KW, %s> ", "static");}
"void" {char* str = yytext; printf("<KW, %s> ", "void");}
"main" {char* str = yytext; printf("<KW, %s> ", "main");}
"str" {char* str = yytext; printf("<KW, %s> ", "str");}
"println" {char* str = yytext; printf("<KW, %s> ", "println");}
"extends" {char* str = yytext; printf("<KW, %s> ", "extends");}
"this" {char* str = yytext; printf("<KW, %s> ", "this");}
"new" {char* str = yytext; printf("<KW, %s> ", "new");}
"System" {char* str = yytext; printf("<KW, %s> ", "System");}
"out" {char* str = yytext; printf("<KW, %s> ", "out");}
 /* Write code to scan all the punctuations. Example shown below. */
"." {char* str = yytext; printf("<%s> ", "DOT");}
";" {char* str = yytext; printf("<%s> ", "SEMI_COLON");}
 /* Write code to scan numbers and identifiers.  */
0|[1-9]0|[1-9]+ {char* str = yytext; printf("<%s> ", yytext);}
{IDENTIFIER} {char* str = yytext; printf("<ID, %s> ", yytext);}
 /* Write code to throw error if you encounter any invalid token. */
%%

int main(){
 yylex();
}
