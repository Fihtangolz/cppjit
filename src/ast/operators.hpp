#ifndef FROSTMOURNE_OPERATORS_HPP
#define FROSTMOURNE_OPERATORS_HPP

#include <boost/variant.hpp>

namespace operators {

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

class base_op_t {
    virtual void eval() = 0;
    ~base_op_t() = default;
};

struct binary_op_t: base_op_t {
    expression_t lhs, rhs;

    void eval(){
        
    }
};

struct unary_op_t: base_op_t {
    expression_t rhs;
    
    void eval() {
        
    }
};

struct ternary_op_t: base_op_t {
    expression_t prdc, lhs, rhs;

    void eval() {
        prdc.eval() ? lhs.eval() : rhs.eval();
    }
};

} // END OPERATORS

#endif //FROSTMOURNE_OPERATORS_HPP