#ifndef FROSTMOURNE_FUNC_HPP
#define FROSTMOURNE_FUNC_HPP

#include "scope.hpp"

namespace ast {

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