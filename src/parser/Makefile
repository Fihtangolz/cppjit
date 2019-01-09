all: parser

parser.tab.c parser.tab.h:	parser.y
	/usr/local/Cellar/bison/3.2.4/bin/bison  -d -t parser.y --graph

lex.yy.c: lexer.l parser.tab.h
	flex lexer.l # -d for debug

parser: lex.yy.c parser.tab.c parser.tab.h
	/usr/local/Cellar/llvm/7.0.1/bin/clang -DYYDEBUG=1 -o parser parser.tab.c lex.yy.c -ll

clean:
	rm parser lex.yy.c parser.tab.c parser.tab.h