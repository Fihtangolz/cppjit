%{
#include <stdio.h>
#define YYSTYPE char*
#include "parser.tab.h"

#define PASS_TOKEN( token_name ) \
yylval = yytext; \
return token_name
%}

%%
false { PASS_TOKEN(T_FALSE); }
true  { PASS_TOKEN(T_TRUE); }

nullptr { PASS_TOKEN(T_NULLPTR); }

"," { PASS_TOKEN(T_COMMA); }
";" { PASS_TOKEN(T_SEMICOLON); }

"("  { PASS_TOKEN(T_OPEN_ROUND_BRACKET); }
")"  { PASS_TOKEN(T_CLOSE_ROUND_BRACKET); }
"{"  { PASS_TOKEN(T_OPEN_BRACES); }
"}"  { PASS_TOKEN(T_CLOSE_BRACES); }
"*"  { PASS_TOKEN(T_STAR); }
"/"  { PASS_TOKEN(T_SLASH); }
"%"  { PASS_TOKEN(T_PERCENT); }
"+"  { PASS_TOKEN(T_PLUS); }
"-"  { PASS_TOKEN(T_MINUS); }
"^"  { PASS_TOKEN(T_UP_ARROW); }
"<"  { PASS_TOKEN(T_LESS); }
">"  { PASS_TOKEN(T_GREAT); }
"<<" { PASS_TOKEN(T_W_LESS); }
">>" { PASS_TOKEN(T_W_GREAT); }
"&"  { PASS_TOKEN(T_AMPERSAND); }
"&&" { PASS_TOKEN(T_W_AMPERSAND); }

0 { PASS_TOKEN(T_ZERO); }
1 { PASS_TOKEN(T_ONE); }
2 { PASS_TOKEN(T_TWO); }
3 { PASS_TOKEN(T_THREE); }
4 { PASS_TOKEN(T_FOUR); }
5 { PASS_TOKEN(T_FIVE); }
6 { PASS_TOKEN(T_SIX); }
7 { PASS_TOKEN(T_SEVEN); }
8 { PASS_TOKEN(T_EIGHT); }
9 { PASS_TOKEN(T_NINE); }

this printf("this");
"//" printf("sl_com");
"/*" printf("o_ml_com");
"*/" printf("c_ml_com");
"|" { PASS_TOKEN(T_VERTICAL_LINE); }
"||" { PASS_TOKEN(T_W_VERTICAL_LINE); }
"::" { PASS_TOKEN(T_W_COLON); }
":" { PASS_TOKEN(T_COLON); }
"?" { PASS_TOKEN(T_QUESTION_MARK); }
"default" { PASS_TOKEN(T_DEFAULT); }
"extern" { PASS_TOKEN(T_EXTERN); }
"case" { PASS_TOKEN(T_CASE); }
"catch" { PASS_TOKEN(T_CATCH); }
"switch" { PASS_TOKEN(T_SWITCH); }
"else" { PASS_TOKEN(T_ELSE); }
"if" { PASS_TOKEN(T_IF); }
"template" { PASS_TOKEN(T_TEMPLATE); }
"dynamic_cast" { PASS_TOKEN(T_DYNAMIC_CAST); }
"static_cast" { PASS_TOKEN(T_STATIC_CAST); }
"reinterpret_cast" { PASS_TOKEN(T_REINTERPRET_CAST); }
"const_cast" { PASS_TOKEN(T_CONST_CAST); }
"const" { PASS_TOKEN(T_CONST); }
"volatile" { PASS_TOKEN(T_VOLATILE); }
"..." { PASS_TOKEN(T_THREE_DOT); }
"typeid" { PASS_TOKEN(T_TYPEID); }
static_assert { PASS_TOKEN(T_STATIC_ASSERT); }
asm { PASS_TOKEN(T_ASM); }
enum { PASS_TOKEN(T_ENUM); }
class { PASS_TOKEN(T_CLASS); }
union { PASS_TOKEN(T_UNION); }
struct { PASS_TOKEN(T_STRUCT); }
using { PASS_TOKEN(T_USING); }
throw { PASS_TOKEN(T_THROW); }
noexcept { PASS_TOKEN(T_NOEXCEPT); };
try { PASS_TOKEN(T_TRY); }

= { PASS_TOKEN(T_EQ); }

explicit { PASS_TOKEN(T_EXPLICIT); }
override printf("try");
final { PASS_TOKEN(T_FINAL); }
new { PASS_TOKEN(T_NEW); }

private { PASS_TOKEN(T_PRIVATE); }
public { PASS_TOKEN(T_PUBLIC); }
protected { PASS_TOKEN(T_PROTECTED); }

u |
U { PASS_TOKEN(T_U_SUF); }

l |
L { PASS_TOKEN(T_L_SUF); }

ll |
LL { PASS_TOKEN(T_LL_SUF); }
.        ; /* игнорируем все остальное */
%%