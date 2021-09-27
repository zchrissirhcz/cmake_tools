cmake_minimum_required(VERSION 3.15)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(demo)

add_executable(testcaseX
  ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)