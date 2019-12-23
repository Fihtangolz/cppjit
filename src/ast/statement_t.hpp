#ifndef FROSTMOURNE_STATEMENT_T_HPP
#define FROSTMOURNE_STATEMENT_T_HPP

#include "jump_t.hpp"

namespace ast {

using statement_t = boost::variant<
//- definitions --------------------
    class defenition_class_t*,
    class fd_type_t*,
    class array_t*,
    class pointer_t*,
    class pointer_t*,
    class references_t*,
    class pointer_to_member_t*,
    class class_t*,
//- expression ---------------------
    class func_call_t*,
    class binary_op_t*,
    class unary_op_t*,
    class ternary_op_t*,
    literal_t*,
    identifier_t*,
//- compound -----------------------

//- selection ----------------------

//- iteration ----------------------
    jump_t
//- try_block ----------------------

//- atomic_and_synchronized_blocks -
>;

using statements_t = std::vector<statement_t>;

}


#endif //FROSTMOURNE_STATEMENT_T_HPP
