#ifndef FROSTMOURNE_SCOPE_HPP
#define FROSTMOURNE_SCOPE_HPP

#include <vector>
#include <unordered_map>

#include "defenition.hpp"

namespace ast {

//Определяет видимость defenition (определений) 
//TODO lazy types
//TODO boost small vector?? 
//TODO string, maybe char*? 
//TODO google reall alloc mem size opt ?
//TODO карта которая связывает идентификатор типа и дискриптор типа 
class scope_t {
    std::vector<scope_t*> visible; 
    std::unordered_map<std::string, defenition_t> defenition;  
public:
    void name_lookup() noexcept { //TODO: попробoвать ленивое разрешение или полное разрешение для юнита исполнения
        assert("Declaration not found. The program is ill-formed.");
    }
    
    template<typename ...Args>
    void add_instance(Args... args);
    void add_visible_entity();

    scope_t() = default;
    scope_t(scope_t* parent);
};

} //AST NAMESPACE 

#endif //FROSTMOURNE_SCOPE_HPP

