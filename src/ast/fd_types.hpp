#include <boost/variant.hpp>

//TODO: Needed memory optimization, now we haw summ top wich have lagest size for all type 
using fd_types = boost::variant<
   bool,
   int,
   float,
   double,
   char
>;