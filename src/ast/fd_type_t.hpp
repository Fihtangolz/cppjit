#ifndef FROSTMOURNE_FD_TYPE_T_HPP
#define FROSTMOURNE_FD_TYPE_T_HPP

#include "base.hpp"
#include "base_node.hpp"

namespace ast {

enum class fd_types {
    _wchar_t,
    _char16_t,
    _char32_t,
    _char,
    _void,
    _nullptr_t,
    _bool,
//signed integer types 6.7.1
    _signed_char,
    _short_int,
    _int,
    _long_int,
    _long_long_int,
//standard unsigned integer type 6.7.1
    _unsigned_char,
    _unsigned_short_int,
    _unsigned_int,
    _unsigned_long_int,
    _unsigned_long_long_int,
//floating-point-types
    _float,
    _double,
    _long_double,
};

class fd_type_t : base_node_t {
    fd_types _type;
    identifier_t _variable_name;
public:
    identifier_t& variable_name() noexcept;
    /*!
     * Returns the size of the fundamental type on the target machine.
     * @note Depending on the platform. A byte may have a different number of bits. Use to clarify CHAR_BIT
     * @return Number of bytes
     */
    std::size_t memsize() noexcept;

    fd_type_t(const fd_types& type, const identifier_t& variable_name):_type(type), _variable_name(variable_name){}
};

} //AST NAMESPACE

#endif //FROSTMOURNE_FD_TYPE_T_HPP
