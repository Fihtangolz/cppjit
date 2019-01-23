#include "cli.hpp"

#include "ast/ast.hpp"
#include "runtime/ast_consumer.hpp"

int main(int argc, char* argv[]) {
    po::variables_map opt;
    parse_args(argc, argv, opt);

    ast::func_t main_func{
        ast::identifier_t{"main"},
        new ast::func_signature_t{
            ast::fd_types::_int, 
            {}
        },
        ast::func_body_t{
            new ast::scope_t{

            },
            ast::statements_t{
                new ast::fd_type_t{},
                new ast::binary_op_t{
                    ast::binary_op_t::binary_t::basic, 
                    new ast::identifier_t{"counter"},
                    new ast::literal_t{3}
                },
                // new ast::operators::binary_op_t{},
                ast::jump_t{} 
            }
        }
    };

    operator_executor_t tested;
    tested.run(main_func.body.statements);

    return EXIT_SUCCESS;
}