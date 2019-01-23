#ifndef FROSTMOURNE_MEMORY_LAYOUT_HPP
#define FROSTMOURNE_MEMORY_LAYOUT_HPP

/* Описывает как мы должны записывать что то в память
   {|is_identifier|offset|data size|, ....}
   ex:  { |"var1"| 0 | 2 |, |"var2" | 4 | 6|}

    |------------|     
    | var1       | 
    | var1       |
    |------------|
    | padding    |
    | padding    |
    |------------|
    | var6       |
    | var6       |
    | var6       |
    | var6       |
    | var6       |
    | var6       |
    |------------|
*/
class memory_layout_t {
    std::map<std::string, std::pair<std::size_t,std::size_t>> binds;
    
};

#endif //FROSTMOURNE_MEMORY_LAYOUT_HPP