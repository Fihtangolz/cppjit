#ifndef FROSTMOURNE_AST_CLASS_HPP
#define FROSTMOURNE_AST_CLASS_HPP

#include <vector>
#include <cassert>
#include <iterator>

#include "base.hpp"
#include "scope.hpp"
#include "func.hpp"

namespace ast {

class taxonomy_t {
    enum acces_modifiers_t {
        _public, 
        _private,
        _protected
    };
    std::vector<std::pair<acces_modifiers_t, class_t>> base_clases;
public:
    class iterator_t : public std::iterator<
                        std::input_iterator_tag,   // iterator_category
                        long,                      // value_type
                        long,                      // difference_type
                        const long*,               // pointer
                        long                       // reference
                                            > {
                                                
    };

    iterator_t begin() {}
    iterator_t end() {}
};

class class_t {
    enum class class_type {
        _struct,
        _class,
        _union
    };

    identifier_t identifier;
    std::vector<defenition_t> _members; 
    std::unique_ptr<taxonomy_t> _taxonomy;
    bool vs_final{false}; 
    std::unique_ptr<scope_t> scope;
    class_type _type;
public:

    void set_type(class_t::class_type new_type) noexcept;
    class_t::class_type type() noexcept;
    bool is_final() noexcept; //const
    void set_final(bool new_value) noexcept;
    identifier_t& get_identifier() noexcept; //const
    void set_identifier(identifier_t& new_identifier) noexcept;
    taxonomy_t& taxonomy() noexcept; //const
    std::vector<defenition_t>& members() const noexcept;
    std::vector<member_fun_t>& member_functions() const noexcept;
};

} //AST NAMESPACE 

#endif //FROSTMOURNE_AST_CLASS_HPP