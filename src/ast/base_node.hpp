#ifndef FROSTMOURNE_BASE_AST_HPP
#define FROSTMOURNE_BASE_AST_HPP

#include <string>

namespace ast {

struct position_t {
    std::string file_path;
    std::pair<int, int> declaration_range; //TODO: replace int
};

class base_node_t {
public:
    position_t& position() const;
    virtual std::string stringify() const;
    virtual std::string dump() const;
};

} //AST NAMESPACE


#endif //FROSTMOURNE_BASE_AST_HPP

