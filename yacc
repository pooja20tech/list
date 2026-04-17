LEX FILE (exp8.l)
%{
#include "y.tab.h"
%}

%%
[0-9]+      { return NUM; }
[ \t\n]     ;
.           { return yytext[0]; }
%%



YACC FILE (exp8.y)

%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);
%}

%token NUM

%%
E : E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  | '(' E ')'
  | NUM
  ;
%%

void yyerror(char *s)
{
    printf("Invalid Expression\n");
    exit(0);
}

int main()
{
    printf("Enter Expression\n");
    yyparse();
    printf("Valid Expression\n");
    return 0;
}


run
yacc -d exp8.y
lex exp8.l
gcc lex.yy.c y.tab.c -ll
./a.out