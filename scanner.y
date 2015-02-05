%{
void yyerror (char *s);
int yylex();
int yyparse();

#include <stdio.h>
#include <stdlib.h>
%}

%start programa
%token PROGRAM
%token IF
%token ELSE
%token PRINT
%token VAR
%token INT
%token FLOAT
%token ID
%token CTEI
%token CTEF
%token CTES
%token DIFF

%%
programa : PROGRAM ID ';' programa2 bloque
         ;

programa2 : vars
          | empty
          ;

vars : VAR vars2
     ;

vars2 : ID vars3
      ;

vars3 : ',' vars2
      | ':' tipo ';' vars4
      ;

vars4 : vars2
      | empty
      ;

tipo : INT
     | FLOAT
     ;

bloque : '{' bloque2 '}'
       ;

bloque2 : estatuto bloque2
        | empty
        ;

estatuto : asignacion
         | condicion
         | escritura
         ;

asignacion : ID '=' expresion ';'
           ;

expresion : exp expresion2
          ;

expresion2 : '>' exp
           | '<' exp
           | DIFF exp
           | empty
           ;

condicion : IF '(' expresion ')' bloque condicion2 ';'
          ;

condicion2 : ELSE bloque
           | empty
           ;

escritura : PRINT '(' escritura2 ')' ';'
          ;

escritura2 : expresion escritura3
           | CTES escritura3
           ;

escritura3 : ',' escritura2
           | empty
           ;

exp : termino exp2

exp2 : '+' exp
     | '-' exp
     | empty
     ;

termino : factor termino2
        ;

termino2 : '*' termino
         | '/' termino
         | empty
         ;

factor : '(' expresion ')'
       | factor2
       ;

factor2 : '+' varcte
        | '-' varcte
        | varcte
        ;

varcte : ID
       | CTEI
       | CTEF
       ;

empty :  ;
