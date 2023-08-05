cmake_minimum_required(VERSION 3.15)

project(test_rule0)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
add_compile_options(-w)
include("../../overlook.cmake")

add_executable(test_rule0
  ${CMAKE_CURRENT_SOURCE_DIR}/main.c
)

