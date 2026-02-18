
/* reconocer tokens para la calculadora y devolverlos */
%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n     { return EOL; }
[ \t]  { } /* ignora espacios y tabulaciones */
.      { printf("Mystery character %s\n", yytext); }
%%
