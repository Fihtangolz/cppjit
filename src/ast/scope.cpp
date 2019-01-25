#include "scope.hpp"

using namespace ast;

template<typename ...Args>
void scope_t::add_instance(Args... args){
    defenition.emplace(args...);
};

void scope_t::add_visible_entity(){
}

scope_t::scope_t(scope_t* parent){
    visible.push_back(parent);
}
