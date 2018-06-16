%{

#include <stdio.h>
#include <stdlib.h>

%}

COMENTARIO_DESPUES_DE_CODIGO "//"[^\n]*\n$

COMENTARIO_A_PRINCIPIO_DE_LINEA ^"//"[^\n]*\n

%%

{COMENTARIO_DESPUES_DE_CODIGO} {printf("Se borro exitosamente el comentario (despues de codigo): %s \n\n",yytext);}

{COMENTARIO_A_PRINCIPIO_DE_LINEA} {printf("Se borro exitosamente el comentario (a principio de linea): %s \n\n",yytext);}

%%

int main() {
  yyin = fopen("entrada.c","r");
  yyout = fopen("salida.txt","w");
  yylex();
  return 0;
}
