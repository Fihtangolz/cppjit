#include "template_func_t.hpp"

using namespace ast;

std::string template_func_t::identifier() const {
    return _identifier;
}

void template_func_t::set_identifier(const identifier_t&& new_identifier) {
    _identifier = new_identifier;
}

parameter_list_t& template_func_t::parameter_list() const {
    return _parameter_list;
}

func_signature_t& template_func_t::signature() const {
    return *_signature;
}

func_body_t& template_func_t::body() const {
    return _body;
}