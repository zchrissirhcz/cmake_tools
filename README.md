# OverLook

<img alt="GitHub" src="https://img.shields.io/github/license/zchrissirhcz/overlook">

OverLook: reporting serious C/C++ compilation warnings in advance with cmake.

## Intro

Good programmers should not ignore warnings. Treating all warnings as errors, however, is not pratical, since many warnings usually don't affect compuation result. Here comes the contradiction: which warnings should be considered carefully?

In [overlook.cmake](overlook.cmake), I put together **30 serious compilation warnings' checking** (treated as error), many of which is from pratical project experience, and does resolve severe bugs, including segfaults caused by address truncation, memory leaks caused by missing including header file, trap caused by missing return value, etc. These severe bugs can not be inspected by famous tools like AddressSanitizer, Valgrind, VLD, but [overlook.cmake](overlook.cmake) can.

## Usage

Just add oneline into your `CMakeLists.txt`:

```cmake
include("overlook.cmake")
```

A simple full example:
```cmake
cmake_minimum_required(VERSION 3.15)

project(hello)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include("cmake/overlook.cmake") # Add this line

add_executable(hello hello.cpp)
```