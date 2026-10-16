%{
#include <stdio.h>
%}

%option noyywrap

DIGIT       [0-9]
LETTER      [a-zA-Z_]
IDENTIFIER  {LETTER}({LETTER}|{DIGIT})*
NUMBER      {DIGIT}+
STRING      \"[^\"\n]*\"

%%

"start"      { printf("START: %s\n", yytext); }
"Let"        { printf("LET: %s\n", yytext); }
"show"       { printf("SHOW: %s\n", yytext); }
"if"         { printf("IF: %s\n", yytext); }
"end"        { printf("END: %s\n", yytext); }

">="         { printf("GREATER_EQUAL: %s\n", yytext); }
"="          { printf("ASSIGNMENT: %s\n", yytext); }
"*"          { printf("MULTIPLY: %s\n", yytext); }
"+"          { printf("PLUS: %s\n", yytext); }
";"          { printf("SEMICOLON: %s\n", yytext); }
"("          { printf("LEFT_PAREN: %s\n", yytext); }
")"          { printf("RIGHT_PAREN: %s\n", yytext); }

{STRING}     { printf("STRING: %s\n", yytext); }
{NUMBER}     { printf("NUMBER: %s\n", yytext); }
{IDENTIFIER} { printf("IDENTIFIER: %s\n", yytext); }

[ \t\r\n]+   { /* Ignore whitespace */ }
.            { printf("UNKNOWN: %s\n", yytext); }

%%

int main(void)
{
    yylex();
    return 0;
}
