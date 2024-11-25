%{
#include <stdio.h>
%}

%%
[ \t\n\r]+  { /* Ignore blank spaces, tabs, newlines, and carriage returns */ }
.           { printf("Character: %s\n", yytext); }  /* Print other characters */
%%

int main() {
    printf("Enter a string to skip blank spaces (Ctrl+D to end):\n");
    yylex();  /* Start lexical analysis */
    return 0;
}

int yywrap() {
    return 1;  /* Indicate end of input */
}
