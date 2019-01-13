#include "scope.hpp"

template<typename ...Args>
void scope_t::add_instance(Args... args){
    variables.emplace(args...);
};

void scope_t::add_visible_entity(){
}

scope_t::scope_t(scope_t* parent){
    visible.push_back(parent);
}
