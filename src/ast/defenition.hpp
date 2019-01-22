#ifndef FROSTMOURNE_DEFENITION_HPP
#define FROSTMOURNE_DEFENITION_HPP

namespace ast::defenition {

class fd_type_t {
    fd_types _type;
    identifier_t _variable_name;
public:
    fd_type_t(fd_types type, const char* variable_name):_type(type),_variable_name(variable_name){}

    std::size_t memsize() noexcept {
        return sizeof(int);
    }
};

struct array_t {
    std::size_t size;
    identifier_t type_name;
    identifier_t variable_name;

    std::size_t memsize() noexcept {
        
    }
};

struct pointer_t {
    std::size_t size;
    // identifier_t type_name;

    std::size_t memsize() noexcept {
        return 4;
    }
};

struct references_t {
    identifier_t name;
};

struct pointer_to_member_t {
    identifier_t name;
};

} 
#endif //FROSTMOURNE_DEFENITION_HPP



