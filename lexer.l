%{
int yyparse();
#include "y.tab.h"
%}

%%
program                         return PROGRAM;
if                              return IF;
else                            return ELSE;
print                           return PRINT;
var                             return VAR;
int                             return INT;
float                           return FLOAT;
[;:,\{\}\<\>\+\-\*\/\(\)=]      return *yytext;
[a-zA-Z][a-zA-Z0-9]*            return ID;
[0-9]+                          return CTEI;
[0-9]+\.[0-9]+                  return CTEF;
\".*\"                          return CTES;
"<>"                            return DIFF;
[ \t\n]                         ;
.                               printf("Hay un error de lexico en el caracter: \n%c\n", yytext[0]);

%%
int main(void)
{
 yyparse();
 return 0;
}

int yywrap(void)
{
 return 1;
}

int yyerror(char *s){
  printf("Se ha encontrado un error en el archivo de:\n%s\n", s);
  exit(1);
}


