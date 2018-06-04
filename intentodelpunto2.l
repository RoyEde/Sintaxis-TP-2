
%{

    #include <math.h>
    #include <stdio.h>
    #include <ctype.h>

%}

MAY   [A-Z]
MIN   [a-z]
OTRO [^A-Za-z]

%%

{MAY} {tolower(yyin);printf("%c", fputc(yyin, salida));}

{MIN} {toupper(yyin);printf("%c", fputc(yyin, salida));}

{OTRO} {printf("%c", fputc(yyin, salida));}


%%

void CargarArchivo() {

yyin = fopen("entrada.txt","r");
salida = fopen("salida.txt","w");
while((caracter = fgetc(archivoLectura)) != EOF){
yylex();
}
  fclose(yyin);
  fclose(salida);
  return;
}
int main(){
    CargarArchivo();
    return 0;
    }
