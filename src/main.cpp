#include "cli.hpp"

int main(int argc, char* argv[]) {
    po::variables_map opt;
    parse_args(argc, argv, opt);

    return EXIT_SUCCESS;
}