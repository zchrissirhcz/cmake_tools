cmake_minimum_required(VERSION 3.15)

project(testcase22)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include("../../overlook.cmake")

add_executable(testcase22
  ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp
)

