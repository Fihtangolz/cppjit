
#ifndef FROSTMOURNE_BASE_HPP
#define FROSTMOURNE_BASE_HPP

#include <string>
#include <memory>

#include <boost/variant.hpp>

namespace ast {

enum class jump_t {
    break_stm,
    continue_stm,
};

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
    class func_call_t*, //Terminator
    literal_t,          //Terminator
    identifier_t*       //Terminator
>;

using defenition_t = boost::variant<
    class defenition_class_t*,
    class fd_type_t*,
    class array_t*,
    class pointer_t*,
    class references_t*,
    class pointer_to_member_t*,
    class class_t*
>;

using statement_t = boost::variant<
//- defenitions --------------------
    class defenition_class_t*,
    class fd_type_t*,
    class array_t*,
    class pointer_t*,
    class pointer_t*,
    class references_t*,
    class pointer_to_member_t*,
    class class_t*,
//- expression ---------------------
    class func_call_t*,
    class binary_op_t*,
    class unary_op_t*,
    class ternary_op_t*,
    literal_t*,
    identifier_t*,
//- compound -----------------------

//- selection ----------------------

//- iteration ----------------------
    jump_t
//- try_block ----------------------

//- atomic_and_synchronized_blocks -
>;

using statements_t = std::vector<statement_t>;

using parameter_list_t = std::vector<>;

using attribute_t = std::string;
using attributes_t = std::array<attribute_t>;

} //AST NAMESPACE 

#endif //FROSTMOURNE_BASE_HPP