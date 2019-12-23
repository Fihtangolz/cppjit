#include "class.hpp"
#include "func.hpp"
#include "jump_stm.hpp"
#include "operators.hpp"
#include "scope.hpp" 
#include "defenition.hpp"
#include "func.hpp"
#include "template_func_t.hpp"
#include "asm_stm_t.hpp"
#include "iterators.hpp"

namespace ast {

//std::map<std::string, bool> conditionally_supported {
//        {"asm_declaration", true}
//};
//
//
//class ast_t : base_node_t {
//public:
//    void validation_errors() {
//
//    }
//
//    void parse(const std::string&& str) {
//
//    }
//};

} //AST NAMESPACE

//TAG: SEMANTIC ANALYSIS | Page 222 | $10.1
//assert(!identifier.empty() && "Unnamed class cannot be final");

//Если ретюрна нет а тип используется это UB - найти это в доке
