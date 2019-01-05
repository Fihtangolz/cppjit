%{
#include <stdio.h>
int yylex() { return getc(stdin); }
void yyerror(char *s) {
    fprintf (stderr, "%s\n", s);
}
%}

%%

EVALUATE: EXPR '\n' { printf("%d\n", $$) } ;

EXPR:    TERM
| EXPR '+' TERM { $$ = $1 + $3; }
| EXPR '-' TERM { $$ = $1 - $3; }
| EXPR '%' TERM { $$ = $1 % $3; }
;

TERM:    NUM
| TERM '*' NUM  { $$ = $1 * $3; }
| TERM '/' NUM  { $$ = $1 / $3; }
;

NUM:      DIGIT
| NUM DIGIT    { $$ = $1*10+$2; }
;

DIGIT:    '0' { $$=0; } | '1' { $$=1; } | '2' { $$=2; } | '3' { $$=3; }
| '4' { $$=4; } | '5' { $$=5; } | '6' { $$=6; } | '7' { $$=7; }
| '8' { $$=8; } | '9' { $$=9; }
;

//lex.charset
HEX_QUAD: hexadecimal-digit hexadecimal-digit hexadecimal-digit hexadecimal-digit;
universal-character-name: \u hex-quad \U hex-quad hex-quad
//lex.pptoken
//lex.token
//lex.header
//lex.ppnumber
//lex.name
//lex.key
//lex.operators
//lex.literal.kinds
//lex.icon
//lex.ccon
//lex.fcon
//lex.string
//lex.bool
BOOLEAN_LITERAL: true false
//lex.nullptr
pointer-literal: nullptr
//lex.ext
//basic.link
//expr.prim.general
//expr.prim.lambda
LAMBDA_EXPRESSION: LAMBDA_INTRODUCER LAMBDA_DECLARATOR COMPOUND_STATEMENT { printf("lambda\n") };
LAMBDA_INTRODUCER: '[' LANBDA_CAPTURE ']';
LANBDA_CAPTURE: ;
CAPTURE_DEFAULT: ;
CAPTURE_LIST: ;
CAPTURE: ;
LAMBDA_DECLARATOR: "(" ")" ;
//expr.post
//expr.unary
//expr.new
//expr.delete
//expr.unary.noexcept
//expr.cast
//expr.mptr.oper
//expr.mul
//expr.add
//expr.shift
//expr.rel
//expr.eq
//expr.bit.and
//expr.xor
//expr.or
//expr.log.and
//expr.log.or
//expr.cond
//expr.ass
//expr.comma
//expr.const
//stmt.stmt
//stmt.label
//stmt.expr
//stm.block
COMPOUND_STATEMENT: ;
STATEMENT_SEQ: ;
//stmt.select
//stmt.iter
//stmt.jump
JUMP_STATEMENT: "break" | "continue" | "return" EXPRESSION | "return" BRACED_INIT_LIST | "goto" IDENTIFIER ;
//stmt.dcl
//dcl.dcl
//dcl.spec
//dcl.stc
//dcl.fct.spec
//dcl.fct.spec
function-specifier: "inline" | "virtual" | "explicit";
//dcl.typedef
typedef-name: IDENTIFIER;
//dcl.type
//dct.type.simple
//dcl.type.elab
//dcl.enum
//namespace.def
//namespace.alias
//namespace.udecl
//namespace.udir
//dcl.asm
//dcl.link
//dcl.attr.grammar
//dcl.decl
//dcl.name
//dcl.fct
//dcl.fct.def.general
//dcl.init
//class
//class.mem
//class.derived
//class.conv.fct
//class.base.init
//over.oper
//over.literal
//temp
//temp.param
//temp.names
//temp.res
//temp.explicit
//temp.expl.spec
//except
//except.spec
%%