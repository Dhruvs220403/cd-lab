%{
#include <stdio.h>
%}

%%
[0-9]+          { printf("%s\n", yytext); }  /* Match sequences of digits and print them */
.|\n            { /* Ignore other characters */ }
%%

int main() {
    printf("Enter the input text (Ctrl+D to end):\n");
    yylex();  /* Start lexical analysis */
    return 0;
}

int yywrap() {
    return 1;  /* Indicate end of input */
}
