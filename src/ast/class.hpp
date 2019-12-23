#ifndef FROSTMOURNE_AST_CLASS_HPP
#define FROSTMOURNE_AST_CLASS_HPP

#include <vector>
#include <cassert>
#include <iterator>

#include "base.hpp"
#include "scope.hpp"
#include "member_fun_t.hpp"
#include "base_node.hpp"

namespace ast {

enum class access_modifier_t {
    _public,
    _private,
    _protected
};

class taxonomy_t {
    access_modifier_t _access_modifier;
    std::vector<std::pair<access_modifier_t, class_t>> base_classes;
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

    void set_access_modifier(const access_modifier_t&& access_modifier) noexcept {
        _access_modifier = access_modifier;
    }
    access_modifier_t& access_modifier() noexcept {
        return _access_modifier;
    }
};

enum class class_type {
    _struct,
    _class,
    _union
};

class class_t : base_node_t {
    identifier_t _identifier;
    std::vector<defenition_t> _members;
    std::vector<member_fun_t> _member_functions;
    std::unique_ptr<taxonomy_t> _taxonomy;
    bool vs_final {false};
    std::unique_ptr<scope_t> scope;
    class_type _type;
public:

    void set_type(class_type new_type) noexcept;
    class_type type() noexcept;
    bool is_final() noexcept;
    void set_final(bool new_value) noexcept;
    identifier_t& identifier() noexcept;
    void set_identifier(identifier_t& new_identifier) noexcept;
    taxonomy_t& taxonomy() noexcept;
    std::vector<defenition_t>& members() noexcept;
    std::vector<member_fun_t>& member_functions() noexcept;
};

} //AST NAMESPACE 

#endif //FROSTMOURNE_AST_CLASS_HPP