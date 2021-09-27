cmake_minimum_required(VERSION 3.15)

project(testcase12)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include("../../overlook.cmake")

add_executable(testcase12
  ${CMAKE_CURRENT_SOURCE_DIR}/main.c
)

