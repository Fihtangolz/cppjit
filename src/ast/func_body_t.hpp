#ifndef FROSTMOURNE_FUNC_BODY_T_HPP
#define FROSTMOURNE_FUNC_BODY_T_HPP

namespace ast {

class func_body_t {
    scope_t* scope;
    statements_t statements;
};

} //AST NAMESPACE

#endif //FROSTMOURNE_FUNC_BODY_T_HPP
