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
#include "parser/ast_dump.hpp"

int main(int argc, char* argv[]) {
    // po::variables_map opt;
    // parse_args(argc, argv, opt);

    ast_builder_t ast_builder;
  
    ast::func_t main_func{
        ast::identifier_t{"main"},
        new ast::func_signature_t{
            ast::fd_types::_int, 
            {}
        },
        ast::func_body_t{
            new scope_t{

            },
            ast::statements_t{
                ast::declaration_t{"int", "counter"},
                new ast::binary_op_t{
                    ast::operators::binary_t::assign_basic, 
                    new ast::identifier_t{"counter"},
                    new ast::literal_t{3}
                },
                new ast::binary_op_t{},
                ast::jump_t{} 
            }
        }
    };
    
    ast::dump::dump(ast_builder);

    // ast_consumer_t ast_consumer{ast_builder};
    
    return EXIT_SUCCESS;
}