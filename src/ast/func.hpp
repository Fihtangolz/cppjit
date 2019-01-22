#ifndef FROSTMOURNE_FUNC_HPP
#define FROSTMOURNE_FUNC_HPP

#include "base.hpp"

#include "scope.hpp"

namespace ast {

struct func_body_t {
        scope_t* scope;
        statements_t statements;
};

struct func_signature_t {
    types_t ret;
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

struct for_t {
    //TODO: predicate, initilize, evalute 
    func_body_t body;
};

} //AST NAMESPACE  

#endif //FROSTMOURNE_FUNC_HPP