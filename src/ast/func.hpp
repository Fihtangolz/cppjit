#ifndef FROSTMOURNE_FUNC_HPP
#define FROSTMOURNE_FUNC_HPP

#include "base.hpp"
#include "scope.hpp"

namespace ast {

struct func_body_t {
    scope_t* scope;
    statements_t statements;
};

class member_fun_t {
    void modifiers() noexcept {
        
    }
};

struct func_signature_t {
    fd_types ret;
    using arg_t = std::pair<types_t, std::string>;
    std::vector<arg_t> args;
}; 

struct func_t {
    identifier_t name;
    func_signature_t* signature;
    func_body_t body;
};

struct lambda_func_t {
    func_signature_t* signature;
    func_body_t body;
};

} //AST NAMESPACE  

#endif //FROSTMOURNE_FUNC_HPP