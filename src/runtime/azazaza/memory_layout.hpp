#ifndef FROSTMOURNE_MEMORY_LAYOUT_HPP
#define FROSTMOURNE_MEMORY_LAYOUT_HPP

#include <iostream>
#include <map>
#include <stack>

/* Class for create data layout of object.  
   
    |------------|     
    | var1       | 0x7fff5dab1a50 <--|     [["var1", 0, 2,], ["var6", 4, 6], ...]
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

class DataLayout {
    std::map<std::string, std::pair<std::size_t, std::size_t>> binds;
public:
    std::string showMapping(void* memreg) noexcept {
        //TODO: show like at heider map
    }
};

////////////////////////////

class CallHook {
    void* entryPoint;
    // void operator () {
    //     std::cout << "Call hook" << std::endl;
    //     assert(false && "Hook ended");
    // }
};

struct TypeInfo {
    void *basevtable;
    char *name;
};

class VTable {
    //vcall
    //vbase
    TypeInfo* typeInfo;
    //virtual table address point points here,
    void* virtualFunctionPointers;

    //.....
    void extractFrom() noexcept {

    }
};

bool isTrivial() noexcept {
    
}

bool isLeef() noexcept {

}

bool isNonVirtualBasesOnly() noexcept {

}

bool isVirtualBasesOnly() noexcept {

}

bool isComplex() noexcept {

}

// void generateLayout(ast::class_t& target) noexcept {
//     ast::fd_type_t* v; 
//     ast::defenition_t* def;
//     std::stack<ast::defenition_t> s;
//     for(auto&& member : target.members()){
//         v = boost::get<ast::fd_type_t*>(member);
//         if(v){
//             std::cout << v->memsize() << std::endl;
//         }
//     }
//     //Generaite Vtable 
// }

#endif //FROSTMOURNE_MEMORY_LAYOUT_HPP