# Author: Zhuo Zhang <imzhuo@foxmail.com>
# Homepage: https://github.com/zchrissirhcz/cmake_tools
# Last update: 2024-05-26 23:30:00

if(POSTFIX_INCLUDE_GUARD)
  return()
endif()
set(POSTFIX_INCLUDE_GUARD 1)

# globally
set(CMAKE_DEBUG_POSTFIX "_d")

# per-target
# set_target_properties(hello PROPERTIES DEBUG_POSTFIX "_d")
