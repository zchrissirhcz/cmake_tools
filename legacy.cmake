# Different version of same compiler may support different compile options.
if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" AND CLANG_VERSION_STRING)
  message(STATUS "--- CLANG_VERSION_MAJOR is: ${CLANG_VERSION_MAJOR}")
  message(STATUS "--- CLANG_VERSION_MINOR is: ${CLANG_VERSION_MINOR}")
  message(STATUS "--- CLANG_VERSION_PATCHLEVEL is: ${CLANG_VERSION_PATCHLEVEL}")
  message(STATUS "--- CLANG_VERSION_STRING is: ${CLANG_VERSION_STRING}")
endif()


# rule5: 避免使用影子(shadow)变量
# 有时候会误伤, 例如eigen等开源项目, 可以手动关掉
if(OVERLOOK_ENABLE_RULE5)
  if(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
    overlook_list_append(OVERLOOK_C_FLAGS /we6244 /we6246 /we4457 /we4456)
    overlook_list_append(OVERLOOK_CXX_FLAGS /we6244 /we6246 /we4457 /we4456)
  else()
    overlook_list_append(OVERLOOK_C_FLAGS -Werror=shadow)
    overlook_list_append(OVERLOOK_CXX_FLAGS -Werror=shadow)
  endif()
endif()

# rule9: 避免把 unsigned int 和 int 直接比较
# 通常会误伤，例如 for 循环中。可以考虑关掉
if(OVERLOOK_ENABLE_RULE9)
  if(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
    overlook_list_append(OVERLOOK_C_FLAGS /we4018)
    overlook_list_append(OVERLOOK_CXX_FLAGS /we4018)
  elseif(CMAKE_C_COMPILER_ID MATCHES "GNU")
    overlook_list_append(OVERLOOK_C_FLAGS -Werror=sign-compare)
    overlook_list_append(OVERLOOK_CXX_FLAGS -Werror=sign-compare)
  elseif(CMAKE_C_COMPILER_ID MATCHES "Clang")
    overlook_list_append(OVERLOOK_C_FLAGS -Werror=sign-compare)
    overlook_list_append(OVERLOOK_CXX_FLAGS -Werror=sign-compare)
  endif()
endif()

# rule20: size_t 类型被转为更窄类型
# VC/VC++ 特有。 Linux 下的 gcc/clang 没有
# 有点过于严格了
if(OVERLOOK_ENABLE_RULE20)
  if(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
    overlook_list_append(OVERLOOK_C_FLAGS /we4267)
    overlook_list_append(OVERLOOK_CXX_FLAGS /we4267)
  endif()
endif()

## rule34: double 型转 float 型，可能有精度丢失（尤其在 float 较大时）
# MSVC 默认是放在 /W3
if(OVERLOOK_ENABLE_RULE34)
  if(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
    overlook_list_append(OVERLOOK_C_FLAGS /we4244)
    overlook_list_append(OVERLOOK_CXX_FLAGS /we4244)
  endif()
endif()