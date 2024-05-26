# Author: Zhuo Zhang <imzhuo@foxmail.com>
# Homepage: https://github.com/zchrissirhcz/cmake_tools
# Last update: 2024-05-26 23:30:00

if(DEBUG_SYMBOLS_INCLUDE_GUARD)
  return()
endif()
set(DEBUG_SYMBOLS_INCLUDE_GUARD 1)

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