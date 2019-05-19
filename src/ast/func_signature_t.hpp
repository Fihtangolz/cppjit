#ifndef FROSTMOURNE_FUNC_SIGNATURE_T_HPP
#define FROSTMOURNE_FUNC_SIGNATURE_T_HPP


#include <vector>
#include "base.hpp"
#include "base_node.hpp"

namespace ast {

struct arg_t {
   identifier_t identifier;
   types_t type;
   default_value; //TODO
};


class func_signature_t : base_node_t {
    using args_t = std::vector<arg_t>;

    types_t ret;
    args_t args;
public:
    types_t& return_type() const;
    types_t& set_return_type() const;
    arg_t& arguments() const;
};

} //AST NAMESPACE

#endif //FROSTMOURNE_FUNC_SIGNATURE_T_HPP
