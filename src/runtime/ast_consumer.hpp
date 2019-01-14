#ifndef FROSTMOURNE_AST_CONSUMER_HPP
#define FROSTMOURNE_AST_CONSUMER_HPP

#include <string>

#include "../ast/scope.hpp"
#include "../parser/ast_builder.hpp"

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

class ast_consumer_t {
    constexpr static std::string_view entry_point_name {"main"};

    scope_t global;
    //router

    //execution_stack;
public:
    ast_consumer_t(ast_builder_t ast_builder){
       global = ast_builder.global; 
    }

    void run() noexcept {
        
    }
};

#endif //FROSTMOURNE_AST_CONSUMER_HPP