//http://www.nongnu.org/hcb/#string-literal

%{

#include <stdio.h>

#define YYSTYPE char*

#ifdef YYDEBUG
  yydebug = 1;
#endif

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
%token T_OPEN_SQUARE_BRACKET T_CLOSE_SQUARE_BRACKET
%token T_ALIGNAS T_FRIEND T_TYPEDEF T_CONSTEXPR T_BREAK T_CONTINUE T_RETURN T_GOTO T_VIRTUAL T_INLINE
%token T_UNDERSCORE T_LETTER
%token T_SLASH_U_SUFF
%token T_SLASH_UP_CASE_U_SUFF T_THIS
%start input

%%

//missed
alignment_expression:;

//optional
T_COMMA_opt: T_COMMA | /* empty */;

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

attribute_opt: attribute | /* empty */;

attribute_argument_clause_opt: attribute_argument_clause | /* empty */;

attribute_specifier_seq_opt: attribute_specifier_seq | /* empty */;

expression_opt: expression | /* empty */;

decl_specifier_seq_opt: decl_specifier_seq | /* empty */;

braced_init_list_opt: braced_init_list | /* empty */;

init_declarator_list_opt: init_declarator_list | /* empty */;

decl_specifier_seq_opt: decl_specifier_seq | /* empty */;

template_argument_list_opt: template_argument_list | /* empty */;

attribute_specifier_seq_opt: attribute_specifier_seq | /* empty */;

abstract_declarator_opt: abstract_declarator | /* empty */;

member_specification_opt: member_specification | /* empty */;

//lex.charset +
hex_quad:
 	hexadecimal_digit hexadecimal_digit hexadecimal_digit hexadecimal_digit
;

universal_character_name:
    T_SLASH_U_SUFF hex_quad |
    T_SLASH_UP_CASE_U_SUFF hex_quad hex_quad
;

//lex.pptoken +
preprocessing-token:
    header_name
    identifier
    pp_number
    character_literal
    user_defined_character_literal
    string_literal
    user_defined-string_literal
    preprocessing_op_or_punc
    //TODO: each non-white-space character that cannot be one of the above
;

//lex.token +
token:
    identifier |
    keyword |
    literal |
    operator_token |
    punctuator
;

//lex.header +
header_name:
    T_LESS h_char_sequence T_GREAT |
    T_QUOTES q_char_sequence T_QUOTES
;

h_char_sequence:
    h_char |
    h_char_sequence h_char
;

h_char:
    //TODO: any member of the source character set except new-line and >
;

q_char_sequence:
    q_char |
    q_char_sequence q_char
;

q_char:
    //TODO: any member of the source character set except new-line and "
;

//lex.ppnumber +
pp_number:
 	digit |
 	T_DOT digit |
 	pp-number digit |
 	pp-number identifier-nondigit |
 	pp-number T_E sign |
 	pp-number T_UP_CASE_E sign |
 	pp-number T_DOT
;

//lex.name +
identifier:
    identifier_nondigit            |
    identifier identifier_nondigit |
    identifier digit
;

identifier_nondigit:
    nondigit
    //TODO: universal_character_name
;

nondigit:
    T_LETTER |
    T_UNDERSCORE
;

digit:
    T_ZERO  |
    T_ONE   |
    T_TWO   |
    T_THREE |
    T_FOUR  |
    T_FIVE  |
    T_SIX   |
    T_SEVEN |
    T_EIGHT |
    T_NINE
;

//lex.key
keyword:
    T_ALIGNAS |
    T_ALIGNOF |
    T_ASM |
    T_AUTO |
    T_BOOL |
    T_BREAK |
    T_CASE |
    T_CATCH |
    T_CHAR |
    T_CHAR16_T |
    T_CHAR32_T |
    T_CLASS |
    T_CONST |
    T_CONSTEXPR |
    T_CONST_CAST |
    T_CONTINUE |
    T_DECLTYPE |
    T_DEFAULT |
    T_DELETE |
    T_DO |
    T_DOUBLE |
    T_DYNAMIC_CAST |
    T_ELSE |
    T_ENUM |
    T_EXPLICIT |
    T_EXPORT |
    T_EXTERN |
    T_FALSE |
    T_FLOAT |
    T_FOR |
    T_FRIEND |
    T_GOTO |
    T_IF |
    T_INLINE |
    T_INT |
    T_LONG |
    T_MUTABLE |
    T_NAMESPACE |
    T_NEW |
    T_NOEXCEPT |
    T_NULLPTR |
    T_OPERATOR |
    T_PRIVATE |
    T_PROTECTED |
    T_PUBLIC |
    T_REGISTER |
    T_REINTERPRET_CAST |
    T_RETURN |
    T_SHORT |
    T_SIGNED |
    T_SIZEOF |
    T_STATIC |
    T_STATIC_ASSERT |
    T_STATIC_CAST |
    T_STRUCT |
    T_SWITCH |
    T_TEMPLATE |
    T_THIS |
    T_THREAD_LOCAL |
    T_THROW |
    T_TRUE |
    T_TRY |
    T_TYPEDEF |
    T_TYPEID |
    T_TYPENAME |
    T_UNION |
    T_UNSIGNED |
    T_USING |
    T_VIRTUAL |
    T_VOID |
    T_VOLATILE |
    T_WCHAR_T |
    T_WHILE
;

//lex.operators
operator_token:
    //TODO: Look at preprocessing-op-or-punc below
;
punctuator:
    //TODO: Look at preprocessing-op-or-punc below
;

preprocessing_op_or_punc:
    T_OPEN_BRACES |
    T_CLOSE_BRACES |
    T_OPEN_SQUARE_BRACKET |
    T_CLOSE_SQUARE_BRACKET |
    //TODO: #
    //TODO: ##
    T_OPEN_ROUND_BRACKET |
    T_CLOSE_ROUND_BRACKET |
    //TODO: also
;

//lex.literal.kinds
literal:
    integer_literal
    character_literal
    floating_literal
    string_literal
    boolean_literal
    pointer_literal
    user_defined_literal
;

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

hexadecimal_digit:
     T_ZERO |
     T_ONE |
     T_TWO |
     T_THREE |
     T_FOUR |
     T_FIVE |
     T_SIX |
     T_SEVEN //TODO: add letters
;

integer_suffix: unsigned_suffix long_suffix |
                unsigned_suffix /* empty */ ;

unsigned_suffix: T_U_SUF;

long_suffix: T_L_SUF;

long_long_suffix: T_LL_SUF;

//lex.ccon
character-literal:;
c-char-sequence:;
c-char:;
escape-sequence:;
simple-escape-sequence:;
octal-escape-sequence:;
hexadecimal-escape-sequence:;

//lex.fcon
floating-literal:;
fractional-constant:;
exponent-part:;
sign:;
digit-sequence:;
floating-suffix:;

//lex.string
string_literal:;
encoding-prefix:;
s-char-sequence:;
s-char:;
raw-string:;
r-char-sequence:;
r-char:;
d-char-sequence:;
d-char:;

//lex.bool
boolean_literal:
    T_TRUE |
    T_FALSE
;

//lex.nullptr
pointer_literal:
    T_NULLPTR
;

//lex.ext
user-defined-literal:;
user-defined-integer-literal:;
user-defined-floating-literal:;
user-defined-string-literal:;
user-defined-character-literal:;
ud-suffix:;

//basic.link
translation-unit:
    declaration-seqopt
;

//expr.prim.general
primary_expression:;
id_expression:;
unqualified_id:;
qualified_id:;
nested_name_specifier:;

//expr.prim.lambda
lambda-expression:;
lambda-introducer:;
lambda-capture:;
capture-default:;
capture-list:;
capture:;
lambda-declarator:;

//expr.post
expression_list:;

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
and_expression:;

//expr.xor +
exclusive_or_expression:
 	and_expression |
 	exclusive_or_expression T_UP_ARROW and_expression
;

//expr.or
inclusive_or_expression:
    exclusive_or_expression |
    inclusive_or_expression T_VERTICAL_LINE exclusive_or_expression
;

//expr.log.and
logical_and_expression:
    inclusive_or_expression |
    logical_and_expression T_W_AMPERSAND inclusive_or_expression
;

//expr.log.or
logical_or_expression:
    logical_and_expression |
    logical_or_expression T_W_VERTICAL_LINE logical_and_expression
;

//expr.cond
conditional_expression:
    logical_or_expression |
    logical_or_expression T_QUESTION_MARK expression T_COLON assignment_expression
;

//expr.ass
assignment_expression:
    conditional_expression |
    logical_or_expression assignment_operator initializer_clause |
    throw_expression
;

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
    T_VERTICAL_LINE T_EQ
;

//expr.comma
expression:
    assignment_expression |
    expression T_COMMA assignment_expression
;

//expr.const
constant_expression:
    conditional_expression
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

//stmt.label
labeled_statement:
    attribute_specifier_seq identifier T_COLON statement |
    attribute_specifier_seq T_CASE constant_expression T_COLON statement |
    attribute_specifier_seq T_DEFAULT T_COLON statement
;

//stmt.expr
expression_statement:
;

//stmt.block +
compound_statement:
    T_OPEN_BRACES statement_seq_opt T_CLOSE_BRACES
;

statement_seq:
    statement |
    statement_seq statement
;

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

//stmt.iter
iteration_statement:
;

//stmt.jump +
jump_statement:
 	T_BREAK T_SEMICOLON
 	T_CONTINUE T_SEMICOLON
 	T_RETURN expression_opt T_SEMICOLON
 	T_RETURN braced_init_list_opt T_SEMICOLON
 	T_GOTO identifier T_SEMICOLON
;

//stmt.dcl
declaration_statement:;

//dcl.dcl +
declaration_seq:
    declaration |
    declaration_seq declaration
;

declaration:
	block_declaration |
    function_definition |
    template_declaration |
    explicit_instantiation |
    explicit_specialization |
    linkage_specification |
    namespace_definition |
    empty_declaration |
    attribute_declaration |
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
    T_USING identifier T_EQ type_id T_SEMICOLON
;

simple_declaration:
    attribute_specifier_seq_opt decl_specifier_seq_opt init_declarator_list_opt
;

static_assert_declaration:
    T_STATIC_ASSERT T_OPEN_ROUND_BRACKET constant_expression T_COMMA T_CLOSE_ROUND_BRACKET T_SEMICOLON
;

empty_declaration:
    T_SEMICOLON
;

attribute_declaration:
    attribute_specifier_seq T_SEMICOLON
;

//dcl.spec +
decl_specifier:
    storage_class_specifier |
    type_specifier |
    function_specifier |
    T_FRIEND |
    T_TYPEDEF |
    T_CONSTEXPR
;

decl_specifier_seq:
    decl_specifier attribute_specifier_seq_opt |
    decl_specifier decl_specifier_seq
;

//dcl.stc
storage_class_specifier:
    T_AUTO         |
    T_REGISTER     |
    T_STATIC       |
    T_THREAD_LOCAL |
    T_EXTERN       |
    T_MUTABLE
;

//dcl.fct.spec +
function_specifier:
    T_INLINE |
    T_VIRTUAL |
    T_EXPLICIT
;

//dcl.typedef

//dcl.type
type_specifier:
    trailing_type_specifier
    class_specifier
    enum_specifier
;

trailing_type_specifier:
;

type_specifier_seq:
    type_specifier attribute_specifier_seq_opt
    type_specifier type_specifier_seq
;

trailing_type_specifier_seq:
;

//dct.type.simple

//dcl.type.elab

//dcl.enum
enum_name:
    identifier
;

enum_specifier:
;

opaque_enum_declaration:
;

//namespace.def
namespace_definition:
;

//namespace.alias
namespace_alias:
;

namespace_alias_definition:
;

qualified_namespace_specifier:
;

//namespace.udecl
using_declaration:
;

//namespace.udir
using_directive:
;

//dcl.asm +
asm_definition:
    T_ASM T_OPEN_ROUND_BRACKET string_literal T_CLOSE_ROUND_BRACKET T_SEMICOLON
;

//dcl.link
linkage_specification:
;

//dcl.attr.grammar
attribute_specifier_seq:
    attribute_specifier |
    attribute_specifier_seq attribute_specifier
;

attribute_specifier:
    T_OPEN_SQUARE_BRACKET T_OPEN_SQUARE_BRACKET attribute_list T_CLOSE_SQUARE_BRACKET T_CLOSE_SQUARE_BRACKET |
    alignment_specifier
;

alignment_specifier:
    T_ALIGNAS T_OPEN_ROUND_BRACKET type_id T_THREE_DOT_opt T_CLOSE_ROUND_BRACKET |
    T_ALIGNAS T_OPEN_ROUND_BRACKET alignment_expression  T_THREE_DOT_opt T_CLOSE_ROUND_BRACKET
;

attribute_list:
    attribute_opt |
    attribute_list T_COMMA attribute_opt |
    attribute T_THREE_DOT |
    attribute_list T_COMMA attribute T_THREE_DOT
;

attribute:
    attribute_token attribute_argument_clause_opt
;

attribute_token:
    identifier
    attribute_scoped_token
;

attribute_scoped_token:
    attribute_namespace T_W_COLON identifier
;

attribute_namespace:
    identifier
;

attribute_argument_clause:
    T_OPEN_ROUND_BRACKET balanced_token_seq T_CLOSE_ROUND_BRACKET
;

balanced_token_seq:
    balanced_token |
    balanced_token_seq balanced_token
;

balanced_token:
    T_OPEN_ROUND_BRACKET balanced_token_seq T_CLOSE_ROUND_BRACKET |
    T_OPEN_SQUARE_BRACKET balanced_token_seq T_CLOSE_SQUARE_BRACKET |
    T_OPEN_BRACES balanced_token_seq T_CLOSE_BRACES |
    token     //C++0x - except a parenthesis, a bracket, or a brace
;

//dcl.decl
init_declarator_list:
;

init_declarator:
;

declarator:
;

ptr_declarator:
;

noptr_declarator:
;

parameters_and_qualifiers:
;

trailing_return_type:
;

ptr_operator:
;

cv_qualifier_seq:
    cv_qualifier |
    cv_qualifier cv_qualifier_seq
;

cv_qualifier:
    T_CONST |
    T_VOLATILE
;

ref_qualifier:
    T_AMPERSAND |
    T_W_AMPERSAND
;

declarator_id:
    T_THREE_DOT |
    T_W_COLON
;

//dcl.name
type_id:
    type_specifier_seq abstract_declarator_opt
;

abstract_declarator:
;

ptr_abstract_declarator:
;

nonptr_abstract_declarator:
;

//dcl.fct

//dcl.fct.def.general
function_definition:
     attribute_specifier_seq_opt decl_specifier_seq_opt declarator function_body |
     attribute_specifier_seq_opt decl_specifier_seq_opt declarator T_EQ T_DEFAULT T_SEMICOLON |
     attribute_specifier_seq_opt decl_specifier_seq_opt declarator T_EQ T_DEFAULT T_SEMICOLON
;

function_body:
    ctor_initializer compound_statement |
    function_try_block
;

//dcl.init +
initializer:
    brace_or_equal_initializer |
    T_OPEN_ROUND_BRACKET expression_list T_CLOSE_ROUND_BRACKET
;

brace_or_equal_initializer:
    T_EQ initializer_clause |
    braced_init_list
;

initializer_clause:
    assignment_expression |
    braced_init_list
;

initializer_list:
    initializer_clause T_THREE_DOT_opt
    initializer_list T_COMMA initializer_clause T_THREE_DOT_opt
;

braced_init_list:
    T_OPEN_BRACES initializer_list T_COMMA_opt T_CLOSE_BRACES |
    T_OPEN_BRACES T_CLOSE_BRACES
;

//class
class_name:
;

class_specifier:
    class_head T_OPEN_BRACES member_specification_opt T_CLOSE_BRACES
;

class_head:
;

class_head_name: /* empty */              class_name |
                 nested_name_specifier    class_name ;

class_virt_specifier_seq: class_virt_specifier | class_virt_specifier_seq class_virt_specifier;

class_virt_specifier: T_FINAL { $$ = $1; } | T_EXPLICIT { $$ = $1; };

class_key: T_CLASS | T_UNION | T_STRUCT;

//class.mem
member_specification:;

//class.derived

//class.conv.fct

//class.base.init
ctor_initializer:
;

//over.oper
operator_function_id:
;

overloadable_operator:
;

//over.literal
literal_operator_id:
;

//temp
template_declaration:
;

//temp.param

//temp.names
simple_template_id:
    template_name T_LESS template_argument_list_opt T_GREAT
;

template_id:
    simple_template_id |
    operator_function_id T_LESS template_argument_list_opt T_GREAT |
    literal_operator_id T_LESS template_argument_list_opt T_GREAT
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

//cpp

/////////////
input:
    universal_character_name |
    input universal_character_name
;

%%

int main()
{
    return yyparse();
}