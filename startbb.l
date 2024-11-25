%{
#include <stdio.h>
#include <string.h>
%}

%%
^bb      { printf("Error: Sentence cannot start with 'bb'.\n"); return 1; }  /* Match if the sentence starts with 'bb' */
[a-b]+    { printf("Valid input: %s\n", yytext); }  /* Match valid sequences containing only 'a' and 'b' */
[^a-b]    { printf("Invalid character detected: %s\n", yytext); return 1; }  /* Any character other than 'a' or 'b' */
\n        { /* Ignore newline characters */ }
%%

int main() {
    printf("Enter a string consisting of only 'a' and 'b' (Ctrl+D to end):\n");
    yylex();  /* Start lexical analysis */
    return 0;
}

int yywrap() {
    return 1;  /* Indicate end of input */
}
