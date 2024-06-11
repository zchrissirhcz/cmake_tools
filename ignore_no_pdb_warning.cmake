# Author: Zhuo Zhang <imzhuo@foxmail.com>
# Homepage: https://github.com/zchrissirhcz/cmake_tools
# Last update: 2024-06-12 00:00:00
cmake_minimum_required(VERSION 3.15)
include_guard()

#set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "/ignore:4099")
if(CMAKE_SYSTEM_NAME MATCHES "Windows")
  add_link_options("/ignore:4099")
endif()