
#ifndef FROSTMOURNE_BASE_HPP
#define FROSTMOURNE_BASE_HPP

#include <string>
#include <memory>
#include "literal_t.hpp"
#include <boost/variant.hpp>

namespace ast {

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


using template_args_t = std::vector<int>; //TODO

using attribute_t = std::string;
using attributes_t = std::vector<attribute_t>;

} //AST NAMESPACE 

#endif //FROSTMOURNE_BASE_HPP