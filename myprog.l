%%
true|false		printf("BOOLEAN\n");
;			printf("SEMICOLON\n");
[0-9]+ printf("Syntax Error: Wrong Integer Format!\n");
0|[1-9][0-9]*  printf("INTEGER\n"); 
\|\t|\n  ;
.			printf("Syntax Error!\n");
%%
