# Author: Zhuo Zhang <imzhuo@foxmail.com>
# Homepage: https://github.com/zchrissirhcz/cmake_tools
# Last update: 2024-05-26 23:30:00

# CMake generated Visual Studio Solution is multi-byte character on default
# VS2022 generated console application is unicode on default
# https://github.com/Jebbs/DSFML-C/issues/8
if (MSVC)
  add_compile_definitions(UNICODE _UNICODE)
endif()

