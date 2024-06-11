# Author: Zhuo Zhang <imzhuo@foxmail.com>
# Homepage: https://github.com/zchrissirhcz/cmake_tools
# Last update: 2024-05-26 23:30:00
cmake_minimum_required(3.15)
include_guard()

# https://stackoverflow.com/questions/543203/cmake-runtime-output-directory-on-windows

# Save libs and executables in the same directory
# MSVC will have value for EXECUTABLE_OUTPUT_PATH on default. Now we ignore it.
if(NOT EXECUTABLE_OUTPUT_PATH)
  set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}" CACHE PATH "Output directory for applications")
  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${EXECUTABLE_OUTPUT_PATH} CACHE INTERNAL "") # static
  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${EXECUTABLE_OUTPUT_PATH} CACHE INTERNAL "") # static, debug
  set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${EXECUTABLE_OUTPUT_PATH} CACHE INTERNAL "") # static, release
  
  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${EXECUTABLE_OUTPUT_PATH} CACHE INTERNAL "") # shared
  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${EXECUTABLE_OUTPUT_PATH} CACHE INTERNAL "") # shared, debug
  set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${EXECUTABLE_OUTPUT_PATH} CACHE INTERNAL "") # shared, release
  
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${EXECUTABLE_OUTPUT_PATH} CACHE INTERNAL "") # exe
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${EXECUTABLE_OUTPUT_PATH} CACHE INTERNAL "") # exe, debug
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${EXECUTABLE_OUTPUT_PATH} CACHE INTERNAL "") # exe, release
endif()
