#ifndef FROSTMOURNE_MEMBER_FUN_T_HPP
#define FROSTMOURNE_MEMBER_FUN_T_HPP

namespace ast {

enum class modifiers_t {
    _override,
    _final,
    _virtual,
    _pure_virtual,
//- cv-qualifier -------------------
    _const,
    _volatile,
//- ref-qualifier ------------------
    _rq_lvalue,
    _rq_rvalue,
};

class member_fun_t {
    void specifiers() noexcept;
};

} //AST NAMESPACE

#endif //FROSTMOURNE_MEMBER_FUN_T_HPP
