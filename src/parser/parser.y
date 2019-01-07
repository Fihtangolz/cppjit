%{
#define YYDEBUG 1
#define YYSTYPE char*
#include <stdio.h>
int yylex();
void yyerror(char *s) {
    fprintf (stderr, "%s\n", s);
}
%}

%token T_TRUE T_FALSE T_CLASS T_NULLPTR T_LL_SUF T_L_SUF T_U_SUF T_PUBLIC T_PROTECTED T_PRIVATE T_DIGIT T_FINAL
%token T_NEW T_NONDIGIT T_UNION T_STRUCT T_EXPLICIT
%token T_MUTABLE T_EXTERN T_THREAD_LOCAL T_STATIC T_REGISTER T_AUTO T_STATIC_ASSERT
%token T_USING T_TYPEID T_THROW T_CASE T_IF T_ELSE T_SWITCH T_TRY
%token T_EQ T_SEMICOLON T_COMMA T_STAR T_AMPERSAND T_W_AMPERSAND T_THREE_DOT T_W_COLON T_COLON
%token T_QUESTION_MARK T_W_VERTICAL_LINE T_PERCENT T_PLUS T_VERTICAL_LINE T_W_LESS T_W_GREAT T_UP_ARROW T_SLASH
%token T_OPEN_ROUND_BRACKET T_CLOSE_ROUND_BRACKET
%token T_LESS T_GREAT T_MINUS
%token T_CONST T_VOLATILE T_ASM T_ENUM T_CATCH T_NOEXCEPT T_DEFAULT
%token T_TEMPLATE T_CONST_CAST T_STATIC_CAST T_DYNAMIC_CAST T_REINTERPRET_CAST
%token T_ZERO T_ONE T_TWO T_THREE T_FOUR T_FIVE T_SIX T_SEVEN T_EIGHT T_NINE
%token T_OPEN_BRACES T_CLOSE_BRACES
%start input
%debug

%%
//optional
T_THREE_DOT_opt: T_THREE_DOT | /* empty */;

type_id_list_opt: type_id_list | /* empty */;

assignment_expression_opt: assignment_expression | /* empty */;

attribute_specifier_seq_opt: attribute_specifier_seq | /* empty */;

abstract_declarator_opt: abstract_declarator_opt | /* empty */;

ctor_initializer_opt: ctor_initializer | /* empty */;

T_EXTERN_opt: T_EXTERN | /* empty */;

T_W_COLON_opt: T_W_COLON | /* empty */;

T_TEMPLATE_opt: T_TEMPLATE | /* empty */;

declaration_seq_opt: declaration_seq | /* empty */;

statement_seq_opt: statement_seq | /* empty */;

//lex.key
keyword: ;

//basic.link
input: declaration_seq_opt;

//dcl.name
type_id: type_specifier_seq abstract_declarator |
         type_specifier_seq /* empty */ ;

//dcl.type


//dcl.decl

cv_qualifier_seq: cv_qualifier | cv_qualifier cv_qualifier_seq;

cv_qualifier: T_CONST | T_VOLATILE;

ref_qualifier: T_AMPERSAND | T_W_AMPERSAND;

declarator_id: T_THREE_DOT | T_W_COLON;

//dcl.dcl
declaration_seq:
    declaration |
    declaration_seq declaration
;

declaration:
    function_definition |
;

block_declaration:
	simple_declaration |
 	asm_definition |
 	namespace_alias_definition |
 	using_declaration |
    using_directive |
    static_assert_declaration |
    alias_declaration |
    opaque_enum_declaration |
;

alias_declaration:
    T_USING identifier T_EQ type_id T_SEMICOLON {
        printf("%s\n", "alias_declaration");
    }
;

simple_declaration:
    attribute-specifier-seqopt decl-specifier-seqopt init-declarator-listopt
;

static_assert_declaration:
    T_STATIC_ASSERT T_OPEN_ROUND_BRACKET constant_expression T_COMMA T_CLOSE_ROUND_BRACKET T_SEMICOLON {
        printf("%s\n", "static_assert_declaration");
    }
;

empty_declaration: T_SEMICOLON {
   printf("%s\n", "empty_declaration");
};

attribute_declaration:
    attribute_specifier_seq T_SEMICOLON
;

//stmt.label
labeled_statement:
    attribute_specifier_seq identifier T_COLON statement |
    attribute_specifier_seq T_CASE constant_expression T_COLON statement |
    attribute_specifier_seq T_DEFAULT T_COLON statement
;

//stmt.stmt
statement:
    labeled_statement
    attribute_specifier_seq_opt expression_statement |
    attribute_specifier_seq_opt compound_statement |
    attribute_specifier_seq_opt selection_statement |
    attribute_specifier_seq_opt iteration_statement |
    attribute_specifier_seq_opt jump_statement |
    declaration_statement |
    attribute_specifier_seq_opt try_block
;

//stmt.block +
compound_statement:
    T_OPEN_BRACES statement_seq_opt T_CLOSE_BRACES
;

statement_seq:
    statement |
    statement_seq statement
;

//dcl.fct.def.general
function_definition:
     attribute_specifier_seqopt decl-specifier-seqopt declarator function-body |
     attribute_specifier_seqopt decl-specifier-seqopt declarator T_EQ T_DEFAULT T_SEMICOLON |
     attribute_specifier_seqopt decl-specifier-seqopt declarator T_EQ T_DEFAULT T_SEMICOLON
;

function_body:
    ctor_initializer compound_statement |
    function_try_block
;

//dcl.spec
decl_specifier: storage_class_specifier

//dcl.stc
storage_class_specifier: T_AUTO | T_REGISTER | T_STATIC | T_THREAD_LOCAL | T_EXTERN | T_MUTABLE

//lex.name
identifier: ;

digit: "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9";

//lex.literal.kinds
literal: integer_literal | boolean_literal | pointer_literal;

//lex.bool
boolean_literal: T_TRUE { $$ = $1; } | T_FALSE { $$ = $1; };

//lex.nullptr
pointer_literal: T_NULLPTR { $$ = $1; };

//lex.icon
integer_literal:
    decimal_literal integer_suffix { printf("decimal_literal"); } |
    decimal_literal  /* empty */   { printf("decimal_literal"); } |
    octal_literal integer_suffix       |
    octal_literal /* empty */          |
    hexadecimal_literal integer_suffix |
    hexadecimal_literal /* empty */
;

decimal_literal:
    nonzero_digit |
    decimal_literal digit
;

octal_literal:
    T_ZERO |
    octal_literal octal_digit { printf("decimal_literal"); }
;

nonzero_digit:
    T_ONE |
    T_TWO |
    T_THREE |
    T_FOUR |
    T_FIVE |
    T_SIX |
    T_SEVEN |
    T_EIGHT |
    T_NINE
;

octal_digit:
    T_ZERO |
    T_ONE |
    T_TWO |
    T_THREE |
    T_FOUR |
    T_FIVE |
    T_SIX |
    T_SEVEN
;

hexadecimal_literal:
    T_ZERO |
    T_ONE |
    T_TWO |
    T_THREE |
    T_FOUR |
    T_FIVE |
    T_SIX |
    T_SEVEN |
    T_EIGHT |
    T_NINE
;

integer_suffix: unsigned_suffix long_suffix |
                unsigned_suffix /* empty */ ;

unsigned_suffix: T_U_SUF;

long_suffix: T_L_SUF;

long_long_suffix: T_LL_SUF;

//class
class_name: ;

class_head_name: /* empty */              class_name |
                 nested_name_specifier    class_name ;

class_virt_specifier_seq: class_virt_specifier | class_virt_specifier_seq class_virt_specifier;

class_virt_specifier: T_FINAL { $$ = $1; } | T_EXPLICIT { $$ = $1; };

class_key: T_CLASS | T_UNION | T_STRUCT;

//expr.log.and
logical_and_expression: inclusive_or_expression | logical_and_expression T_W_AMPERSAND inclusive_or_expression

//expr.log.or
logical_or_expression: logical_and_expression | logical_or_expression T_W_VERTICAL_LINE logical_and_expression;

//expr.const
constant_expression: logical_or_expression | logical_or_expression T_QUESTION_MARK expression T_COLON assignment_expression;

//expr.prim.general
primary_expression:;
id_expression:;
unqualified_id:;
qualified_id:;
nested_name_specifier:;

//expr.cond
conditional_expression: logical_or_expression | logical_or_expression T_QUESTION_MARK expression T_COLON assignment_expression;

//expr.ass
assignment_expression:
conditional_expression |
logical_or_expression assignment_operator initializer_clause |
throw_expression;

assignment_operator:
T_EQ |
T_STAR T_EQ |
T_SLASH T_EQ |
T_PERCENT T_EQ |
T_PLUS T_EQ |
T_MINUS T_EQ |
T_W_LESS T_EQ |
T_W_GREAT T_EQ |
T_AMPERSAND T_EQ |
T_UP_ARROW T_EQ |
T_VERTICAL_LINE T_EQ;

//expr.comma
expression:
assignment_expression |
expression T_COMMA assignment_expression;

//stmt.select
selection_statement:
T_IF T_OPEN_ROUND_BRACKET condition T_CLOSE_ROUND_BRACKET statement |
T_IF T_OPEN_ROUND_BRACKET condition T_CLOSE_ROUND_BRACKET statement T_ELSE statement |
T_SWITCH T_OPEN_ROUND_BRACKET condition T_CLOSE_ROUND_BRACKET statement ;

condition:
expression |
attribute_specifier_seq decl_specifier_seq declarator T_EQ initializer_clause |
/* empty */             decl_specifier_seq declarator T_EQ initializer_clause
attribute_specifier_seq decl_specifier_seq declarator braced_init_list |
/* empty */             decl_specifier_seq declarator braced_init_list ;

//temp.names
simple_template_id:
    template_name T_LESS template_argument_listopt T_GREAT
;

template_id:
    simple_template_id |
    operator_function_id T_LESS template_argument_listopt T_GREAT |
    literal_operator_id T_LESS template_argument_listopt T_GREAT
;

template_name:
    identifier
;

template_argument_list:
	template_argument T_THREE_DOT_opt |
	template_argument_list T_COMMA template_argument T_THREE_DOT_opt
;

template_argument:
    constant_expression |
    type_id |
    id_expression
;

//temp.res +
typename_specifier:
    T_TEMPLATE T_W_COLON_opt nested_name_specifier identifier |
    T_TEMPLATE T_W_COLON_opt nested_name_specifier T_TEMPLATE_opt simple_template_id
;

//temp.explicit +
explicit_instantiation:
    T_EXTERN_opt T_TEMPLATE declaration
;

//temp.expl.spec +
explicit_specialization:
    T_TEMPLATE T_LESS T_GREAT declaration
;

//except +
try_block: T_TRY compound_statement handler_seq;

function_try_block:
    T_TRY ctor_initializer_opt compound_statement handler_seq
;

handler_seq:
    handler |
    handler handler_seq
;

handler:
    T_CATCH T_OPEN_ROUND_BRACKET exception_declaration T_CLOSE_ROUND_BRACKET compound_statement
;

exception_declaration:
    attribute_specifier_seq_opt type_specifier_seq declarator |
    attribute_specifier_seq_opt type_specifier_seq abstract_declarator_opt |
    T_THREE_DOT
;

throw_expression:
    T_THROW assignment_expression_opt
;

//except.spec +
exception_specification:
    dynamic_exception_specification |
    noexcept_specification
;

dynamic_exception_specification:
    T_THROW T_OPEN_ROUND_BRACKET type_id_list_opt T_CLOSE_ROUND_BRACKET
;

type_id_list:
    type_id T_THREE_DOT_opt |
    type_id_list T_COMMA type_id T_THREE_DOT_opt
;

noexcept_specification:
    T_NOEXCEPT T_OPEN_ROUND_BRACKET constant_expression T_CLOSE_ROUND_BRACKET |
    T_NOEXCEPT
;

%%

int main()
{
    return yyparse();
}