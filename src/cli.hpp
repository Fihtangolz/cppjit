#ifndef FROSTMOURNE_CLI_HPP
#define FROSTMOURNE_CLI_HPP

#include <iostream>
#include <cstdlib>

#include <boost/program_options.hpp>

namespace po = boost::program_options;
void parse_args(int& argc, char* argv[], po::variables_map& opt) noexcept {
    try{
        po::options_description desc("Allowed options");
        desc.add_options()
            ("help", "produce help message");
        
        po::store(po::parse_command_line(argc, argv, desc), opt);
        po::notify(opt);    

        if (opt.count("help")) {
            std::cout << desc << "\n";
            std::exit(EXIT_SUCCESS);
        }
    }catch(std::exception& e){
        std::cerr << "error: " << e.what() << "\n";
        std::exit(EXIT_FAILURE);
    }catch(...){
        std::cerr << "Exception of unknown type!\n";
    }
}

#endif //FROSTMOURNE_CLI_HPP