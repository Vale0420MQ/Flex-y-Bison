%{
#include <stdio.h>
#include <stdlib.h>
%}

%token ADD SUB MUL DIV ABS NUMBER EOL

%%

calclist: /* nothing */
        | calclist exp EOL { printf("= %d\n", $2); }
        ;

exp: factor { $$ = $1; }
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
    ;

factor: term { $$ = $1; }
      | factor MUL term { $$ = $1 * $3; }
      | factor DIV term { $$ = $1 / $3; }
      ;

term: NUMBER { $$ = $1; }
    | ABS term { $$ = abs($2); }
    ;

%%

int main(int argc, char **argv)
{
    yyparse();  // Llama a la función de análisis
}

yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}

