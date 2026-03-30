%option noyywrap

%{
#include <stdio.h>
%}

num   [0-9]+

%%

{num}    { printf("%s\n", yytext); }
.          ;

%%

int main()
{
    yylex();
    return 0;
}