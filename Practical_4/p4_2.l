
%option noyywrap
%{
	#include<stdio.h>
%}

%%

(C|c)(H|h)(A|a)(r|R)(U|u)(s|S)(a|A)(t|T)  printf("University");

.      printf("%s",yytext);

%%
int main()
{

	yylex(); 
	return 0;
}