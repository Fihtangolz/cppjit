#include "asm_stm_t.hpp"

attributes_t& asm_stm_t::attributes() const {
    return attributes_t;
}

std::string asm_stm_t::listing() const {
    return _listing;
}