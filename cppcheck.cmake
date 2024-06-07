###############################################################
#
# cppcheck, 开启静态代码检查, 主要是检查编译器检测不到的UB
#   注: 目前只有终端下能看到对应输出，其中 NDK 下仅第一次输出
#
###############################################################

if(CPPCHECK_INCLUDE_GUARD)
  return()
endif()
set(CPPCHECK_INCLUDE_GUARD 1)

# Usage:
# add_executable(hello hello.cpp)
# apply_cppcheck(hello)
function(apply_cppcheck TARGET)
  find_program(CMAKE_CXX_CPPCHECK NAMES cppcheck)

  # collecting absolute paths for each source file in the given target
  get_target_property(target_sources ${TARGET} SOURCES)
  get_target_property(target_source_dir ${TARGET} SOURCE_DIR)
  set(src_path_lst "")
  foreach(target_source ${target_sources})
    if(IS_ABSOLUTE ${target_source})
      set(target_source_absolute_path ${target_source})
    else()
      set(target_source_absolute_path ${target_source_dir}/${target_source})
    endif()
    list(APPEND src_path_lst ${target_source_absolute_path})
  endforeach()

  set(cppcheck_raw_command "cppcheck --enable=warning --inconclusive --force --inline-suppr ${src_path_lst}")
  string(REPLACE " " ";" cppcheck_converted_command "${cppcheck_raw_command}")
  add_custom_target(
    cppcheck
    COMMAND ${cppcheck_converted_command}
  )
  add_dependencies(${TARGET} cppcheck)
endfunction()