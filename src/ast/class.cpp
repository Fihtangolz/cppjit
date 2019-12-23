#include "class.hpp"

using namespace ast;

void class_t::set_type(class_type new_type) noexcept {
    _type = new_type;
}

class_type class_t::type() noexcept {
    return _type;
}

bool class_t::is_final() noexcept { 
    return vs_final;
}

void class_t::set_final(bool new_value) noexcept {
    vs_final = new_value;
}

identifier_t& class_t::identifier() noexcept {
    return _identifier;
}

void class_t::set_identifier(identifier_t& new_identifier) noexcept {
    _identifier = new_identifier;
}

taxonomy_t& class_t::taxonomy() noexcept {
    return *_taxonomy;
}

std::vector<defenition_t>& class_t::members() noexcept {
    return _members;
};

std::vector<member_fun_t>& class_t::member_functions() noexcept {
    return _member_functions;
};