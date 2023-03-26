diet: diet.l
	lex  diet.l
	gcc -o example.dt lex.yy.c -ll

clean:
	rm example.dt lex.yy.c
