#ifndef FROSTMOURNE_JUMP_STM_HPP
#define FROSTMOURNE_JUMP_STM_HPP

#include "ast.hpp"

namespace ast {

class goto_stm_t : base_node_t {
    identifier_t label;
}; 

} //AST NAMESPACE

#endif //FROSTMOURNE_JUMP_STM_HPP