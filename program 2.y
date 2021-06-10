




%{

#include<stdio.h>

#include<stdlib.h>

#include<string.h>

%}

%token A B NL

%%

stmt:s B NL {printf("valid string\n");exit(0);};

s:s A

|

; 

%%

extern FILE *yyin;

int main()

{

FILE *fp;

char a[10],b[10];

int n,m,i;
printf("enter the value of n and m:\n");

scanf("%d%d",&n,&m);

for(i=0; i<n; i++)

{

a[i]='a';

}

a[n]='\0';

for(i=0; i<m; i++)

{

b[i]='b';

}

b[m]='\0';

strcat(a,b);

printf("the generated string is: %s\n",a);

fp=fopen("string.txt","w");

fprintf(fp,"%s\n",a);

fclose(fp);

fp=fopen("string.txt","r");

yyin=fp;

yyparse();

}

int yyerror()

{

printf("Invalid expression\n");

return 0;

}
