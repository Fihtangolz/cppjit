void set_type(type new_type) noexcept {
    _type = new_type;
}

class_t::type type() noexcept {
    return _type;
}

bool is_final() noexcept { //TODO const
    return vs_final;
}

void set_final(bool new_value) noexcept {
    vs_final = new_value;
    assert(!identifier.empty() && "Unnamed class cannot be final");
}

identifier_t& get_identifier() noexcept { //TODO const 
    return identifier;
}

void set_identifier(identifier_t& new_identifier) noexcept {
    identifier = new_identifier;
}

taxonomy_t& taxonomy() const noexcept {
    return *_taxonomy;
}