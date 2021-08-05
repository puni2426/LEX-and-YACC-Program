%{

#include <stdio.h>

#include <stdlib.h>

int id=0, dig=0, key=0, op=0, stmt=0;

int yyeror();

int yylex();

%}

%token DIGIT ID KEY OP 

%%

input:DIGIT input { dig++; }

| ID input { id++; }

| KEY input { key++; }

| OP input {op++;}

| DIGIT { dig++; }

| ID { id++; }

| KEY { key++; }

| OP { op++;}

;

%%
extern FILE *yyin;

int main() 

{

char sfile[20];

printf("Enter filename:\n");

scanf("%s",sfile);

yyin=fopen(sfile,"r");

yyparse();

printf(" Keywords = %d\n Identifiers = %d\n operators = %d\n", key, id, op);

}

int yyerror()

{

printf("Parse error!");

exit(0);

}
