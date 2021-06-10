%{
#include<stdio.h>
#include<stdlib.h>
%}
%token NUM NL
%left '+' '-'
%left '*' '/'
%%
stmt: exp NL {
 printf("valid expression; result is = %d\n", $1);
 exit(0);
 };
exp: exp '+' exp { $$ = $1 + $3; }
 | exp '-' exp { $$ = $1 - $3; }
 | exp '*' exp { $$ = $1 * $3; }
 | exp '/' exp {
 if( $3 == 0)
{
printf("divide by zero error! \n");
exit(0);
}
else $$ = $1 / $3;
}
 | '(' exp ')' {$$ = $2;}
 | NUM { $$ = $1; };
%%
int yyerror()
{
printf("invalid expression\n"); exit(0);
}
int main()
{
printf("enter expression\n");
yyparse();
}
