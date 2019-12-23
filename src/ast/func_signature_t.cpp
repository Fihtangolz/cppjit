#include "func_signature_t.hpp"

using namespace ast;

types_t& func_signature_t::return_type() {
    return _ret;
}

types_t& func_signature_t::set_return_type() {

}

args_t& func_signature_t::arguments() {
    return _args;
}

