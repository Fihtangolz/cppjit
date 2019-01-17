#ifndef FROSTMOURNE_AST_HPP
#define FROSTMOURNE_AST_HPP

#include <string>
#include <memory>

#include <boost/variant.hpp>

#include "scope.hpp"

class scope_t;

namespace ast {

struct pointer_t;
struct func_signature_t;
struct type_t;
struct binary_op_t;
struct unary_op_t;
struct ternary_op_t;

enum class fd_types {
   _bool,
   _int,
   _float,
   _double,
   _char
};

enum class jump_t {
    break_stm,
    continue_stm,
    return_stm,
    goto_stm
};

using types_t = boost::variant<
    type_t*,
    fd_types,
    func_signature_t*
>;

using identifier_t = std::string;

struct declaration_t {
    identifier_t type;
    identifier_t name;
};

//TODO: Needed memory optimization, now we haw summ top wich have lagest size for all type 
using literal_t = boost::variant< 
    int
    //char,
    //float,
    //char*,
    //bool,
>;

using expression_t = boost::variant<
    binary_op_t*,
    unary_op_t*,
    ternary_op_t*,
    literal_t*,
    identifier_t*
>;

using statement_t = boost::variant<
    expression_t,
    // compound_t,
    // selection_t,
    // iteration_t,
    jump_t,
    declaration_t
    //try_block_t,
    // atomic_and_synchronized_blocks_t,
>;

using statements_t = std::vector<statement_t>;

struct pointer_t {

};

struct type_t {
    std::string name;
    std::map<std::string, type_t> variable;
    //std::map<func_t> member_func;
};

struct func_signature_t {
    types_t ret;
    using arg_t = std::pair<types_t, std::string>;
    std::vector<arg_t> args;
}; 

struct func_body_t {
        scope_t* scope;
        std::vector<statement_t> statements;
};

struct func_t {
    identifier_t name;
    func_signature_t* signature;
    func_body_t body;
};

struct lambda_func_t {
    func_signature_t* signature;
    func_body_t body;
};

struct asm_stm_t {
    std::string listing;
};

enum class iteration_t {
    while_stm,
    do_while_stm,
    for_stm,
    for_range_stm
};

namespace operators {

enum class all_t {
//assign   
    assign_basic,       // a = b
    assign_add,         // a += b
    assign_sub,         // a -= b
    assign_mul,         // a *= b
    assign_div,         // a /= b
    assign_mod,         // a %= b
    assign_and,         // a &= b
    assign_or,          // a |= b
    assign_xor,         // a ^= b
    assign_left_shift,  // a <<= b
    assign_right_shift, // a >>= b
//cmp
    cmp_eq,          // a == b
    cmp_not_eq,      // a != b
    cmp_less,        // a < b
    cmp_grt,         // a > b
    cmp_less_or_eq,  // a <= b
    cmp_grt_or_eq,   // a >= b
    cmp_twc,         // a <=> b
//logical 
    logical_not,       // !a
    logical_and,       //  a && b 
    logical_or,        //  a || b
//bitwise 
    bitwise_not,         // ~a 
    bitwise_and,         // a & b 
    bitwise_or,          // a | b
    bitwise_xor,         // a ^ b
    bitwise_left_shift,   // a >> b
    bitwise_right_shift,  // a << b
//inc_dec 
    inc_dec_pre_inc,     // ++a
    inc_dec_post_inc,    // a++
    inc_dec_pre_dec,     // --a
    inc_dec_post_dec,    // a--
//arithmetic 
    arithmetic_un_plus,     // +a
    arithmetic_un_minus,    // -a
    arithmetic_add,         // a + b
    arithmetic_sub,         // a - b
    arithmetic_mul,         // a * b
    arithmetic_div,         // a / b
    arithmetic_mod,         // a % b
//member_access 
    subscript,            // a[b]
    indirection,          // *a
    address_of,           // &a
    member_of_obj,        // a.b
    member_of_ptr,        // a->b
    ptr_to_member_of_obj, // a.*b
    ptr_to_member_of_ptr,  // a->*b
//other 
    call,   // a(...)
    comma,  // a, b
    ternary, // a ? b : c
//special 
    special_static_cast,
    special_dynamic_cast,
    special_const_cast,
    special_reinterpret_cast,
    special_с_style_cast,
    special_new,
    special_delete,
    special_sizeof,
    special_sizeof_pp,
    special_typeid,
    special_noexcept,
    special_alignof
};

enum class binary_t {
    //assign 
    assign_basic,       // a = b
    assign_add,         // a += b
    assign_sub,         // a -= b
    assign_mul,         // a *= b
    assign_div,         // a /= b
    assign_mod,         // a %= b
    assign_and,         // a &= b
    assign_or,          // a |= b
    assign_xor,         // a ^= b
    assign_left_shift,  // a <<= b
    assign_right_shift, // a >>= b 
    //cmp
    cmp_eq,          // a == b
    cmp_not_eq,      // a != b
    cmp_less,        // a < b
    cmp_grt,         // a > b
    cmp_less_or_eq,  // a <= b
    cmp_grt_or_eq,   // a >= b
    cmp_twc,         // a <=> b
    //logical 
    logical_and,       //  a && b 
    logical_or,        //  a || b
    //bitwise 
    bitwise_and,         // a & b 
    bitwise_or,          // a | b
    bitwise_xor,         // a ^ b
    bitwise_left_shift,   // a >> b
    bitwise_right_shift,  // a << b
    //arithmetic 
    arithmetic_un_plus,     // +a
    arithmetic_un_minus,    // -a
    arithmetic_add,         // a + b
    arithmetic_sub,         // a - b
    arithmetic_mul,         // a * b
    arithmetic_div,         // a / b
    arithmetic_mod,         // a % b
};

enum class unary_t {
    //logical 
    logical_not,       // !a
    //bitwise 
    bitwise_not,         // ~a 
    //inc_dec 
    inc_dec_pre_inc,     // ++a
    inc_dec_post_inc,    // a++
    inc_dec_pre_dec,     // --a
    inc_dec_post_dec,    // a--
    //arithmetic 
    arithmetic_un_plus,     // +a
    arithmetic_un_minus,    // -a
};

} //OPERATORS NAMESPACE

struct binary_op_t {
    operators::binary_t type;
    expression_t lhs, rhs;
};

struct unary_op_t {
    operators::unary_t type;
    expression_t rhs;
};

struct ternary_op_t {
    expression_t prdc, lhs, rhs;
};

struct for_t {
    //TODO: predicate, initilize, evalute 
    func_body_t body;
};

} //AST NAMESPACE 

#endif //FROSTMOURNE_AST_HPP