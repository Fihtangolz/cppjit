#include <algorithm>
#include <iostream>
#include <memory>

#include <boost/program_options.hpp>

#include "cli.hpp"
//for test
#include "ast/scope.hpp"
#include "ast/ast.hpp"
#include "parser/ast_builder.hpp"
#include "runtime/ast_consumer.hpp"

int main(int argc, char* argv[]) {
    po::variables_map opt;
    parse_args(argc, argv, opt);
    
    ast_builder_t ast_builder;

    ast::func_t main_func {
        "main",
        new ast::func_signature_t {
            ast::fd_types::_int, 
            {}
        },
        ast::func_body_t {
            new scope_t {

            },
            ast::statements_t {

            }
        }
    };
    // std::unique_ptr<ast::binary_op_t> kek = std::make_unique<ast::binary_op_t>();
    // main_func.body.statements = {
    //     // std::make_unique<ast::binary_op_t>{{}},
    //     // std::make_unique<ast::binary_op_t>{{}},
    //     // std::make_unique<ast::unary_op_t>{{}},
    //     // std::make_unique<ast::jump_t>
    // };

    ast_consumer_t ast_consumer {ast_builder};

    return EXIT_SUCCESS;
}