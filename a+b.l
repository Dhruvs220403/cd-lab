%{
#include <stdio.h>
%}

%%
a+      { printf("Matched a+ (one or more a's): %s\n", yytext); }
b+      { printf("Matched b+ (one or more b's): %s\n", yytext); }
^$      { printf("Input is empty.\n"); }  /* Handle empty input */
.       { printf("Invalid character detected: %s\n", yytext); }
%%

int main() {
    printf("Enter a string consisting of only 'a' and 'b' (Ctrl+D to end):\n");
    yylex();  /* Start lexical analysis */
    return 0;
}

int yywrap() {
    return 1;  /* Indicate end of input */
}
