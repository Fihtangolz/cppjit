%{
#include <stdio.h>
#define YYSTYPE char*
#include "parser.tab.h"

#define PASS_TOKEN( token_name ) \
yylval = yytext; \
return token_name 
%}

%x comment
%x mul_comment
%x string_literal
%%
/* eat up whitespace */
"//" BEGIN(comment);
<comment>[^\n]* 
<comment>"\n"  printf("Single line comment ignored\n"); BEGIN(INITIAL); 

"/*" BEGIN(mul_comment);
<mul_comment>[^"*/"]*
<mul_comment>"*/" printf("Multiple line comment ignored\n"); BEGIN(INITIAL); 



"&"   { PASS_TOKEN(T_AMPERSAND); }
"="   { PASS_TOKEN(T_EQ); }
"["   { PASS_TOKEN(T_OPEN_SQUARE_BRACKET); }
"]"   { PASS_TOKEN(T_CLOSE_SQUARE_BRACKET); }
"{"   { PASS_TOKEN(T_OPEN_BRACES); }
"}"   { PASS_TOKEN(T_CLOSE_BRACES); }

[0-9] printf("Digit\n");

[A-Za-z] printf("Alpha\n");

"\n" { PASS_TOKEN(T_NEW_LINE); }
%%