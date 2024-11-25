%{
#include <stdio.h>
%}

%%
[a-zA-Z][a-zA-Z0-9]*  { printf("Identifier: %s\n", yytext); }
.                       { /* Ignore other characters */ }
%%

int main() {
    printf("Enter a string to recognize identifiers (Ctrl+D to end):\n");
    yylex();  /* Start lexical analysis */
    return 0;
}

int yywrap() {
    return 1;  /* Indicate end of input */
}
