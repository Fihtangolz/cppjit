#ifndef FROSTMOURNE_MEMORY_LAYOUT_HPP
#define FROSTMOURNE_MEMORY_LAYOUT_HPP

#include <iostream>
#include <map>

#include "../ast/ast.hpp"

/* Описывает как мы должны записывать что то в память
   
    |------------|     
    | var1       | 0x7fff5dab1a50 <--|     [["var1", 0, 2,], ["var2", 4, 6], ...]
    | var1       | 0x7fff5dab1a51    |         |                |
    |------------|                   |---- ----|                |
    | padding    | 0x7fff5dab1a52                               |
    | padding    | 0x7fff5dab1a53                               |
    |------------|                                              |
    | var6       | 0x7fff5dab1a54 <-----------------------------|
    | var6       | 0x7fff5dab1a55
    | var6       | 0x7fff5dab1a56
    | var6       | 0x7fff5dab1a57
    | var6       | 0x7fff5dab1a58
    | var6       | 0x7fff5dab1a59
    |------------|
*/

class memory_layout_t {
    std::map<std::string, std::pair<std::size_t,std::size_t>> binds;
public:
    void generate_layout(ast::class_t& target){
        for(auto&& member : target.members()){
            std::cout << member->memsize() << std::endl;
        }
    }
};

#endif //FROSTMOURNE_MEMORY_LAYOUT_HPP