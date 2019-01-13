#ifndef FROSTMOURNE_AST_HPP
#define FROSTMOURNE_AST_HPP

#include <string>

#include <boost/variant.hpp>
#include <boost/variant.hpp>

#include "scope.hpp"

class scope_t;

namespace ast {

class base_ast_node_t {
};

struct pointer_t;
struct func_signature_t;
struct type_t;
enum class fd_types;

template<typename ...Args>
class ast_variant: boost::variant<Args...>, base_ast_node_t {};

using types_t = boost::variant<
    type_t*,
    fd_types,
    func_signature_t*
>;

using declaration_t = std::string;

using expression_t = boost::variant<
        pointer_t
        //user-defined
        //...
        //perators::base_op_t
>;

using statement_t = boost::variant<
    //expression_t,
    // compound_t,
    // selection_t,
    // iteration_t,
    // jump_t,
    declaration_t
    // try_block_t,
    // atomic_and_synchronized_blocks_t,
>;

enum class fd_types {
   fd_bool,
   fd_int,
   fd_float,
   fd_double,
   fd_char
};

struct pointer_t {

};

struct type_t: base_ast_node_t {
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
    std::string name;
    func_signature_t* signature;
    func_body_t body;
};

struct lambda_func_t {
    func_signature_t* signature;
    func_body_t body;
};

struct asm_stm_t: base_ast_node_t {
    std::string listing;
};

//TODO: Needed memory optimization, now we haw summ top wich have lagest size for all type 
struct literal_t { 
    //int,
    //char,
    //float,
    //char*,
    //bool,
};

enum class iteration_t {
    while_stm,
    do_while_stm,
    for_stm,
    for_range_stm
};

namespace operators {

enum class op_assign_t {
    basic,      // a = b
    add,        // a += b
    sub,        // a -= b
    mul,        // a *= b
    div,        // a /= b
    mod,        // a %= b
    _and,       // a &= b
    _or,        // a |= b
    _xor,       // a ^= b
    left_shift, // a <<= b
    right_shift // a >>= b
};

enum class cmp {
    eq,         // ==
    _not_eq,    // !=
    less,       // <
    grt,        // >
    less_or_eq, // <=
    grt_or_eq,  // >= 
    twc         // <=>
};

enum class logical {
    _not, // !a
    _and, // a && b 
    _or   // a || b
};

enum class bitwise {
    _not,        // ~a 
    _and,        // a & b 
    _or,         // a | b
    _xor,        // a ^ b
    left_shift,  // a >> b
    right_shift  // a << b
};

enum class assign {
    basic,      // a = b
    add,        // a += b
    sub,        // a -= b
    mul,        // a *= b
    div,        // a /= b
    mod,        // a %= b
    _and,       // a &= b
    _or,        // a |= b
    _xor,       // a ^= b
    left_shift, // a <<= b
    right_shift // a >>= b
};

enum class inc_dec {
    pre_inc,  // ++a
    post_inc, // a++
    pre_dec,  // --a
    post_dec  // a--
};

enum class arithmetic {
    un_plus,    // +a
    un_minus,   // -a
    add,        // a + b
    sub,        // a - b
    mul,        // a * b
    div,        // a / b
    mod,        // a % b
};

enum class member_access {
    subscript,            // a[b]
    indirection,          // *a
    address_of,           // &a
    member_of_obj,        // a.b
    member_of_ptr,        // a->b
    ptr_to_member_of_obj, // a.*b
    ptr_to_member_of_ptr  // a->*b
};

enum class other {
    call,   // a(...)
    comma,  // a, b
    ternary // a ? b : c
};

} // END OPERATORS

struct binary_op_t: base_ast_node_t {
    expression_t lhs, rhs;
};

struct unary_op_t: base_ast_node_t {
    expression_t rhs;
};

struct ternary_op_t: base_ast_node_t {
    expression_t prdc, lhs, rhs;
};

enum class jump_t {
    break_stm,
    continue_stm,
    return_stm,
    goto_stm
};

struct for_t {
    //TODO: predicate, initilize, evalute 
    func_body_t body;
};

} //AST NAMESPACE 

#endif //FROSTMOURNE_AST_HPP