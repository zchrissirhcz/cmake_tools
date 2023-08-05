cmake_minimum_required(VERSION 3.15)

project(test_rule14)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include("../../overlook.cmake")

add_executable(test_rule14
  ${CMAKE_CURRENT_SOURCE_DIR}/main.c
)

