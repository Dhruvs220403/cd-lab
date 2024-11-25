%{
#include <stdio.h>
#include <string.h>

/* Define a list of keywords */
char *keywords[] = {"int", "float", "if", "else", "for", "while", "return", "void"};
int is_keyword(const char *word) {
    for (int i = 0; i < sizeof(keywords)/sizeof(keywords[0]); i++) {
        if (strcmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {  /* Match identifiers or keywords */
    if (is_keyword(yytext)) {
        /* Print keyword in uppercase */
        for (int i = 0; yytext[i]; i++) {
            putchar(toupper(yytext[i]));  /* Convert to uppercase */
        }
    } else {
        printf("%s", yytext); /* Print non-keywords as is */
    }
}
[ \t\n]                 { printf("%s", yytext); } /* Print spaces, tabs, and newlines as is */
.                       { printf("%s", yytext); } /* Print other characters as is */
%%

int main() {
    printf("Enter a paragraph (Ctrl+D to end):\n");
    yylex();  /* Start lexical analysis */
    return 0;
}

int yywrap() {
    return 1;  /* Indicate end of input */
}