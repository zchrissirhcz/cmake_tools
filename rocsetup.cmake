cmake_minimum_required(VERSION 3.25)

function(print_args)
  math(EXPR LAST_INDEX "${CMAKE_ARGC}-1")
  foreach(i RANGE 1 ${LAST_INDEX})
    message("Argument ${i}: ${CMAKE_ARGV${i}}")
  endforeach()
endfunction()


function(parse_args)
  math(EXPR LAST_INDEX "${CMAKE_ARGC}-1")
  set(options -p -a)
  set(current_option "")
  foreach(i RANGE 1 ${LAST_INDEX})
    # message("Argument ${i}: ${CMAKE_ARGV${i}}")
    set(arg "${CMAKE_ARGV${i}}")
    if(${arg} IN_LIST options)
      set(current_option "${arg}")
    else()
      if(current_option STREQUAL "-p")
        set(ROCBUILD_PLATFORM "${arg}" PARENT_SCOPE)
      elseif(current_option STREQUAL "-a")
        set(ROCBUILD_ARCH "${arg}" PARENT_SCOPE)
      endif()
      set(current_option "")
    endif()
  endforeach()
endfunction()

function(set_generator)
  if(ROCBUILD_PLATFORM STREQUAL "vs2022")
    set(ROCBUILD_GENERATOR "Visual Studio 17 2022")
  elseif(ROCBUILD_ARCH STREQUAL "vs2019")
    set(ROCBUILD_GENERATOR "Visual Studio 16 2019")
  endif()

  if(ROCBUILD_GENERATOR MATCHES "Visual Studio")
    if(ROCBUILD_ARCH MATCHES "x64")
      set(ROCBUILD_GENERATOR_EXTRA -A x64)
    elseif(ROCBUILD_ARCH MATCHES "x86")
      set(ROCBUILD_GENERATOR_EXTRA -A win32)
    endif()
  endif()
  set(ROCBUILD_GENERATOR ${ROCBUILD_GENERATOR} PARENT_SCOPE)
  set(ROCBUILD_GENERATOR_EXTRA ${ROCBUILD_GENERATOR_EXTRA} PARENT_SCOPE)
endfunction()

#print_args()
parse_args()
set_generator()

message(STATUS "ROCBUILD_PLATFORM: ${ROCBUILD_PLATFORM}")
message(STATUS "ROCBUILD_ARCH: ${ROCBUILD_ARCH}")
message(STATUS "ROCBUILD_GENERATOR: ${ROCBUILD_GENERATOR}")

set(cmake_arguments
  -S . -B build 
  -G ${ROCBUILD_GENERATOR} ${ROCBUILD_GENERATOR_EXTRA} 
  -DROCBUILD_PLATFORM=${ROCBUILD_PLATFORM} -DROCBUILD_ARCH=${ROCBUILD_ARCH}
)

string(REPLACE ";" " " cmake_arguments_str "${cmake_arguments}")
message(STATUS "CMake arguments: ${cmake_arguments_str}")
execute_process(
  COMMAND cmake ${cmake_arguments}
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  RESULT_VARIABLE result
  OUTPUT_VARIABLE output
  ERROR_VARIABLE error_output
)

message("${result}")
message("${output}")
message("${error_output}")

