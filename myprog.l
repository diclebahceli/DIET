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
operator    [*|/|+|-]

checkEquals (==)
checkNot    (!=)
checkBigger (>)
checkSmall  (<)
checkBigEq  (>=)
checkSmalEq (<=)
conditionalOp   (==|!=|<|>|<=|>=)


string      ["][^"]*["]
char        ['][^'"][']
integer     ({sign}?({digit}|{nonzero}{digit}*)) 
float       ({sign}?{integer}\.{digit}*) 
bool        true|false

identifier  ({letter}|[_])({letter}|{digit}|[_])*
literal     {integer}|{string}|{bool}|{char}|{float}
expression  {literal}([\ ]*{operator}[\ ]*{literal})*
variable    {type}[\ ]*{identifier}
parameter   {type}[\ ]*{identifier}
declaration {variable}[\ ]*[=][\ ]*{expression}
assignment  {identifier}[\ ]*[=][\ ]*{expression}
condition   [!]?({literal}|{identifier})[\ ]*{conditionalOp}[\ ]*({literal}|{identifier})
block       {statement}+
condition-sequence  {condition}[\ ]*([&||][\ ]*{condition})*
statement   {declaration}|{assignment}|{if-statement}|{block}



%% 

if                      { printf("IF "); }

elsif                   { printf("ELSIF "); }

else                    { printf("ELSE "); }

while                   {printf("WHILE ");}

df                      {printf("FUNCTION ");}

return                  {printf("RETURN ");}

".."                    {printf("COMMENT LINE ");}

"("                     { printf("LPAREN "); }

")"                     { printf("RPAREN "); }

"{"                     { printf("LBRACE "); }

"}"                     { printf("RBRACE "); }

{checkBigger}           {printf("GREATER ");}

{checkEquals}           {printf("EQUALS ");}

{checkNot}              {printf("NOT EQUALS ");}

{checkSmalEq}           {printf("SMALLER OR EQUALS ");}

{checkBigEq}            {printf("GREATER OR EQUALS ");}


{checkSmall}            {printf("SMALLER ");}

{bool}                  {printf("BOOLEAN ");}

{type}                  { printf("TYPE ");}

{identifier}            { printf("IDENTIFIER ");}

{equals}                { printf("EQUALS ");}

{plus}                  { printf("PLUS "); } 

{minus}                 { printf("MINUS "); }

{divide}                { printf("DIVIDE "); }

{mult}                  { printf("MULTIPLY "); }

{integer}               { printf("INTEGER ");}

{float}                 { printf("FLOAT ");}


;   	    	        { printf("SEMICOLON ");}

{string}                { printf("STRING "); }

{char}                  { printf("CHARACTER ");}

\n                      {printf("\n");}

{whitespace}            ;

.			            { printf("Syntax Error! ");}



%%

int main(void) {
    yylex();
    return 0;
}
