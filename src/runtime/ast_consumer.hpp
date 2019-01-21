#ifndef FROSTMOURNE_AST_CONSUMER_HPP
#define FROSTMOURNE_AST_CONSUMER_HPP

#include <string>

#include "../ast/ast.hpp"
#include "../ast/scope.hpp"
#include "../parser/ast_builder.hpp"
#include "router.hpp"
#include "../utils.hpp"

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

namespace action::assign {
    auto&& basic       = [](auto&& obj1, auto&& obj2){ return obj1 = obj2;   };
    auto&& add         = [](auto&& obj1, auto&& obj2){ return obj1 += obj2;  };
    auto&& sub         = [](auto&& obj1, auto&& obj2){ return obj1 -= obj2;  };
    auto&& mul         = [](auto&& obj1, auto&& obj2){ return obj1 *= obj2;  };
    auto&& div         = [](auto&& obj1, auto&& obj2){ return obj1 /= obj2;  };
    auto&& mod         = [](auto&& obj1, auto&& obj2){ return obj1 %= obj2;  };
    auto&& _and        = [](auto&& obj1, auto&& obj2){ return obj1 &= obj2;  };
    auto&& _or         = [](auto&& obj1, auto&& obj2){ return obj1 |= obj2;  };
    auto&& _xor        = [](auto&& obj1, auto&& obj2){ return obj1 ^= obj2;  };
    auto&& left_shift  = [](auto&& obj1, auto&& obj2){ return obj1 <<= obj2; };
    auto&& right_shift = [](auto&& obj1, auto&& obj2){ return obj1 >>= obj2; };
}

class operator_executor_t {
    std::map<std::string, int> execution_stack; //TODO
public:
    void run() noexcept {
        // auto&& test =  ast::statements_t{
        //     new ast::binary_op_t{
        //         ast::binary_op_t::assign_basic, 
        //         new ast::identifier_t{"counter"},
        //         new ast::literal_t{3}
        //     },
        //     new ast::binary_op_t{
        //         ast::binary_op_t::assign_basic, 
        //         new ast::identifier_t{"counter"},
        //         new ast::literal_t{3}
        //     },
        // };

        // ast::expression_t k;
        // ast::binary_op_t* t;
        // ast::identifier_t* l;
        // for(auto&& stm : test){
        //     k = boost::get<ast::expression_t>(stm);
        //     t = boost::get<ast::binary_op_t*>(k);
        //     if(t->type == ast::operators::binary_t::assign_basic){
        //         l = boost::get<ast::identifier_t*>(t->lhs);
        //         if(l){
        //             std::cout << execution_stack[*l] << std::endl;
        //         }
        //     }

        // }
    }
};

#endif //FROSTMOURNE_AST_CONSUMER_HPP