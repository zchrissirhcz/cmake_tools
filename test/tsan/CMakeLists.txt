cmake_minimum_required(VERSION 3.25)
project(test_tsan)
include(../../tsan.cmake)
add_executable(data_race_test data_race_test.cpp)
add_executable(thread_leak_test thread_leak_test.cpp)