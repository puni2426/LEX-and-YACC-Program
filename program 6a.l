%{

#include<stdio.h>

int cnt1 = 0, cnt2 = 0;

%}

%s multi single

%%

"/*" {BEGIN multi;}

<multi>"*/" {cnt1++; BEGIN 0;}

<multi>\n {cnt1++;}

<multi>. {;}

"//" {BEGIN single;}

<single>\n {cnt2++; BEGIN 0;}

<single>. {;}

%%

void main()

{

 yyin=fopen("src.c","r");

 yyout=fopen("dest.c","w");

 yylex();

 printf(Number of block comment lines is %d\n”, cnt1);

 printf(Number of single comment lines is %d\n”, cnt2);

 printf("Program Executed\n");

}
