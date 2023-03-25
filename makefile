myprog: myprog.l
	lex  myprog.l
	gcc -o myprog.dt lex.yy.c -ll

clean:
	rm myprog.dt lex.yy.c
