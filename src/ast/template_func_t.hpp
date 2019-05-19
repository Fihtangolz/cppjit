#ifndef FROSTMOURNE_TEMPLATE_FUNC_HPP
#define FROSTMOURNE_TEMPLATE_FUNC_HPP

#include "scope.hpp"
#include "func.hpp"
#include "base_node.hpp"

namespace ast {

class template_func_t : base_node_t {
    parameter_list_t _parameter_list;
    identifier_t _identifier;
    func_signature_t* _signature;
    func_body_t _body;
public:
    std::string identifier() const;
    void set_identifier(const identifier_t&& new_identifier);
    parameter_list_t& template_args() const; //TODO: переимянование шаблонные параметры
    func_signature_t& signature() const;
    func_body_t& body() const;

    template_func_t(
        const types_t& return_type,
        const identifier_t& identifier,
        const func_signature_t& func_signature, //TODO: replace to args
        const func_body_t& body
    ) { /* TODO */ }
};

} //AST NAMESPACE

#endif //FROSTMOURNE_TEMPLATE_FUNC_HPP