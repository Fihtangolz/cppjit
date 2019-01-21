#ifndef FROSTMOURNE_JUMP_STM_HPP
#define FROSTMOURNE_JUMP_STM_HPP

#include "ast.hpp"

namespace ast {

enum class jump_t {
    break_stm,
    continue_stm,
    return_stm,
    goto_stm
};

class goto_stm_t {
    identifier_t label;
    
}; 

}

#endif //FROSTMOURNE_JUMP_STM_HPP