#ifndef FROSTMOURNE_FUNC_SIGNATURE_T_HPP
#define FROSTMOURNE_FUNC_SIGNATURE_T_HPP


#include <vector>
#include "base.hpp"
#include "base_node.hpp"

namespace ast {

struct arg_t {
   identifier_t identifier;
   types_t type;
   types_t default_value;
};

using args_t = std::vector<arg_t>;

class func_signature_t : base_node_t {
    types_t _ret;
    args_t _args;
public:
    types_t& return_type();
    types_t& set_return_type();
    args_t& arguments();
};

} //AST NAMESPACE

#endif //FROSTMOURNE_FUNC_SIGNATURE_T_HPP
