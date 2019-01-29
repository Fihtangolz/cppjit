// template<typename T>
// class ast_visitor {
//     template<typename T>
//     void visit(T t){

//     }
// };

// class some1 : ast_visitor<some1> {
//     void visit(){
//         visitor::visit(this);
//     }
// };

// class some2 : ast_visitor<some2> {
//     std::vector<some1*> vec;
//     void visit(){
//         visitor::visit(this);
//     }
// };

#include "ast/ast.hpp"
#include "parser/ast_dump.hpp"
#include <stack>

//Алгоритм обхода 
template<typename T, typename V> //Над чем //Обзорщик 
class traversal_algorithm_t {
    std::stack<ast::expression_t> que;

    void preorder(ast::expression_t expr) {
        // boost::apply_visitor(overloaded{
        //     [](){},
        //     [](){},
        //     [](){},
        //     [](auto){}
        // }, stm);
    };
public:
    //Поместить правую ноду, поместить левую ноду
    //Достать первую ноду поместить левую ноду поместить правую ноду...
    //Встречен лист... 
    void next(ast::expression_t expr) noexcept {
        // visit(expr);
        preorder(expr);
    }
};


int main(int argc, char* argv[]){
    ast::dump::dump();

    return 0;
};