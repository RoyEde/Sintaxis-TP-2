%{

#include <stdio.h>
#include <stdlib.h>

%}

COMENTARIO "/""/"[^\n]*\n

%%

{COMENTARIO} {printf("Se borro exitosamente el comentario: %s \n\n",yytext);}

%%

int main() {
  yyin = fopen("entrada.c","r");
  yyout = fopen("salida.txt","w");
  yylex();
  return 0;
}
