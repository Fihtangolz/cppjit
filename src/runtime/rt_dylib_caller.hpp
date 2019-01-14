#include <dlfcn.h>

//runtime dynamic library caller

void test(){
    void* handle = dlopen("/Experiments/testings/libc++.1.0.dylib", RTLD_LAZY);

    if (!handle) {
        std::cerr << "Cannot open library: " << dlerror() << '\n';
    }

    size_t(*strlen)(const char*);
    strlen = (size_t (*)(const char *))dlsym(handle, "strlen");
    if (!strlen) {
        std::cerr << "Func ptr empty: " << dlerror() << '\n';
    }

    strlen("132");

    std::cout << strlen("132");
}

enum class compiler_t {
    GCC,
    Clang
};

std::string magler(compiler_t compiler) noexcept {
    "_Z";
}