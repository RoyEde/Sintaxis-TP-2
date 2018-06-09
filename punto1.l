COMENTARIO_DE_UNA_LINEA ^//([a-zA-Z0-9]*[^a-zA-Z0-9]*)*\n$
COMENTARIO_DE_MUCHAS_LINEAS ^/\*([a-zA-Z0-9]*[^a-zA-Z0-9]*)*\*/$

%%
{COMENTARIO_DE_UNA_LINEA} {printf("")}
{COMENTARIO_DE_MUCHAS_LINEAS} {printf("")}
%%

int main() {
  yyout = fopen("salida.txt","w");
  yyin = fopen("entrada.txt","r");
  yylex();
  return 0;
}
