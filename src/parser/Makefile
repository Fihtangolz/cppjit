all: parser

parser.tab.c parser.tab.h:	parser.y
	bison -d parser.y --graph

lex.yy.c: lexer.l parser.tab.h
	flex lexer.l

parser: lex.yy.c parser.tab.c parser.tab.h
	clang -o parser parser.tab.c lex.yy.c -ll

clean:
	rm parser lex.yy.c parser.tab.c parser.tab.h