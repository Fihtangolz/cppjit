#ifndef FROSTMOURNE_AST_BUILDER_HPP
#define FROSTMOURNE_AST_BUILDER_HPP

#include <queue>
#include <unordered_map>
#include <utility>
#include <memory>

#include "boost/optional.hpp"
#include "boost/variant.hpp"

#include "../ast/scope.hpp"

class ast_builder_t {
    friend void ast_dump(const ast_builder_t& ast_builder) noexcept;
    friend class ast_consumer_t;

    scope_t global;
    std::unordered_map<std::string, scope_t*> namespace_table;

    std::queue<scope_t*> construction_queue;

    //TODO разобраться с namespace_table!! unique_ptr
    std::unordered_map<std::string, ast::func_t> functions_table;
public:
    ast_builder_t() {
        construction_queue.push(&global);
    }

    auto open_namespace(std::string&& namespace_name) noexcept {
        auto result = namespace_table.emplace(
            std::piecewise_construct, 
            std::forward_as_tuple(namespace_name), 
            std::forward_as_tuple(construction_queue.front())
        );
        if(!result.second){
            assert("namespace collision");
        } 
        return result.first;
    }    

    void open_namespace(std::vector<std::string>&& namespace_road) noexcept {
    }

    void open_function_definition() noexcept {
    }

    void leave_scope() noexcept {
        construction_queue.pop();
        if(construction_queue.empty()){
            std::cout << "leave global scope" << std::endl;
        }
    }
};

#endif //FROSTMOURNE_AST_BUILDER_HPP

