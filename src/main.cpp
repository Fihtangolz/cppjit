#include <algorithm>
#include <iostream>
#include <boost/program_options.hpp>

#include "cli.hpp"
#include "parser/parser.y"

int main(int argc, char* argv[]) {
//    po::variables_map opt;
//    parse_args(argc, argv, opt);
    parse("     #");

    return EXIT_SUCCESS;
}