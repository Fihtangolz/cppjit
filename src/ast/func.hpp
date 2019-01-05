#ifndef FROSTMOURNE_FUNC_HPP
#define FROSTMOURNE_FUNC_HPP

#include <vector>

struct variable_t {
    type_t type;
    std::string identifier;
};

struct fn_scope_t {
    std::vector<variable_t> execution_context; //TODO variable_t
    std::vector<statement_t> statements; 
};

struct signature_t {
    type_t ret;
    using arg_t = std::pair<type_t, std::string>;
    std::vector<arg_t> args;
}; 

struct func_t {
    std::string name;
    signature_t signature;
    fn_scope_t body;
};

struct lambda_func_t {
    //...
    signature_t signature;
    fn_scope_t body;
};

#endif //FROSTMOURNE_FUNC_HPP