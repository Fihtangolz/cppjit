#ifndef FROSTMOURNE_FUNC_HPP
#define FROSTMOURNE_FUNC_HPP

#include "func.hpp"
#include "scope.hpp"
#include "func_body_t.hpp"

namespace ast {

struct func_t : base_node_t {
    identifier_t name;
    func_signature_t* signature;
    func_body_t body;
};

struct lambda_func_t : base_node_t {
    func_signature_t* signature;
    func_body_t body;
};

} //AST NAMESPACE  

#endif //FROSTMOURNE_FUNC_HPP