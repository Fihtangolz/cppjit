cmake_minimum_required(VERSION 3.9)
project(frostmourne)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_VERBOSE_MAKEFILE off)

set(Boost_INCLUDE_DIR /usr/local/Cellar/boost/1.65.0/include/) 
set(Boost_LIBRARY_DIR /usr/local/Cellar/boost/1.65.0/lib/)

find_package(Boost 1.65.0 COMPONENTS program_options REQUIRED)

file(GLOB_RECURSE SOURCE_FILES "src/*.cpp")
file(GLOB_RECURSE HEADERS_FILES "src/*.hpp")

include_directories(${Boost_INCLUDE_DIR})
link_directories(${Boost_LIBRARY_DIR})

add_executable(fmj ${SOURCE_FILES})

target_link_libraries(fmj LINK_PUBLIC ${Boost_LIBRARIES})