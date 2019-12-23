#include <iostream>
#include "memory_layout.hpp"

struct base {
    char a;
    char b;
    char c;
    char a2;
    char b2;
    char c2;

    virtual void some(){
        std::cout << "base origin" << std::endl;
    };
};

struct derive : base {
    virtual void some(){
        std::cout << "derive origin" << std::endl;
    };
};

void inject(){
    std::cout << "inject" << std::endl; 
}

void test(base* der){
    der->a = 10;
    der->b = 11;
    der->c = 12;
    
    der->a2 = 12;
    der->b2 = 11;
    der->c2 = 10;

    long* foobarAsLong = (long*)der;

    printf("FooBar vtable pointer: %p\n", foobarAsLong[0]);

    long **foobarVtable = (long **)der;

    printf("First entry of FooBar VTABLE: %p\n", foobarVtable[0][0]);

    auto func = ( void(*)() )(foobarVtable[0][0]);
    func();

    foobarVtable[0][0] = (long)inject;
    func = ( void(*)() )(foobarVtable[0][0]);
    func();

    char* N = (char*)der;
    for(int i = 0; i < 20; ++i){ 
        std::cout << (void*)N << ":" << std::hex << (int)*N  << std::endl;
        N += 1;
    }
    der->some();

    std::cout << ( (TypeInfo*)foobarVtable[0][-1] )->name << std::endl;
    std::cout << ( (TypeInfo*)foobarVtable[0][-1] )->basevtable << std::endl;
}

int old_main333(int argc, char* argv[]){
    auto k = new derive;
    int g;
    std::cin >> g;
    if(g!=1){
        test(k);
    }else{
       test(new base); 
    }

    return 0;
};