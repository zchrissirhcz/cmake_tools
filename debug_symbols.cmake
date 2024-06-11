# Author: Zhuo Zhang <imzhuo@foxmail.com>
# Homepage: https://github.com/zchrissirhcz/cmake_tools
# Last update: 2024-06-12 00:00:00
cmake_minimum_required(3.15)
include_guard()

# globally
if(MSVC)
  set(CVPKG_DEBUG_FLAGS "/Zi")
elseif((CMAKE_C_COMPILER_ID MATCHES "GNU") OR (CMAKE_CXX_COMPILER_ID MATCHES "GNU"))
  set(CVPKG_DEBUG_FLAGS "-g")
elseif((CMAKE_C_COMPILER_ID MATCHES "Clang") OR (CMAKE_CXX_COMPILER_ID MATCHES "Clang"))
  set(CVPKG_DEBUG_FLAGS "-g -fstandalone-debug")
endif()

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CVPKG_DEBUG_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CVPKG_DEBUG_FLAGS}")

# per-target
# target_compile_options(example_target PRIVATE
#   $<$<CXX_COMPILER_ID:MSVC>:/Zi>
#   $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-g>
# )