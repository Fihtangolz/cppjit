#include "class.hpp"

using namespace ast;

void class_t::set_type(class_t::class_type new_type) noexcept {
    _type = new_type;
}

class_t::class_type class_t::type() noexcept {
    return _type;
}

bool class_t::is_final() noexcept { //TODO const
    return vs_final;
}

void class_t::set_final(bool new_value) noexcept {
    vs_final = new_value;
    assert(!identifier.empty() && "Unnamed class cannot be final");
}

identifier_t& class_t::get_identifier() noexcept {
    return identifier;
}

void class_t::set_identifier(identifier_t& new_identifier) noexcept {
    identifier = new_identifier;
}

taxonomy_t& class_t::taxonomy() noexcept {
    return *_taxonomy;
}