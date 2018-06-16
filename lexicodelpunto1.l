%{

#include <stdio.h>
#include <stdlib.h>

%}

COMENTARIO_DE_UNA_LINEA "//"[^\n]*$
COMENTARIO_MULTIPLE_LINEA "/*"[^"*/"]*"*/"

%%

{COMENTARIO_DE_UNA_LINEA} {printf("Comentario de una linea borrado: %s\n",yytext);}

{COMENTARIO_MULTIPLE_LINEA} {printf("Comentario de multiples lineas: %s\n",yytext);}

%%

int main() {
  yyin = fopen("entrada.c","r");
  yyout = fopen("salida.txt","w");
  yylex();
  return 0;
}
