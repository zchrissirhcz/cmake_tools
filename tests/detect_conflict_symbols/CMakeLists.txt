cmake_minimum_required(VERSION 3.20)
project(example)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# e.g. to use lld with Clang
#set(CMAKE_EXE_LINKER_FLAGS_INIT "-fuse-ld=lld")
#set(CMAKE_MODULE_LINKER_FLAGS_INIT "-fuse-ld=lld")
#set(CMAKE_SHARED_LINKER_FLAGS_INIT "-fuse-ld=lld")



add_library(foo STATIC
    foo.h
    foo.cpp
)

add_library(bar STATIC
    bar.h
    bar.cpp
)

#include(overlook.cmake)

#################################################
#
# Add whole archive when build static library
#
#################################################
function (overlook_add_whole_archive_flag lib output_var)
  #message(FATAL_ERROR "=== linker is: ${ANDROID_LD}")
  if(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
    message(STATUS "not supported yet")
  elseif(CMAKE_C_COMPILER_ID MATCHES "Clang" AND NOT ANDROID)
    set(${output_var} -Wl,-force_load ${lib} PARENT_SCOPE)
  else()
    #即使是NDK21并且手动传入ANDROID_LD=lld，依然要用ld的查重复符号的链接选项
    set(${output_var} -Wl,--whole-archive ${lib} -Wl,--no-whole-archive PARENT_SCOPE)
  endif()
endfunction()

####################################################################
# Add whole archive when build static library
# Usage:
#   add_whole_archive_flag(<lib> <output_var>)
function (add_whole_archive_flag lib output_var)
  if ("${CMAKE_CXX_COMPILER_ID}" MATCHES "MSVC")
    if (MSVC_VERSION GREATER 1900)
      set(${output_var} -WHOLEARCHIVE:$<TARGET_FILE:${lib}> PARENT_SCOPE)
    else ()
      message(WARNING "MSVC version is ${MSVC_VERSION}, /WHOLEARCHIVE flag cannot be set")
      set(${output_var} ${lib} PARENT_SCOPE)
    endif ()
  elseif("${CMAKE_CXX_COMPILER_ID}" MATCHES "GNU")
    set(${output_var} -Wl,--whole-archive ${lib} -Wl,--no-whole-archive PARENT_SCOPE)
  elseif("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang" AND CMAKE_SYSTEM_NAME MATCHES "Linux")
    set(${output_var} -Wl,--whole-archive ${lib} -Wl,--no-whole-archive PARENT_SCOPE)
  elseif ("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang" AND NOT ANDROID)
    set(${output_var} -Wl,-force_load ${lib} PARENT_SCOPE)
  elseif(ANDROID)
    set(${output_var} -Wl,--whole-archive ${lib} -Wl,--no-whole-archive PARENT_SCOPE)
  else()
    message(FATAL_ERROR ">>> add_whole_archive_flag not supported yet for current compiler: ${CMAKE_CXX_COMPILER_ID}")
  endif ()
endfunction ()


add_whole_archive_flag(foo safe_foo)
add_whole_archive_flag(bar safe_bar)

add_executable(testbed main.cpp)
#target_link_libraries(testbed foo bar) # prints "hello from foo.cpp"
#target_link_libraries(testbed bar foo) # prints "!! hello from bar.cpp"

message(STATUS ">>> safe_foo is: ${safe_foo}")
message(STATUS ">>> safe_bar is: ${safe_bar}")

target_link_libraries(testbed PUBLIC ${safe_foo} ${safe_bar})
#target_link_libraries(testbed "-Wl,-force_load,/home/zz/work/test/crashdown2/build/libfoo.a -Wl,-force_load,/home/zz/work/test/crashdown2/build/libbar.a" )

#target_link_options (testbed PUBLIC "LINKER:-force_load,foo")
#target_link_options (testbed PUBLIC "LINKER:-force_load,bar")
#clang++-6.0 ../main.cpp -Wl,--whole-archive ./libfoo.a -Wl,--no-whole-archive -Wl,--whole-archive ./libbar.a -Wl,--no-whole-archive
#clang++-6.0 ../main.cpp -Wl,-force_load;./libfoo.a -Wl,-force_load;./libbar.a