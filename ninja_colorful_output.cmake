# Author: Zhuo Zhang <imzhuo@foxmail.com>
# Homepage: https://github.com/zchrissirhcz/cmake_tools
# Last update: 2024-05-26 23:30:00
cmake_minimum_required(VERSION 3.15)
include_guard()

# When building a CMake-based project, Ninja may speedup the building speed, comparing to Make.
# However, with `-GNinja` specified, compile errors are with no obvious colors.
# This cmake plugin just solve this mentioned problem, giving colorful output for Ninja.
## References: https://medium.com/@alasher/colored-c-compiler-output-with-ninja-clang-gcc-10bfe7f2b949

add_compile_options(
  "$<$<COMPILE_LANG_AND_ID:CXX,GNU>:-fdiagnostics-color=always>"
  "$<$<COMPILE_LANG_AND_ID:CXX,Clang>:-fcolor-diagnostics>"
  "$<$<COMPILE_LANG_AND_ID:C,GNU>:-fdiagnostics-color=always>"
  "$<$<COMPILE_LANG_AND_ID:C,Clang>:-fcolor-diagnostics>"
)