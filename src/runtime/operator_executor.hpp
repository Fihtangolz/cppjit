#ifndef FROSTMOURNE_AST_OPERATOR_EXECUTOR_HPP
#define FROSTMOURNE_AST_OPERATOR_EXECUTOR_HPP

#include <stack>
#include <iostream>

#include "boost/variant.hpp"

#include "../ast/ast.hpp"
#include "../utils.hpp"

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

template<typename T, typename U>
T& represent_memreg(U container) noexcept {
    return (*( /* present as */ (T*) /* the */ (*container).second));
}

template<typename ...Ts>
void cast_chaine() noexcept {
    
}

// template<typename T, typename P, typename F>
// void cast_reg(P ptr, F func) noexcept {
//     fuc(static_cast<*T>(ptr));
// }


class operator_executor_t {
    std::byte* top_stack_ptr;
    std::vector<std::byte> execution_stack{10}; 
    std::map<ast::identifier_t, std::byte*> binds; 
public:
    void run(ast::statements_t& statements) noexcept {
        top_stack_ptr = &*execution_stack.begin();
        //
        ast::fd_type_t* fd_type; 
        ast::binary_op_t* binary_op;
        ast::identifier_t* identifier;
        std::map<ast::identifier_t, std::byte*>::iterator it;
        ast::expression_t st;
        ast::literal_t lit;
        for(auto&& statement : statements){ 
            try{
                if(fd_type = boost::get<ast::fd_type_t*>(statement)){
                    binds[fd_type->variable_name()] = &*execution_stack.begin();
                    continue; 
                }    
            }catch(...){}
            
            try{
                if(binary_op = boost::get<ast::binary_op_t*>(statement)){
                    try{
                        if(identifier = boost::get<ast::identifier_t*>(binary_op->lhs)){
                            it = binds.find(*identifier);
                            if(it == binds.end()){
                                assert("Unlnow identifier");
                            }

                            [](ast::expression_t expr){
                                //Convert from Ast to reverse polish notation
                                std::stack<ast::expression_t> que;
                                std::stack<ast::expression_t> que2;
                                do{
                                    if(ast::binary_op_t* b_op = boost::get<ast::binary_op_t*>(que)){
                                        que.push(b_op->lhs);
                                        que.push(b_op->rhs);
                                    }
                                    if(ast::unary_op_t* u_op = boost::get<ast::unary_op_t*>(expr)){
                                        que.push(u_op->rhs);
                                    }
                                    if(holds_alternative<ast::literal_t>(expr)){
                                        que2.push(expr);
                                    }

                                }while(!que.empty());
                            };
                            
                            //TODO Log for dell
                            for(auto& byte : execution_stack){
                                std::cout << &byte << ":"<< (int)byte << std::endl;
                            }
                        }    
                    }catch(...){}
                }    
            }catch(...){}
        }
    }
};

#endif //FROSTMOURNE_AST_OPERATOR_EXECUTOR_HPP
