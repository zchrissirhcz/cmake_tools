# OverLook

<img alt="GitHub" src="https://img.shields.io/github/license/zchrissirhcz/overlook">

OverLook: save your time(life) via reporting serious C/C++ compilation warnings in advance with CMake.

## Intro

Good programmers should not ignore warnings. Treating all warnings as errors, however, is not practical (due to time cost, not affect compute result, etc). Here comes the contradiction: which warnings should be considered carefully?

In [overlook.cmake](overlook.cmake), I collect **33 serious compilation warnings' checking, treat corresponding C/C++ flags as error**. Many of them come from practical project experience, and does resolve severe bugs, including segfaults caused by address truncation, memory leaks caused by missing including header file, trap caused by missing return value, etc. These severe bugs can not be inspected by famous tools like AddressSanitizer, Valgrind, VLD, but [overlook.cmake](overlook.cmake) can.

## Getting started

```bash
# Get it!
git clone https://github.com/zchrissirhcz/overlook

# Copy to own project
cp overlook/overlook.cmake /path/to/your/cmake-based-project/
```

**Globally with overlook flags**
```cmake
include("overlook.cmake")
```

**Per-target with overlook flags**
```cmake
set(OVERLOOK_FLAGS_GLOBAL OFF)
include("overlook.cmake")
target_compile_options(your_target_name
    PRIVATE # or PUBLIC
    ${OVERLOOK_CXX_FLAGS} # for C++
    # ${OVERLOOK_C_FLAGS} for C
)
```

**A simple full example**
```cmake
cmake_minimum_required(VERSION 3.15)
project(hello)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
include("cmake/overlook.cmake") # Add this line
add_executable(hello hello.cpp)
```

## Advanced Usage

**Disable a specific warning**

For example, you would like to treat "shadowed variable" warning as warning, instead of error, then search `shadow` in `overlook.cmake`, and comment that rule out (via `#`):
```
# 5. 避免使用影子(shadow)变量
# 有时候会误伤，例如eigen等开源项目，可以手动关掉
#if(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
#  overlook_list_append(OVERLOOK_C_FLAGS /we6244 /we6246 /we4457 /we4456)
#  overlook_list_append(OVERLOOK_CXX_FLAGS /we6244 /we6246 /we4457 /we4456)
#else()
#  overlook_list_append(OVERLOOK_C_FLAGS -Werror=shadow)
#  overlook_list_append(OVERLOOK_CXX_FLAGS -Werror=shadow)
#endif()
```

**Options**
You may override the following options's:
```cmake
option(USE_OVERLOOK_FLAGS "use safe compilation flags?" ON)
option(OVERLOOK_STRICT_FLAGS "strict c/c++ flags checking?" OFF)
option(USE_CPPCHECK "use cppcheck for static checkingg?" OFF)
option(OVERLOOK_VERBOSE "verbose output?" OFF)
```


## What about Makefile?

Go to [makefiles](makefiles/README.md) directory for details.


## What about Visual Studio?

You can generate Visual Studio Solution (.sln) via either:
- cmake command line: cmake -G "Visual Studio 16 2019" -A x64 /path/to/CMakeLists.txt
- cmake-gui

You may also directly open an cmake-based C/C++ project via VS2019.

