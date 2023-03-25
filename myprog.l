%{
#include <stdio.h> 
%}

/* Definitions */

whitespace  [ \t]+
digit       [0-9]
letter      [a-zA-Z]
nonzero     [1-9]
type        int|flt|boo|str|chr

sign        [+|-]
plus        [+]
minus       [-]
divide      [/]
mult        [*]
equals      [=]
underscore  [_]

checkEquals (==)
checkNot    (!=)
checkBigger (>)
checkSmall  (<)
checkBigEq  (>=)
checkSmalEq (<=)


string      ["][^"]*["]
char        ['][^'"][']
integer     ({sign}?({digit}|{nonzero}{digit}*)) 
float       ({sign}?{integer}\.{digit}*) 
bool        true|false

identifier  ({letter}|[_])({letter}|{digit}|[_])*
literal     {integer}|{string}|{bool}|{char}|{float}

%% 

{bool}                  printf("BOOLEAN ");

{type}                  printf("TYPE ");

{identifier}            { printf("IDENTIFIER "); }

{equals}                printf("EQUALS ");

{plus}                  { printf("PLUS "); } 

{minus}                 { printf("MINUS "); }

{divide}                { printf("DIVIDE "); }

{mult}                  { printf("MULTIPLY "); }

{integer}               { printf("INTEGER ");}

{float}                 printf("FLOAT ");


;   	    	        printf("SEMICOLON ");

{string}                { printf("STRING "); }

{char}                  printf("CHARACTER ");

\n                      printf("\n");





{whitespace}            ;


.			            printf("Syntax Error! ");

%%

int main(void) {
    yylex();
    return 0;
}
