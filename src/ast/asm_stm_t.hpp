#ifndef FROSTMOURNE_ASM_HPP
#define FROSTMOURNE_ASM_HPP

#include <string>
#include "base_node.hpp"
#include "base.hpp"

namespace ast {

class asm_stm_t : base_node_t {
    attributes_t _attributes;
    std::string _listing;
public:
    attributes_t& attributes();
    std::string listing() const;
};

}

#endif //FROSTMOURNE_ASM_HPP