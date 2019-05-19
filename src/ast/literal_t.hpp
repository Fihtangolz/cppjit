#ifndef FROSTMOURNE_LITERAL_T_HPP
#define FROSTMOURNE_LITERAL_T_HPP

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

} //AST NAMESPACE

#endif //FROSTMOURNE_LITERAL_T_HPP
