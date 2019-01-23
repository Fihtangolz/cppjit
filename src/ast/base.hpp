
#ifndef FROSTMOURNE_BASE_HPP
#define FROSTMOURNE_BASE_HPP

#include <string>
#include <memory>

#include <boost/variant.hpp>

namespace ast {

enum class fd_types {
//signed integer types 6.7.1
    _signed_char,
    _short_int,
    _int,
    _long_int,
    _long_long_int,
//standard unsigned integer type 6.7.1
    _unsigned_char,
    _unsigned_short_int,
    _unsigned_int,
    _unsigned_long_int,
    _unsigned_long_long_int,
//floating-point-types
};

struct func_signature_t;

using literal_t = boost::variant< 
    int,
    char,
    float,
    char*,
    bool
>;

using types_t = boost::variant<
    fd_types,
    func_signature_t*
>;

enum class jump_t {
    break_stm,
    continue_stm,
};

using identifier_t = std::string;

class binary_op_t;
class unary_op_t;
class ternary_op_t;

using expression_t = boost::variant<
    binary_op_t*,
    unary_op_t*,
    ternary_op_t*,
    literal_t*,
    identifier_t*
>;

class fd_type_t;

using statement_t = boost::variant<
    fd_type_t*,
    //-----------------
    fd_type_t*,
    expression_t,
    // compound_t,
    // selection_t,
    // iteration_t,
    jump_t
    // try_block_t,
    // atomic_and_synchronized_blocks_t,
>;

using statements_t = std::vector<statement_t>;

} //AST NAMESPACE 

#endif //FROSTMOURNE_BASE_HPP