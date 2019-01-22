#ifndef FROSTMOURNE_BINARY_OP_HPP
#define FROSTMOURNE_BINARY_OP_HPP

namespace ast { //::operators

struct binary_op_t {
    enum class binary_t {
        basic,       // a = b
        _add,         // a += b
        _sub,         // a -= b
        _mul,         // a *= b
        _div,         // a /= b
        _mod,         // a %= b
        _and,         // a &= b
        _or,          // a |= b
        _xor,         // a ^= b
        left_shift,   // a <<= b
        right_shift,  // a >>= b 
    };
    // //cmp
    //     cmp_eq,          // a == b
    //     cmp_not_eq,      // a != b
    //     cmp_less,        // a < b
    //     cmp_grt,         // a > b
    //     cmp_less_or_eq,  // a <= b
    //     cmp_grt_or_eq,   // a >= b
    //     cmp_twc,         // a <=> b
    // //logical 
    //     logical_and,       //  a && b 
    //     logical_or,        //  a || b
    // //bitwise 
    //     bitwise_and,          // a & b 
    //     bitwise_or,           // a | b
    //     bitwise_xor,          // a ^ b
    //     bitwise_left_shift,   // a >> b
    //     bitwise_right_shift,  // a << b
    // //arithmetic 
    //     arithmetic_un_plus,     // +a
    //     arithmetic_un_minus,    // -a
    //     arithmetic_add,         // a + b
    //     arithmetic_sub,         // a - b
    //     arithmetic_mul,         // a * b
    //     arithmetic_div,         // a / b
    //     arithmetic_mod,         // a % b
    
    binary_t type;  
    expression_t lhs, rhs;
};

struct unary_op_t {
    enum unary_t {
    //logical 
        logical_not,         // !a
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

    unary_t type;
    expression_t rhs;

};

struct ternary_op_t {
    expression_t prdc, lhs, rhs;
};

} //AST NAMESPACE  

#endif //FROSTMOURNE_BINARY_OP_HPP