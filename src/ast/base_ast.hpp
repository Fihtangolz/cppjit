#ifndef FROSTMOURNE_BASE_AST_HPP
#define FROSTMOURNE_BASE_AST_HPP

#include <string>

class base_ast_t {
    std::string file_path;
    std::pair<int,int> declaration_range;
};

#endif //FROSTMOURNE_BASE_AST_HPP

