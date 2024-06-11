# Author: Zhuo Zhang <imzhuo@foxmail.com>
# Homepage: https://github.com/zchrissirhcz/cmake_tools
# Last update: 2024-06-12 00:00:00
cmake_minimum_required(3.15)
include_guard()

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
  add_compile_options("/EHsc")
endif()