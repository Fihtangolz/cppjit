template<typename T>
struct trivial_ex_t { //TODO
    void* destination;
    std::size_t size;
    //some....
};

namespace opt {
    //Замена i+=i; на i*=2;
    //reduction unused variable 
    void unroll(){

    }
}
