%{
#include <stdio.h>
#define YYSTYPE char*
#include "parser.tab.h"

#define PASS_TOKEN( token_name ) \
yylval = yytext; \
return token_name
%}

%%
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

_ { PASS_TOKEN(T_UNDERSCORE); }

"false" { PASS_TOKEN(T_FALSE); }
"true"  { PASS_TOKEN(T_TRUE); }

"nullptr" { PASS_TOKEN(T_NULLPTR); }

"," { PASS_TOKEN(T_COMMA); }
";" { PASS_TOKEN(T_SEMICOLON); }

"("  { PASS_TOKEN(T_OPEN_ROUND_BRACKET); }
")"  { PASS_TOKEN(T_CLOSE_ROUND_BRACKET); }
"{"  { PASS_TOKEN(T_OPEN_BRACES); }
"}"  { PASS_TOKEN(T_CLOSE_BRACES); }
"[" { PASS_TOKEN(T_OPEN_SQUARE_BRACKET); }
"]" { PASS_TOKEN(T_CLOSE_SQUARE_BRACKET); }
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
"""  { PASS_TOKEN(T_QUOTES); }

"this" { PASS_TOKEN(T_THIS) }
"//" printf("sl_com");
"/*" printf("o_ml_com");
"*/" printf("c_ml_com");
"|" { PASS_TOKEN(T_VERTICAL_LINE); }
"||" { PASS_TOKEN(T_W_VERTICAL_LINE); }
"::" { PASS_TOKEN(T_W_COLON); }
":" { PASS_TOKEN(T_COLON); }
"?" { PASS_TOKEN(T_QUESTION_MARK); }
"operator" { PASS_TOKEN(T_OPERATOR); }
"break" { PASS_TOKEN(T_BREAK); }
"virtual" { PASS_TOKEN(T_VIRTUAL); }
"inline" { PASS_TOKEN(T_INLINE); }
"return" { PASS_TOKEN(T_RETURN); }
"goto" { PASS_TOKEN(T_GOTO); }
"continue" { PASS_TOKEN(T_CONTINUE); }
"decltype" { PASS_TOKEN(T_DECLTYPE); }
"constexpr" { PASS_TOKEN(T_CONSTEXPR); }
"typedef" { PASS_TOKEN(T_TYPEDEF); }
"friend" { PASS_TOKEN(T_FRIEND); }
"thread_local" { PASS_TOKEN(T_THREAD_LOCAL); }
"alignas" { PASS_TOKEN(T_ALIGNAS); }
"alignof" { PASS_TOKEN(T_ALIGNOF); }
"default" { PASS_TOKEN(T_DEFAULT); }
"delete" { PASS_TOKEN(T_DELETE); }
"do" { PASS_TOKEN(T_DO); }
"double" { PASS_TOKEN(T_DOUBLE); }
"extern" { PASS_TOKEN(T_EXTERN); }
"case" { PASS_TOKEN(T_CASE); }
"char" { PASS_TOKEN(T_CHAR); }
"char16_t" { PASS_TOKEN(T_CHAR16_T); }
"char32_t" { PASS_TOKEN(T_CHAR32_T); }
"wchar_t" { PASS_TOKEN(T_WCHAR_T); }
"int" { PASS_TOKEN(T_INT); }
"catch" { PASS_TOKEN(T_CATCH); }
"switch" { PASS_TOKEN(T_SWITCH); }
"void" { PASS_TOKEN(T_VOID); }
"else" { PASS_TOKEN(T_ELSE); }
"while" { PASS_TOKEN(T_WHILE); }
"if" { PASS_TOKEN(T_IF); }
"template" { PASS_TOKEN(T_TEMPLATE); }
"dynamic_cast" { PASS_TOKEN(T_DYNAMIC_CAST); }
"const_cast" { PASS_TOKEN(T_CONST_CAST); }
"static" { PASS_TOKEN(T_STATIC); }
"static_cast" { PASS_TOKEN(T_STATIC_CAST); }
"reinterpret_cast" { PASS_TOKEN(T_REINTERPRET_CAST); }
"const_cast" { PASS_TOKEN(T_CONST_CAST); }
"const" { PASS_TOKEN(T_CONST); }
"volatile" { PASS_TOKEN(T_VOLATILE); }
"." { PASS_TOKEN(T_DOT); }
"..." { PASS_TOKEN(T_THREE_DOT); }
"typeid" { PASS_TOKEN(T_TYPEID); }
"typename" { PASS_TOKEN(T_TYPENAME); }
"static_assert" { PASS_TOKEN(T_STATIC_ASSERT); }
"asm" { PASS_TOKEN(T_ASM); }
"auto" { PASS_TOKEN(T_AUTO); }
"bool" { PASS_TOKEN(T_BOOL); }
"enum" { PASS_TOKEN(T_ENUM); }
"class" { PASS_TOKEN(T_CLASS); }
"union" { PASS_TOKEN(T_UNION); }
"unsigned" { PASS_TOKEN(T_UNSIGNED); }
"struct" { PASS_TOKEN(T_STRUCT); }
"using" { PASS_TOKEN(T_USING); }
"throw" { PASS_TOKEN(T_THROW); }
"noexcept" { PASS_TOKEN(T_NOEXCEPT); };
"float" { PASS_TOKEN(T_FLOAT); };
"long" { PASS_TOKEN(T_LONG); };
"mutable" { PASS_TOKEN(T_MUTABLE); };
"namespace" { PASS_TOKEN(T_NAMESPACE); };
"for" { PASS_TOKEN(T_FOR); }
"try" { PASS_TOKEN(T_TRY); }
"short" { PASS_TOKEN(T_SHORT); }
"signed" { PASS_TOKEN(T_SIGNED); }
"sizeof" { PASS_TOKEN(T_SIZEOF); }

"=" { PASS_TOKEN(T_EQ); }

"export" { PASS_TOKEN(T_EXPORT); }
"explicit" { PASS_TOKEN(T_EXPLICIT); }
"override" printf("try");
"final" { PASS_TOKEN(T_FINAL); }
"new" { PASS_TOKEN(T_NEW); }

"private" { PASS_TOKEN(T_PRIVATE); }
"public" { PASS_TOKEN(T_PUBLIC); }
"protected" { PASS_TOKEN(T_PROTECTED); }
"register" { PASS_TOKEN(T_REGISTER); }

"e" { PASS_TOKEN(T_E); }
"E" { PASS_TOKEN(T_UP_CASE_E); }

"\u" { PASS_TOKEN(T_SLASH_U_SUFF); }
"\U" { PASS_TOKEN(T_SLASH_UP_CASE_U_SUFF); }

"u" |
"U" { PASS_TOKEN(T_U_SUF); }

"l" |
"L" { PASS_TOKEN(T_L_SUF); }

"ll" |
"LL" { PASS_TOKEN(T_LL_SUF); }

[A-Za-z] { PASS_TOKEN(T_LETTER); }
.        ; /* игнорируем все остальное */
%%