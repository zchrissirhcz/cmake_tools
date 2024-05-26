cmake_minimum_required(VERSION 3.15)

project(test_rule35)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_BUILD_TYPE Debug)

include("../../overlook.cmake")

add_executable(test_rule35
  ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

