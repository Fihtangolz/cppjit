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
%token T_ALIGNOF T_BOOL T_CHAR T_CHAR16_T T_CHAR32_T T_DECLTYPE T_DELETE T_DO T_DOT T_DOUBLE T_E T_EXPORT T_FLOAT T_FOR T_INT T_LONG
%token T_NAMESPACE T_OPERATOR T_QUOTES T_SHORT T_SIGNED T_SIZEOF T_TYPENAME T_UNSIGNED T_UP_CASE_E
%token T_VOID T_WCHAR_T T_WHILE T_ARROW T_ARROW_STAR T_DEFINE
%token T_DOT_STAR T_ELIF T_ENDIF T_ERROR T_EXCLAMATION_MARK T_GREAT_EQ T_EXCLAMATION_MARK_EQ T_IFDEF
%token T_IFNDEF T_INCLUDE T_LATTICE_MARK T_LESS_EQ T_LINE T_OVERRIDE
%token T_NEW_LINE T_PRAGMA T_UNDEF T_WAVY_LINE T_W_EQ T_W_MINUS T_W_PLUS


%token T_UP_CASE_A T_A
%token T_UP_CASE_B T_B
%token T_UP_CASE_C T_C
%token T_UP_CASE_D T_D
%token T_UP_CASE_E T_E
%token T_UP_CASE_F T_F
%token T_UP_CASE_G T_G
%token T_UP_CASE_H T_H
%token T_UP_CASE_I T_I
%token T_UP_CASE_J T_J
%token T_UP_CASE_K T_K
%token T_UP_CASE_L T_L
%token T_UP_CASE_M T_M
%token T_UP_CASE_N T_N
%token T_UP_CASE_O T_O
%token T_UP_CASE_P T_P
%token T_UP_CASE_Q T_Q
%token T_UP_CASE_R T_R
%token T_UP_CASE_S T_S
%token T_UP_CASE_T T_T
%token T_UP_CASE_V T_V
%token T_UP_CASE_W T_W
%token T_UP_CASE_X T_X
%token T_UP_CASE_Y T_Y
%token T_UP_CASE_Z T_Z

%start lambda_expression

%%

//missed
alignment_expression:;

//optional
T_TYPENAME_opt: T_TYPENAME | /* empty */;
base_clause_opt: base_clause | /* empty */;
class_virt_specifier_seq_opt: class_virt_specifier_seq | /* empty */;
condition_opt: condition | /* empty */;
elif_groups_opt: elif_groups | /* empty */;
else_group_opt: else_group | /* empty */;
expression_list_opt: expression_list | /* empty */;
group_opt: group | /* empty */;
identifier_list_opt: identifier_list | /* empty */;
long_long_suffix_opt: long_long_suffix | /* empty */;
long_suffix_opt: long_suffix | /* empty */;
T_MUTABLE_opt: T_MUTABLE | /* empty */;
nested_name_specifier_opt: nested_name_specifier  | /* empty */;
new_declarator_opt: new_declarator | /* empty */;
new_initializer_opt: new_initializer | /* empty */;
new_placement_opt: new_placement | /* empty */;
pp_tokens_opt: pp_tokens | /* empty */; 
unsigned_suffix_opt: unsigned_suffix | /* empty */;
T_W_COLON_opt: T_W_COLON | /* empty */;
T_COMMA_opt: T_COMMA | /* empty */;
T_THREE_DOT_opt: T_THREE_DOT | /* empty */;
type_id_list_opt: type_id_list | /* empty */;
assignment_expression_opt: assignment_expression | /* empty */;
abstract_declarator_opt: abstract_declarator_opt | /* empty */;
ctor_initializer_opt: ctor_initializer | /* empty */;
T_EXTERN_opt: T_EXTERN | /* empty */;
T_W_COLON_opt: T_W_COLON | /* empty */;
T_TEMPLATE_opt: T_TEMPLATE | /* empty */;
declaration_seq_opt: declaration_seq | /* empty */;
statement_seq_opt: statement_seq | /* empty */;
attribute_opt: attribute | /* empty */;
attribute_argument_clause_opt: attribute_argument_clause | /* empty */;
expression_opt: expression | /* empty */;
decl_specifier_seq_opt: decl_specifier_seq | /* empty */;
braced_init_list_opt: braced_init_list | /* empty */;
init_declarator_list_opt: init_declarator_list | /* empty */;
decl_specifier_seq_opt: decl_specifier_seq | /* empty */;
template_argument_list_opt: template_argument_list | /* empty */;
attribute_specifier_seq_opt: attribute_specifier_seq | /* empty */;
abstract_declarator_opt: abstract_declarator | /* empty */;
member_specification_opt: member_specification | /* empty */;
lambda_declarator_opt: lambda_declarator | /* empty */;
lambda_capture_opt: lambda_capture | /* empty */;
exception_specification_opt: exception_specification | /* empty */;
trailing_return_type_opt: trailing_return_type | /* empty */;
encoding_prefix_opt: encoding_prefix | /* empty */;
s_char_sequence_opt: s_char_sequence | /* empty */;

//lex.charset 
hex_quad:
 	hexadecimal_digit hexadecimal_digit hexadecimal_digit hexadecimal_digit
;

universal_character_name:
    T_SLASH_U_SUFF hex_quad |
    T_SLASH_UP_CASE_U_SUFF hex_quad hex_quad
;

//lex.pptoken +
preprocessing_token:
    header_name
    identifier
    pp_number
    character_literal
    user_defined_character_literal
    string_literal
    user_defined_string_literal
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
    //TODO: any member of the source character set except new-line and T_QUOTES
;

//lex.ppnumber +
pp_number:
 	digit |
 	T_DOT digit |
 	pp_number digit |
 	pp_number identifier_nondigit |
 	pp_number T_E sign |
 	pp_number T_UP_CASE_E sign |
 	pp_number T_DOT
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
    T_UP_CASE_A |
	T_A |
	T_UP_CASE_B |
	T_B |
	T_UP_CASE_C |
	T_C |
	T_UP_CASE_D |
	T_D |
	T_UP_CASE_E |
	T_E |
	T_UP_CASE_F |
	T_F |
	T_UP_CASE_G |
	T_G |
	T_UP_CASE_H |
	T_H |
	T_UP_CASE_I |
	T_I |
	T_UP_CASE_J |
	T_J |
	T_UP_CASE_K |
	T_K |
	T_UP_CASE_L |
	T_L |
	T_UP_CASE_M |
	T_M |
	T_UP_CASE_N |
	T_N |
	T_UP_CASE_O |
	T_O |
	T_UP_CASE_P |
	T_P |
	T_UP_CASE_Q |
	T_Q |
	T_UP_CASE_R |
	T_R |
	T_UP_CASE_S |
	T_S |
	T_UP_CASE_T |
	T_T |
	T_UP_CASE_V |
	T_V |
	T_UP_CASE_W |
	T_W |
	T_UP_CASE_X |
	T_X |
	T_UP_CASE_Y |
	T_Y |
	T_UP_CASE_Z |
	T_Z |
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
    T_ZERO  |
    T_ONE   |
    T_TWO   |
    T_THREE |
    T_FOUR  |
    T_FIVE  |
    T_SIX   |
    T_SEVEN //TODO: add letters
;

integer_suffix: 
	unsigned_suffix long_suffix_opt |
	unsigned_suffix long_long_suffix_opt |
	long_suffix unsigned_suffix_opt |
	long_long_suffix unsigned_suffix_opt 
;

unsigned_suffix:
    T_U_SUF
;

long_suffix:
    T_L_SUF
;

long_long_suffix:
    T_LL_SUF
;

//lex.ccon
character_literal:;
c_char_sequence:;
c_char:;
escape_sequence:;
simple_escape_sequence:;
octal_escape_sequence:;
hexadecimal_escape_sequence:;

//lex.fcon
floating_literal:;
fractional_constant:;
exponent_part:;
sign:;
digit_sequence:;
floating_suffix:;

//lex.string
string_literal:
    encoding_prefix_opt T_QUOTES s_char_sequence_opt T_QUOTES 
	encoding_prefix_opt T_UP_CASE_R raw_string
;

encoding_prefix:

;

s_char_sequence:
	s_char |
	s_char_sequence s_char
;

s_char:
	//any member of the source character set except the double-quote , backslash, or new-line character
;

raw_string:
;

r_char_sequence:
;

r_char:
;

d_char_sequence:
;

d_char:
	
;

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
user_defined_literal:
;

user_defined_integer-literal:
;

user_defined_floating_literal:
;

user_defined_string_literal:
;

user_defined_character_literal:
;

ud-suffix:
;

//basic.link
translation_unit:
    declaration_seq_opt
;

//expr.prim.general
primary_expression:
;

id_expression:
;

unqualified_id:
;

qualified_id:
;

nested_name_specifier:
;

//expr.prim.lambda
lambda_expression:
    lambda_introducer lambda_declarator_opt compound_statement 
	{
		printf("lambda_expression\n");
	}
;

lambda_introducer:
    T_OPEN_SQUARE_BRACKET lambda_capture_opt T_CLOSE_SQUARE_BRACKET
;

lambda_capture:
    capture_default |
    capture_list    |
    capture_default T_COMMA capture_list
;

capture_default:
    T_AMPERSAND 
	{
		printf("захват по ссылке\n");
	} |
    T_EQ 
	{
		printf("захват по значению\n");
	}
;

capture_list:
    capture T_COMMA_opt |
    capture_list T_COMMA capture T_COMMA_opt
;

capture:
    identifier |
    T_AMPERSAND identifier |
    T_THIS
	{
		printf("захват this\n");
	}
;

lambda_declarator:
   T_OPEN_ROUND_BRACKET parameter_declaration_clause T_CLOSE_ROUND_BRACKET T_MUTABLE_opt exception_specification_opt attribute_specifier_seq_opt trailing_return_type_opt
   {
	   printf("lambda_declarator\n");
   }
;

//expr.post
postfix_expression:
    primary_expression |
    postfix_expression T_OPEN_SQUARE_BRACKET expression T_CLOSE_SQUARE_BRACKET |
    postfix_expression braced_init_list_opt T_CLOSE_SQUARE_BRACKET |
    postfix_expression T_OPEN_ROUND_BRACKET expression_list_opt T_CLOSE_ROUND_BRACKET |
    simple_type_specifier T_OPEN_ROUND_BRACKET expression_list_opt T_CLOSE_ROUND_BRACKET |
    typename_specifier T_OPEN_ROUND_BRACKET expression_list_opt T_CLOSE_ROUND_BRACKET |
    simple_type_specifier braced_init_list |
    typename_specifier braced_init_list |
    postfix_expression T_DOT T_TEMPLATE_opt id_expression |
    postfix_expression T_ARROW T_TEMPLATE_opt id_expression |
    postfix_expression T_DOT pseudo_destructor_name |
    postfix_expression T_ARROW pseudo_destructor_name |
    postfix_expression T_W_PLUS |
    postfix_expression T_W_MINUS |
    T_DYNAMIC_CAST T_LESS type_id T_GREAT T_OPEN_ROUND_BRACKET expression T_CLOSE_ROUND_BRACKET |
    T_STATIC_CAST T_LESS type_id T_GREAT T_OPEN_ROUND_BRACKET expression T_CLOSE_ROUND_BRACKET |
    T_REINTERPRET_CAST T_LESS type_id T_GREAT T_OPEN_ROUND_BRACKET expression T_CLOSE_ROUND_BRACKET |
    T_CONST_CAST T_LESS type_id T_GREAT T_OPEN_ROUND_BRACKET expression T_CLOSE_ROUND_BRACKET |
    T_TYPEID T_OPEN_ROUND_BRACKET expression T_CLOSE_ROUND_BRACKET |
    T_TYPEID T_OPEN_ROUND_BRACKET type_id T_CLOSE_ROUND_BRACKET
;

expression_list:
    initializer_list
;

pseudo_destructor_name:
    T_W_COLON_opt nested_name_specifier_opt type_name T_W_COLON_opt T_WAVY_LINE type_name |
    T_W_COLON_opt nested_name_specifier T_TEMPLATE simple_template_id T_W_COLON_opt T_WAVY_LINE type_name |
    T_W_COLON_opt nested_name_specifier_opt T_WAVY_LINE type_name |
    T_WAVY_LINE decltype_specifier
;

//expr.unary
unary_expression:
    postfix_expression |
    T_W_PLUS cast_expression |
    T_W_MINUS cast_expression |
    unary_operator cast_expression |
    T_SIZEOF unary_expression |
    T_SIZEOF T_OPEN_ROUND_BRACKET type_id T_CLOSE_ROUND_BRACKET |
    T_SIZEOF T_THREE_DOT T_OPEN_ROUND_BRACKET identifier T_CLOSE_ROUND_BRACKET |
    T_ALIGNOF T_OPEN_ROUND_BRACKET type_id T_CLOSE_ROUND_BRACKET |
    noexcept_expression |
    new_expression |
    delete_expression
;

unary_operator:
    T_STAR |
    T_AMPERSAND |
    T_PLUS |
    T_MINUS |
    T_EXCLAMATION_MARK |
    T_WAVY_LINE
;

//expr.new
new_expression:
    T_W_COLON_opt T_NEW new_placement_opt new_type_id new_initializer_opt |
    T_W_COLON_opt T_NEW new_placement_opt T_OPEN_ROUND_BRACKET type_id T_CLOSE_ROUND_BRACKET new_initializer_opt
;

new_placement:
    T_OPEN_ROUND_BRACKET expression_list T_CLOSE_ROUND_BRACKET
;

new_type_id:
    type_specifier_seq new_declarator_opt
;

new_declarator:
    ptr_operator new_declarator_opt |
    noptr_new_declarator
;

noptr_new_declarator:
    T_OPEN_SQUARE_BRACKET expression T_CLOSE_SQUARE_BRACKET attribute_specifier_seq_opt |
    noptr_new_declarator T_OPEN_SQUARE_BRACKET constant_expression T_CLOSE_SQUARE_BRACKET attribute_specifier_seq_opt
;

new_initializer:
    T_OPEN_ROUND_BRACKET expression_list_opt T_CLOSE_ROUND_BRACKET |
    braced_init_list
;

//expr.delete
delete_expression:
    T_W_COLON_opt T_DELETE cast_expression |
    T_W_COLON_opt T_DELETE T_OPEN_SQUARE_BRACKET T_CLOSE_SQUARE_BRACKET cast_expression
;

//expr.unary.noexcept
noexcept_expression:
    T_NOEXCEPT T_OPEN_ROUND_BRACKET expression T_CLOSE_ROUND_BRACKET
;

//expr.cast
cast_expression:
    unary_expression |
    T_OPEN_ROUND_BRACKET type_id T_CLOSE_ROUND_BRACKET cast_expression
;

//expr.mptr.oper
pm_expression:
    cast_expression |
    pm_expression T_DOT_STAR cast_expression |
    pm_expression T_ARROW_STAR cast_expression
;

//expr.mul
multiplicative_expression:
    pm_expression |
    multiplicative_expression T_STAR pm_expression |
    multiplicative_expression T_SLASH pm_expression |
    multiplicative_expression T_PERCENT pm_expression
;

//expr.add
additive_expression:
    multiplicative_expression |
    additive_expression T_PLUS multiplicative_expression |
    additive_expression T_MINUS multiplicative_expression
;

//expr.shift
shift_expression:
    additive_expression |
    shift_expression T_W_LESS additive_expression |
    shift_expression T_W_GREAT additive_expression
;

//expr.rel
relational_expression:
    shift_expression |
    relational_expression T_LESS shift_expression |
    relational_expression T_GREAT shift_expression |
    relational_expression T_LESS_EQ shift_expression |
    relational_expression T_GREAT_EQ shift_expression
;

//expr.eq
equality_expression:
    relational_expression |
    equality_expression T_W_EQ relational_expression |
    equality_expression T_EXCLAMATION_MARK_EQ relational_expression
;

//expr.bit.and
and_expression:
    equality_expression |
    and_expression T_AMPERSAND equality_expression
;

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
    expression_opt T_SEMICOLON
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
	T_SWITCH T_OPEN_ROUND_BRACKET condition T_CLOSE_ROUND_BRACKET statement 
;

condition:
	expression |
	attribute_specifier_seq_opt decl_specifier_seq declarator T_EQ initializer_clause |
	attribute_specifier_seq_opt decl_specifier_seq declarator braced_init_list 
;

//stmt.iter
iteration_statement:
 	T_WHILE T_OPEN_ROUND_BRACKET condition T_CLOSE_ROUND_BRACKET statement |
 	T_DO statement T_WHILE T_OPEN_ROUND_BRACKET expression T_CLOSE_ROUND_BRACKET T_SEMICOLON |
 	T_FOR T_OPEN_ROUND_BRACKET for_init_statement condition_opt T_SEMICOLON expression_opt T_CLOSE_ROUND_BRACKET statement |
 	T_FOR T_OPEN_ROUND_BRACKET for_range_declaration T_COLON for_range_initializer T_CLOSE_ROUND_BRACKET statement
;

for_init_statement:
    expression_statement |
    simple_declaration
;

for_range_declaration:
    attribute_specifier_seq_opt type_specifier_seq declarator
;

for_range_initializer:
    expression braced_init_list
;

//stmt.jump 
jump_statement:
 	T_BREAK T_SEMICOLON
 	T_CONTINUE T_SEMICOLON
 	T_RETURN expression_opt T_SEMICOLON
 	T_RETURN braced_init_list_opt T_SEMICOLON
 	T_GOTO identifier T_SEMICOLON
;

//stmt.dcl
declaration_statement:
    block_declaration
;

//dcl.dcl +
declaration_seq:
    declaration |
    declaration_seq declaration
;

declaration:
	block_declaration 
    //function_definition |
    //template_declaration |
    //explicit_instantiation |
    //explicit_specialization |
    //linkage_specification |
    //namespace_definition |
    //empty_declaration |
    //attribute_declaration |
;

block_declaration:
	//simple_declaration |
 	asm_definition |
 	//namespace_alias_definition |
 	using_declaration |
    //using_directive |
    //static_assert_declaration |
    //alias_declaration |
    //opaque_enum_declaration |
;

alias_declaration:
    T_USING identifier T_EQ type_id T_SEMICOLON
;

simple_declaration:
    attribute_specifier_seq_opt decl_specifier_seq_opt init_declarator_list_opt T_SEMICOLON
;

static_assert_declaration:
    T_STATIC_ASSERT T_OPEN_ROUND_BRACKET constant_expression T_COMMA string_literal T_CLOSE_ROUND_BRACKET T_SEMICOLON
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
typedef_name:
;

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
simple_type_specifier:

;

type_name:
;

decltype_specifier:
;

//dcl.type.elab
elaborated_type_specifier:
;

//dcl.enum
enum_name:
    identifier
;

enum_specifier:
;

enum_head:
;

opaque_enum_declaration:
;

enum-key:
;

enum_base:
;

enumerator_list:
;

enumerator_definition:
;

enumerator:
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
	T_USING T_TYPENAME_opt T_W_COLON_opt nested_name_specifier unqualified_id T_SEMICOLON |
	T_USING T_W_COLON unqualified_id T_SEMICOLON
;

//namespace.udir
using_directive:
;

//dcl.asm
asm_definition:
    T_ASM T_OPEN_ROUND_BRACKET string_literal T_CLOSE_ROUND_BRACKET T_SEMICOLON 
	{
		printf(" $$: %s $3: %s\n", $$, $3);
	}
;

//dcl.link
linkage_specification:
	T_EXTERN string_literal T_OPEN_BRACES declaration_seq_opt T_CLOSE_BRACES |
	T_EXTERN string_literal declaration
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
parameter_declaration_clause:
;

parameter_declaration_list:
;

parameter_declaration:
;

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
	identifier |
	simple_template_id 
;

class_specifier:
    class_head T_OPEN_BRACES member_specification_opt T_CLOSE_BRACES
;

class_head:
	class_key attribute_specifier_seq_opt class_head_name class_virt_specifier_seq_opt base_clause_opt |
	class_key attribute_specifier_seq_opt base_clause_opt
;

class_head_name: 
	nested_name_specifier_opt class_name
;

class_virt_specifier_seq: 
	class_virt_specifier | 
	class_virt_specifier_seq class_virt_specifier
;

class_virt_specifier: 
	T_FINAL | 
	T_EXPLICIT
;

class_key: 
	T_CLASS | 
	T_UNION | 
	T_STRUCT
;

//class.mem
member_specification:;

member_declaration:
;

member_declarator_list:
;

member_declarator:
;

virt_specifier:
;

pure_specifier:
;

//class.derived
base_clause:
;

base_specifier_list:
;

base_specifier:
;

class_or_decltype:
;

base_type_specifier:
;

access-specifier:
;

//class.conv.fct
conversion_function_id:
;

conversion_type_id:
;

conversion_declarator:
;

//class.base.init
ctor_initializer:
;

mem_initializer_list:
;

mem_initializer:
;

mem_initializer_id:
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

template_parameter_list:
;

//temp.param
template_parameter:
;

type_parameter:

;

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

//temp.res 
typename_specifier:
    T_TEMPLATE T_W_COLON_opt nested_name_specifier identifier |
    T_TEMPLATE T_W_COLON_opt nested_name_specifier T_TEMPLATE_opt simple_template_id
;

//temp.explicit 
explicit_instantiation:
    T_EXTERN_opt T_TEMPLATE declaration
;

//temp.expl.spec 
explicit_specialization:
    T_TEMPLATE T_LESS T_GREAT declaration
;

//except 
try_block:
    T_TRY compound_statement handler_seq
;

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

//except.spec 
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
preprocessing_file:
    group_opt
;

group:
    group_part |
    group group_part
;

group_part:
    if_section |
    control_line |
    text_line |
    T_LATTICE_MARK non_directive
;

if_section:
 	if_group elif_groups_opt else_group_opt endif_line
;

if_group:
    T_LATTICE_MARK T_IF constant_expression new_line group_opt |
    T_LATTICE_MARK T_IFDEF identifier new_line group_opt |
    T_LATTICE_MARK T_IFNDEF identifier new_line group_opt
;

elif_groups:
    elif_group |
    elif_groups elif_group
;

elif_group:
    T_LATTICE_MARK T_ELIF constant_expression new_line group_opt
;

else_group:
    T_LATTICE_MARK T_ELSE new_line group_opt
;

endif_line:
    T_LATTICE_MARK T_ENDIF new_line
;

control_line:
    T_LATTICE_MARK T_INCLUDE pp_tokens new_line
    T_LATTICE_MARK T_DEFINE identifier replacement_list new_line
    T_LATTICE_MARK T_DEFINE identifier lparen identifier_list_opt T_CLOSE_ROUND_BRACKET replacement_list new_line
    T_LATTICE_MARK T_DEFINE identifier lparen identifier_list T_COMMA T_THREE_DOT T_CLOSE_ROUND_BRACKET replacement_list new_line
    T_LATTICE_MARK T_UNDEF identifier new_line
    T_LATTICE_MARK T_LINE pp_tokens new_line
    T_LATTICE_MARK T_ERROR pp_tokens_opt new_line
    T_LATTICE_MARK T_PRAGMA pp_tokens_opt new_line
    T_LATTICE_MARK new_line
;

text_line:
    pp_tokens_opt new_line
;

non_directive:
    pp_tokens new_line
;

lparen:
    //TODO: a ( character not immediately preceded by white-space
;

identifier_list:
    identifier |
    identifier_list T_DOT identifier
;

replacement_list:
    pp_tokens_opt
;

pp_tokens:
    preprocessing_token |
    pp_tokens preprocessing_token
;

new_line:
    T_NEW_LINE
;

%%

int main(){
    return yyparse();
}