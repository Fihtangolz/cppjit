
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

enum class jump_t {
    break_stm,
    continue_stm,
};

using literal_t = boost::variant< 
    int,
    char,
    float,
    char*,
    bool
>;

using types_t = boost::variant<
    class fd_type_t*,
    class defenition_class_t*,
    class func_signature_t*
>;

using identifier_t = std::string;

using expression_t = boost::variant<
    class binary_op_t*,
    class unary_op_t*,
    class ternary_op_t*,
    literal_t*,
    identifier_t*
>;

using defenition_t = boost::variant<
    class defenition_class_t*,
    class fd_type_t*,
    class array_t*,
    class pointer_t*,
    class pointer_t*,
    class references_t*,
    class pointer_to_member_t*,
    class class_t*
>;

using statement_t = boost::variant<
//- defenitions -----------------
    class defenition_class_t*,
    class fd_type_t*,
    class array_t*,
    class pointer_t*,
    class pointer_t*,
    class references_t*,
    class pointer_to_member_t*,
    class class_t*,
//- expression ------------------
    class binary_op_t*,
    class unary_op_t*,
    class ternary_op_t*,
    literal_t*,
    identifier_t*,
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