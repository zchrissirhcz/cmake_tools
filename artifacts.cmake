# Author: Zhuo Zhang <imzhuo@foxmail.com>
# Homepage: https://github.com/zchrissirhcz/cmake_tools
# Last update: 2024-06-12 00:00:00
cmake_minimum_required(VERSION 3.15)
include_guard()

if(DEFINED ENV{ARTIFACTS_DIR})
  set(ARTIFACTS_DIR "$ENV{ARTIFACTS_DIR}")
else()
  message(WARNING "ARTIFACTS_DIR env var not defined, abort")
endif()

