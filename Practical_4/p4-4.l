%option noyywrap

%{
#include <stdio.h>
#include <string.h>

int lower = 0;
int upper = 0;
int digit = 0;
int symbol = 0;
int length = 0;
%}

%%

[a-z]          { lower++; length++; }
[A-Z]          { upper++; length++; }
[0-9]          { digit++; length++; }
[\*\;\,\#\$\@] { symbol++; length++; }

\n  {
        if(length >= 9 && length <= 15 &&
           lower >= 1 &&
           upper >= 1 &&
           digit >= 1 &&
           symbol >= 1)
            printf("Valid password\n");
        else
            printf("Invalid password\n");

        lower = upper = digit = symbol = length = 0;

        printf("Enter password: ");
     }

.   { length++; }

%%

int main()
{
    printf("Enter password: ");
    yylex();
    return 0;
}