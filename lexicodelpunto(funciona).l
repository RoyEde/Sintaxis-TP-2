%{
    #include <math.h>
    #include <stdio.h>
    #include <ctype.h>
    #include <stdlib.h>
    FILE *sal;

%}

MAY [A-Z]

MIN [a-z]

OTRO [^A-Za-z]

%%

{MAY} {printf("%s",strlwr(yytext));fputs(strlwr(yytext),sal);}

{MIN} {printf("%s",strupr(yytext));fputs(strupr(yytext),sal);}

{OTRO} {printf("%s",yytext);fputs(yytext,sal);}

%%

int main(){
yyin = fopen("entrada.txt","r");
sal = fopen("salida.txt","w");
yylex();
fclose(yyin);
fclose(sal);
return 0;
}
