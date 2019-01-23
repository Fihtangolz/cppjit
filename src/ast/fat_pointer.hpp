#ifndef FROSTMOURNE_FAT_POINTER_HPP
#define FROSTMOURNE_FAT_POINTER_HPP

#include <type_traits>
#include <cstdint>

class error_type_flag {};

template<typename ...Ts>
class fat_pointer_t {
    void* pointer;

    constexpr static std::size_t varg_num = sizeof...(Ts);

    typename 
        std::conditional_t<varg_num <= sizeof(std::uint8_t)*256,  std::uint8_t, 
        std::conditional_t<varg_num <= sizeof(std::uint16_t)*256, std::int16_t, 
        std::conditional_t<varg_num <= sizeof(std::uint64_t)*256, std::uint64_t, 
        std::conditional_t<varg_num <= sizeof(std::uintmax_t)*256, std::uintmax_t, 
        error_type_flag>>>
    > tag;

    static_assert(varg_num, "Types not provided");
    static_assert(!std::is_same_v<error_type_flag, decltype(tag)>, "Too many types. Enough fundamental type not foundt.");

public:
    template<typename T>
    explicit operator T*(){
        std::cout << "yes" << std::endl;
        return reinterpret_cast<T*>(pointer);
    }
};

class sub_category {

};

#endif //FROSTMOURNE_FAT_POINTER_HPP