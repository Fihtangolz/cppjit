#ifndef FROSTMOURNE_UTILS_HPP
#define FROSTMOURNE_UTILS_HPP

#include <boost/variant.hpp>

// helper type for the visitor #4
template<class... Ts> struct overloaded : Ts... { using Ts::operator()...; };
template<class... Ts> overloaded(Ts...) -> overloaded<Ts...>;

template <typename T, typename... Ts>
bool holds_alternative(const boost::variant<Ts...>& v) noexcept{
    return boost::get<T>(&v) != nullptr;
}

#endif //FROSTMOURNE_UTILS_HPP