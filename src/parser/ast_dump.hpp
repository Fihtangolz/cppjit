
#ifndef FROSTMOURNE_AST_DUMP_HPP
#define FROSTMOURNE_AST_DUMP_HPP

#include <functional>
#include <iostream>

#include "../utils.hpp"
#include "ast_builder.hpp"
#include "../ast/ast.hpp"


namespace ast::dump {

class dump_stream_t;

class dump_stream_t {
    friend dump_stream_t& end_branching(dump_stream_t& stream) noexcept;
    friend dump_stream_t& start_branching(dump_stream_t& stream) noexcept;
    
    std::string line{"| "}, ender{"`-"}, branch{"|-"};
    std::string s;
    std::string h_buff;
    std::string s_buff;
public:
    dump_stream_t& operator << (std::function<dump_stream_t&(dump_stream_t&)> manipulator) noexcept {
        return manipulator(*this);
    }

    dump_stream_t& operator << (std::string str) noexcept {
        if(h_buff.empty() && s_buff.empty()){
            std::cout << str << std::endl;
            return *this;
        }

        s_buff = str;
        if(!s_buff.empty()){
            std::cout << h_buff << s_buff << std::endl;
        }
       
        return *this;
    }


    dump_stream_t& end_branching() noexcept { 
        if(!h_buff.empty()){
            if(s.substr(s.length()-2, 2) == ender && 
                s.substr(s.length()-4, 2) == line){
                s.replace(s.length()-4, 2, "");    
            }
            if(s.substr(s.length()-2, 2) == branch){
                s.replace(s.length()- branch.length(), branch.length(), ender);
            }
            h_buff = s;
            std::cout << h_buff << s_buff << std::endl;
            s_buff.erase();
        }

        return *this; 
    }

    dump_stream_t& start_branching() noexcept { 
        if(!s.empty() && s.substr(s.length()-2, 2) == ender){
            s.replace(s.length()-2, 2, "  ");
        }
        if(!s.empty() && s.substr(s.length()-2, 2) == branch){
            s.replace(s.length()-2, 2, line);
        }
        s.append(branch);
        h_buff = s;
        
        return *this; 
    }
};   


void dump() noexcept {  
    dump_stream_t dump_stream;
    dump_stream << "A";
}

}

#endif //FROSTMOURNE_AST_DUMP_HPP