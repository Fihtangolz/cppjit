#ifndef FROSTMOURNE_LITERAL_T_HPP
#define FROSTMOURNE_LITERAL_T_HPP

#include <boost/variant.hpp>
#include "base_node.hpp"

namespace ast {

using literal_t = boost::variant<
    class integer_literal_t,
    class character_literal_t,
    class floating_literal_t,
    class string_literal_t,
    class boolean_literal_t,
    class pointer_literal_t,
    class user_defined_literal_t
>;

class integer_literal_t : base_node_t{

};

class character_literal_t : base_node_t {

};

class floating_literal_t : base_node_t {
    
};

class string_literal_t : base_node_t {

};

class boolean_literal_t : base_node_t {
    bool _value;
public:
    bool value() {
        return _value;
    }
    void toogle() {
        _value = !_value;
    }
    std::string stringify() const {
        return {_value ? "true" : "false"};
    }

    boolean_literal_t(bool value){}
};

class pointer_literal_t : base_node_t {

};

class user_defined_literal_t : base_node_t {

};

} //AST NAMESPACE

#endif //FROSTMOURNE_LITERAL_T_HPP
