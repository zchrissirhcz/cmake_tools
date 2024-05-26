# Author: Zhuo Zhang <imzhuo@foxmail.com>
# Homepage: https://github.com/zchrissirhcz/cmake_tools
# Last update: 2024-05-26 23:30:00

if(MSVC_EHSC_INCLUDE_GUARD)
  return()
endif()
set(MSVC_EHSC_INCLUDE_GUARD 1)

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
  add_compile_options("/EHsc")
endif()