cmake_minimum_required(VERSION 3.9)
project(code)

set(CMAKE_CXX_STANDARD 17)
set( CMAKE_VERBOSE_MAKEFILE off)

set(Boost_INCLUDE_DIR /usr/local/Cellar/boost/1.65.0/include/) 
set(Boost_LIBRARY_DIR /usr/local/Cellar/boost/1.65.0/lib/)

find_package(Boost 1.65.0 COMPONENTS program_options REQUIRED)

include_directories(${Boost_INCLUDE_DIR})
link_directories(${Boost_LIBRARY_DIR})

set(SOURCE_FILES src/main.cpp)
add_executable(code ${SOURCE_FILES})

TARGET_LINK_LIBRARIES( code LINK_PUBLIC ${Boost_LIBRARIES} )