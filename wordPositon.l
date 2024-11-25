%{
#include <stdio.h>
#include <string.h>

int word_position = 1;  // Variable to keep track of the position of each word
%}

%%

[a-zA-Z]+  { 
            printf("Found word: %s at position: %d\n", yytext, word_position);
            word_position++;
        }

[ \t\n\r]+  { /* Ignore whitespace */ }

.           { /* Ignore other characters */ }

%%

int main() {
    printf("Enter a sentence (Ctrl+D to end):\n");
    yylex();  // Start lexical analysis
    return 0;
}

int yywrap() {
    return 1;  // End of input
}
