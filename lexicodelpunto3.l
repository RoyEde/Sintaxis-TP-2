/* Escáner para un lenguaje al estilo de Pascal */

%{

/* Se necesita esto para la llamada a atof() , atoi más abajo */

#include <math.h>
#include <stdio.h>

float suma = 0.0;
float maximo = 0.0;
float minimo = 0.0;
int cantidad = 0;
%}

DIGITO   [0-9]

%%

^[\+\-]?{DIGITO}+("."{DIGITO}+)?(EOF|$)?   {
	printf("%g\n",atof(yytext));
	suma += atof(yytext);
	cantidad++;
	if(atof(yytext) < minimo) {
		minimo = atof(yytext);
	}
	if(atof(yytext) > maximo) {
		maximo = atof(yytext);
	}
}

%%

int main(){
    yyout = fopen("salida.txt","w");
    yyin = fopen("entrada.txt","r");
	printf("Numeros:\n\n");
    yylex();
	printf("Suma: %g\n", suma);
	printf("Cantidad: %d\n\n", cantidad);
	printf("Promedio: %g\n", suma/cantidad);
	printf("Maximo: %g\n", maximo);
	printf("Minimo: %g\n", minimo);
    return 0;
    }
