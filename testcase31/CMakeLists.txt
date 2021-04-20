cmake_minimum_required(VERSION 3.15)

project(testcase)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include("../overlook.cmake")

add_executable(testbed
  testbed.cpp
)

