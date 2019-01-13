#ifndef FROSTMOURNE_SCOPE_HPP
#define FROSTMOURNE_SCOPE_HPP

#include <vector>
#include <unordered_map>

#include "ast.hpp"

class scope_t;
//Определяет видимость definition (определений) 
//TODO lazy types
class scope_t {
    std::vector<scope_t*> visible; //TODO boost small vector?? 
    std::unordered_map<std::string, ast::types_t*> variables; //TODO string, maybe not? google reall malloc opt ?
    // std::unordered_map<>
public:
    template<typename ...Args>
    void add_instance(Args... args);
    void add_visible_entity();

    scope_t() = default;
    scope_t(scope_t* parent);
};

#endif //FROSTMOURNE_SCOPE_HPP

