#ifndef FROSTMOURNE_AST_CONSUMER_HPP
#define FROSTMOURNE_AST_CONSUMER_HPP

#include <string>

#include "../ast/ast.hpp"
#include "../parser/ast_builder.hpp"
#include "router.hpp"

class ast_consumer_t {
    constexpr static std::string_view entry_point_name {"main"};

    ast::scope_t global;
    
    router_t router;
public:
    ast_consumer_t(ast_builder_t ast_builder){
       global = ast_builder.global; 
    }

    void run() noexcept {
    }
};

#endif //FROSTMOURNE_AST_CONSUMER_HPP