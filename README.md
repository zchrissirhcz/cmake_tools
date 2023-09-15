# Overlook

<img alt="GitHub" src="https://img.shields.io/github/license/zchrissirhcz/overlook"> ![Ubuntu](https://img.shields.io/badge/Ubuntu-333333?style=flat&logo=ubuntu) ![Windows](https://img.shields.io/badge/Windows-333333?style=flat&logo=windows&logoColor=blue) ![macOS](https://img.shields.io/badge/-macOS-333333?style=flat&logo=apple) ![android](https://img.shields.io/badge/-Android-333333?style=flat&logo=Android)


Overlook: a cmake plugin for safer c/c++ programming.

## Introduction

[overlook.cmake](overlook.cmake) selects C/C++ warnings that are easy to ignore but are serious, and advances detection and reporting to compile time by treating them as errors. It helps people write safer code, avoiding abnormal results that can be compiled and linked but run.


## Purpose

Good programmers should not ignore warnings. Treating all warnings as errors, however, is not practical due to reasons:
- time cost
- not own scratch project, too much to modify
- not affect result

Moreover, on the GCC/Clang common flags:
- `-Wall` does not mean `turn on all warnings`, missing flags like `-Wnon-virtual-dtor`
- `-Wpedantic` check more flags that `-Wall`, but still missing flags like `-Wnon-virtual-dtor`
- `-Weffc++` may cover more flags

Here comes the contradiction: which warnings should be considered carefully?

In [overlook.cmake](overlook.cmake), there are **36 serious compilation warnings' checking, treat corresponding C/C++ flags as error**, with corresponding unit tests (See [tests](tests)). Most are extracted from practical cross-platform projects, and does resolve severe bugs such as:
- Segmentation Faults(caused by address truncation)
- Memory leaks(caused by missing including header file)
- Trap(caused by missing return value)

These severe bugs can not be inspected by famous tools like AddressSanitizer, Valgrind, VLD, but [overlook.cmake](overlook.cmake) can. People may also use [clang-tidy](https://clang.llvm.org/extra/clang-tidy/), which will report more compile warnings (instead of compile errors).

## Usage

**Globally**
```cmake
include("overlook.cmake")  # ! Put this line in the end of your Root CMakeLists.txt
```

**Or, Per-target**
```cmake
set(OVERLOOK_FLAGS_GLOBAL OFF)
include("overlook.cmake")
target_compile_options(your_target_name
    PRIVATE # or PUBLIC
    ${OVERLOOK_CXX_FLAGS} # for C++
    # ${OVERLOOK_C_FLAGS} for C
)
```


## ♥️ Thanks

If you like this project, welcome Star!

[![Star History Chart](https://api.star-history.com/svg?repos=zchrissirhcz/overlook&type=Date)](https://star-history.com/#zchrissirhcz/overlook&Date)


## Advanced Usage

**Disable a specific warning**

Compile your code with overlook.cmake applyed, see that error nessage's type/number, search it in overlook.cmake and comment it out via inserting `#`, such as:
```cmake
#if(OVERLOOK_ENABLE_RULE32)
#  if(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
#    if(CMAKE_CXX_COMPILER_VERSION GREATER 7.5)
#      overlook_list_append(OVERLOOK_CXX_FLAGS -Werror=class-memaccess)
#    endif()
#  endif()
#endif()
```

**Options**

You may override the following options:

```cmake
option(OVERLOOK_APPLY_FLAGS_GLOBAL "Apply overlook globally?" ON)
option(OVERLOOK_VERBOSE            "Verbose output?"          OFF)
```

## Debugging

If you're using Overlook, but it seems not work, possible cases:

1. The overlook.cmake you are using is not the latest.
2. Overlook's rules are suppressed due to your `add_definitions(-w)`, which ignore all warnings thus overlook won't work.
3. Your compiler is not covered by Overlook. If so, text me or create an issue.

## What about Makefile?

Go to [makefiles](makefiles/README.md) directory for details.


## What about Visual Studio?

You can generate Visual Studio Solution (.sln) via either:
- cmake command line: `cmake -G "Visual Studio 17 2022" -A x64 /directory/that/contains/CMakeLists.txt`
- cmake-gui

You may also directly open an cmake-based C/C++ project via VS2015/VS2017/VS2019/VS2022.

## References

- https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines
- https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html