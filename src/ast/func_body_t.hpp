#ifndef FROSTMOURNE_FUNC_BODY_T_HPP
#define FROSTMOURNE_FUNC_BODY_T_HPP

#include "base_node.hpp"
#include "scope.hpp"
#include "statement_t.hpp"

namespace ast {

class func_body_t : base_node_t {
    scope_t* scope;
    statements_t statements;
};

} //AST NAMESPACE

#endif //FROSTMOURNE_FUNC_BODY_T_HPP
