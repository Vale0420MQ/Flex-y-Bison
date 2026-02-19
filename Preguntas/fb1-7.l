/* reconocer tokens para la calculadora y devolverlos - punto 2 y 3 */
%%

"+"          { return ADD; }
"-"          { return SUB; }
"*"          { return MUL; }
"/"          { return DIV; }
"|"          { return ABS; }
"&"          { return AND; }  /* Operador AND */
"|"          { return OR; }   /* Operador OR */
"0x[a-fA-F0-9]+" {
                yylval = strtol(yytext, NULL, 16);  /* Convertir hexadecimal */
                return NUMBER; 
              }
[0-9]+       { yylval = atoi(yytext); return NUMBER; }
\n           { return EOL; }
[ \t]        { } /* ignora espacios y tabulaciones */
.            { printf("Mystery character %s\n", yytext); }

%%
