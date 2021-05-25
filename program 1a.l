%{
int numoperator=0, numoperand=0, valid=1, top=-1, i=0, j=0;
char operator[10][10], operand[10][10], a [10];
%}
%%
"(" {top++; a[top]='(';}
"{" {top++; a[top]='{';}
"[" {top++; a[top]='[';}
")" {if(a[top] != '('){valid=0; return 0;}else top--;}
"}" {if(a[top] != '{'){valid=0; return 0;}else top--;}
"]" {if(a[top] != '['){valid=0; return 0;}else top--;}
"+"|"/" {numoperator++; strcpy(operator[i], yytext); i++;}
[0-9]+ {numoperand++; strcpy(operand[j], yytext); j++;}
. {valid=0;}
%%
int main()
{
int k;
 printf("enter the expression\n");
 yylex();
 if(valid==1 && top==-1 && (numoperand-numoperator)==1 && numoperator!=0)
 {
printf("The number of operators=%d\n", numoperator);
printf("the operators are\n");
for(k=0; k<i; k++)
printf("%s\n", operator[k]);
printf("The number of operands=%d\n",numoperand);
printf("the operands are\n");
for(k=0; k<j; k++)
printf("%s\n", operand[k]);
 }
 else
 printf("invalid expression\n");
}
