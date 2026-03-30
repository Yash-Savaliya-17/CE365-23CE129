%{
#include <stdio.h>
#include <stdlib.h>

int parentheses = 0;
int valid = 1;
int last_was_comma = 0;
int last_was_open = 0;
%}

%%

"a"        { last_was_comma = 0; last_was_open = 0; }

"("        { 
              parentheses++; 
              last_was_open = 1; 
              last_was_comma = 0; 
           }

")"        { 
              if (parentheses <= 0 || last_was_comma || last_was_open) 
                  valid = 0;
              parentheses--; 
              last_was_comma = 0; 
              last_was_open = 0;
           }

","        { 
              if (last_was_comma || last_was_open) 
                  valid = 0;
              last_was_comma = 1; 
           }

\n         { return 0; }

.          { valid = 0; }

%%

int main() {
    printf("Enter string: ");
    yylex();

    if (valid && parentheses == 0 && !last_was_comma && !last_was_open)
        printf("Valid string\n");
    else
        printf("Invalid string\n");

    return 0;
}

int yywrap() {
    return 1;
}