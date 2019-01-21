#ifndef FROSTMOURNE_AST_CLASS_HPP
#define FROSTMOURNE_AST_CLASS_HPP

#include <vector>
#include <cassert>

#include "ast.hpp"

namespace ast {

class taxonomy_t {
    enum acces_modifiers_t {
        _public, 
        _private,
        _protected
    };
    std::vector<std::pair<acces_modifiers_t, identifier_t>> base_clases;
public:
    
};

class class_t {
    identifier_t identifier;
    std::unique_ptr<taxonomy_t> _taxonomy;
    bool vs_final{false};
    std::unique_ptr<scope_t> scope;
public:
    bool is_final() noexcept { //TODO const
        return vs_final;
    }

    void set_final(bool&& new_value) noexcept {
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
};

class member_fun_t {
    void modifiers() noexcept {
        
    }
};

} //AST NAMESPACE 

#endif //FROSTMOURNE_AST_CLASS_HPP