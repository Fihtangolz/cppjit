#ifndef FROSTMOURNE_AST_ITETATORS_HPP
#define FROSTMOURNE_AST_ITETATORS_HPP

namespace ast {
    enum class iteration_t {
        while_stm,
        do_while_stm,
        for_stm,
        for_range_stm
    };

    struct while_t : base_node_t {
        //predicate
        //func_body_t body;
    };

    struct for_t : base_node_t {
        //TODO: predicate, initilize, evalute
        //func_body_t body;
    };

} //AST NAMESPACE

#endif //FROSTMOURNE_AST_ITETATORS_HPP