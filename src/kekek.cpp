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


int older_main(int argc, char* argv[]){
    ast::dump::dump();

    return 0;
};