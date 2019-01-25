#ifndef FROSTMOURNE_DYNLIB_MANAGER_HPP
#define FROSTMOURNE_DYNLIB_MANAGER_HPP

#include <vector>
#include <string>
#include <experimental/filesystem>

#include <dlfcn.h>

using namespace std::filesystem;

//runtime dynamic library caller
class dynlib_manager_t {
    
public:
    std::string demangler() noexcept { 
        std::string tested {"__ZNKSt3__18time_getIwNS_19istreambuf_iteratorIwNS_11char_traitsIwEEEEE17__get_weekdaynameERiRS4_S4_RjRKNS_5ctypeIwEE"};
        if(tested[0] == '__Z'){
            std::cout << "Error" << std::endl;
        }
        return "";
    }
public:
    void load(std::vector<std::string>& pathes) noexcept {
        for(auto path : pathes){
            std::cout << path << std::endl;
        }
    } 

    void find(std::string& some) noexcept { 
        
    } 
};

void test() noexcept {
    void* handle = dlopen("/Experiments/testings/libc++.1.0.dylib", RTLD_LAZY);

    if (!handle) {
        std::cerr << "Cannot open library: " << dlerror() << '\n';
    }

    size_t(*strlen)(const char*);
    strlen = (size_t (*)(const char *))dlsym(handle, "strlen");
    if (!strlen) {
        std::cerr << "Func ptr empty: " << dlerror() << '\n';
    }

    std::cout << strlen("132");
}

#endif //FROSTMOURNE_DYNLIB_MANAGER_HPP