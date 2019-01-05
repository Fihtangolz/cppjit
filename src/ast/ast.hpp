#ifndef FROSTMOURNE_AST_HPP
#define FROSTMOURNE_AST_HPP

#include <boost/variant.hpp>
#include <string>
#include <operators.hpp>
#include <map>

struct type_t {
    std::string name;
    std::map<std::string, type_t> variable;
    // std::map<func_t> member_func;
    // таксономия 
};

using expression_t = boost::variant<
    //literals
    int,
    char,
    float,
    char*,
    bool,
    //pointer
    //user-defined
    //...
    operators::base_op_t
>;

#endif //FROSTMOURNE_AST_HPP