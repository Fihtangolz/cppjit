#ifndef FROSTMOURNE_ASM_HPP
#define FROSTMOURNE_ASM_HPP

#include <string>

class asm_stm_t : base_node_t {
    attributes_t _attributes;
    std::string _listing;
public:
    attributes_t& attributes() const;
    std::string listing() const;
};

#endif //FROSTMOURNE_ASM_HPP