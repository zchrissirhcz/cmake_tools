cmake_minimum_required(VERSION 3.15)

project(test_rule25)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include("../../overlook.cmake")

add_executable(test_rule25
  ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

