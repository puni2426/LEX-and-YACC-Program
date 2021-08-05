%{

      #include<stdio.h>

      int yylex();

      void yyerror();

%}

%token A B NL

%%

x : s B NL { printf("String is Accessible\n");}

   ;

s : s A

   | 

   ;

%%

void main()

    {

          printf(" Enter the String\n");

          yyparse();

    }

void yyerror()

   {

      printf(" The String is Not Recognized\n");

   }





 




