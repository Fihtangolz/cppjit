#ifndef FROSTMOURNE_AST_CONSUMER_HPP
#define FROSTMOURNE_AST_CONSUMER_HPP

#include <string>

#include "../ast/ast.hpp"
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
    std::vector<std::byte> execution_stack;
    std::map<std::string, std::byte*> binds; 
public:
    void run(ast::statements_t& statements) noexcept {
        ast::fd_type_t* fd_type; 
        for(auto&& statement : statements){ 
            if(fd_type = boost::get<ast::fd_type_t*>(statement)){
                binds[fd_type->variable_name()]; 
            }
        }
    }
};

#endif //FROSTMOURNE_AST_CONSUMER_HPP