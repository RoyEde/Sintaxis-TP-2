%{

#include <stdio.h>
#include <stdlib.h>

%}

COMENTARIO_MULTIPLE_LINEA "/*"[^"*/"]*"*/"
COMENTARIO_DE_UNA_LINEA "//"[^\n^EOF]*$?

%%

{COMENTARIO_MULTIPLE_LINEA} {printf("Comentario de multiples lineas: %s\n",yytext);}

{COMENTARIO_DE_UNA_LINEA} {printf("Comentario de una linea borrado: %s\n",yytext);}

%%

int main() {
  yyin = fopen("entrada1.c","r");
  yyout = fopen("salida1.c","w");
  yylex();
  return 0;
}
