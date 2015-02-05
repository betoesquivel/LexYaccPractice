%{
int yywrap();
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

%%

int yywrap(void){
  return 1;
}


