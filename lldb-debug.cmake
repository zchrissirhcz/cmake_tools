# Author: Zhuo Zhang <imzhuo@foxmail.com>
# Homepage: https://github.com/zchrissirhcz/cmake_tools
# Last update: 2024-06-12 00:00:00
cmake_minimum_required(VERSION 3.15)
include_guard()

if((CMAKE_C_COMPILER_ID MATCHES "Clang") OR (CMAKE_CXX_COMPILER_ID MATCHES "Clang"))
  set(lldb_required_debug_flag -g -fstandalone-debug)
  add_compile_options(${lldb_required_debug_flag})
  add_link_options(${lldb_required_debug_flag})
  message(STATUS ">>> USE_LLDB_DEBUG: YES")
else()
  message(STATUS ">>> USE_LLDB_DEBUG: NO")
endif()
