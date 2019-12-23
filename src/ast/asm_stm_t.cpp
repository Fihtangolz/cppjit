#include "asm_stm_t.hpp"

using namespace ast;

attributes_t& asm_stm_t::attributes() {
    return _attributes;
}

std::string asm_stm_t::listing() const {
    return _listing;
}