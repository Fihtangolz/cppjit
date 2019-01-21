#include <algorithm>
#include <iostream>
#include <memory>

#include <boost/program_options.hpp>

#include "cli.hpp"
//for test
#include "ast/ast.hpp"
#include "ast/class.hpp"
#include "parser/ast_builder.hpp"
#include "runtime/ast_consumer.hpp"
#include "parser/ast_dump.hpp"
#include "runtime/dynlib_manager.hpp"

int main(int argc, char* argv[]) {
    // po::variables_map opt;
    // parse_args(argc, argv, opt);

    // ast::func_t main_func{
    //     ast::identifier_t{"main"},
    //     new ast::func_signature_t{
    //         ast::fd_types::_int, 
    //         {}
    //     },
    //     ast::func_body_t{
    //         new scope_t{

    //         },
    //         ast::statements_t{
    //             ast::declaration_t{ast::fd_types::_int, "counter"},
    //             new ast::binary_op_t{
    //                 ast::operators::binary_t::assign_basic, 
    //                 new ast::identifier_t{"counter"},
    //                 new ast::literal_t{3}
    //             },
    //             new ast::binary_op_t{},
    //             ast::jump_t{} 
    //         }
    //     }
    // };
    
    ast::class_t some;
    some.set_final(true);
        
    return EXIT_SUCCESS;
}