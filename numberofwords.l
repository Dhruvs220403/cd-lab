%{
#include <stdio.h>
int word_count = 0;
%}

%%
[ \t\n]+   /* Match spaces, tabs, or newlines (ignore them) */
[a-zA-Z0-9]+  { word_count++; }  /* Match words (alphanumeric strings) */
.         /* Match any other characters (ignore them) */
%%

int main() {
    printf("Enter a paragraph:\n");
    yylex();  /* Start lexical analysis */
    printf("Total number of words: %d\n", word_count);
    return 0;
}

int yywrap() {
    return 1;
}

lex filename.l
gcc lex.yy.c -o filename -ll
./filename