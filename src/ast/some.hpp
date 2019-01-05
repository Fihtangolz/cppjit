using statement_t = std::variant<
    expression_t
    // compound_t,
    // selection_t,
    // iteration_t,
    // jump_t,
    // declaration_t
    // try_block_t,
    // atomic_and_synchronized_blocks_t,
>; 



class declaration_t {

};

enum class jump_t {
    break_stm,
    continue_stm,
    return_stm,
    goto_stm
};

struct for_t {
    //TODO: predicate, initilize, evalute 
    fn_scope_t body;
};

enum class iteration_t {
    while_stm,
    do_while_stm,
    for_stm,
    for_range_stm
};

#include <vector>
#include <string>
#include <vector>
#include <boost/variant.hpp>
#include <functional>
#include <boost/hana.hpp>

#include "fd_types.hpp"

enum class op_assign_t {
    basic,      // a = b
    add,        // a += b
    sub,        // a -= b
    mul,        // a *= b
    div,        // a /= b
    mod,        // a %= b
    _and,       // a &= b
    _or,        // a |= b
    _xor,       // a ^= b
    left_shift, // a <<= b
    right_shift // a >>= b
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
//TODO визитор как то генерирует шаблонную функцию для каждого параметра, сделать тоже самое но для функций выше 

struct op_assign_add_t {
    fd_types a, b;
    op_assign_t type;
    
    void eval(){
        boost::apply_visitor([&](auto&& obj1, auto&& obj2){ 
            switch(type){
                case op_assign_t::basic:
                    obj1 = obj2;
                    break;
                case op_assign_t::add:
                    obj1 += obj2;
                    break;
                case op_assign_t::sub:
                    obj1 -= obj2;
                    break;
                case op_assign_t::mul:
                    obj1 *= obj2;
                    break;
                case op_assign_t::div:
                    obj1 /= obj2;
                    break;
                // case op_assign_t::mod:
                //     obj1 %= obj2;
                //     break;
                // case op_assign_t::_and:
                //     obj1 &= obj2;
                //     break;
                // case op_assign_t::_or:
                //     obj1 |= obj2;
                //     break;
                // case op_assign_t::_xor:
                //     obj1 ^= obj2;
                //     break;
                // case op_assign_t::left_shift:
                //     obj1 <<= obj2;
                //     break;
                //  case op_assign_t::right_shift:
                //     obj1 >>= obj2;
                //     break;
            }
            std::cout << obj1 << std::endl;
        }, a, b);
    }
};