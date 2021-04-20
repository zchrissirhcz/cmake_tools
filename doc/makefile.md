`cmake ../.. -DOVERLOOK_VERBOSE=ON` 得到：

```
-- --- OVERLOOK_C_FLAGS are:  -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=shadow -Werror=return-local-addr -Werror=uninitialized -Werror=format -Werror=array-bounds -Werror=pointer-arith -fno-common -Werror=free-nonheap-object -Werror=int-to-pointer-cast -Werror=comment -Werror=unused-value

-- --- OVERLOOK_CXX_FLAGS are:  -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Werror=shadow -Werror=return-local-addr -Werror=uninitialized -Werror=format -Werror=array-bounds -Werror=pointer-arith -Werror=free-nonheap-object -Werror=int-to-pointer-cast -Werror=comment -Werror=unused-value -Werror=write-strings
```

使用 makefile （或命令行直接调用 gcc/g++/clang/clang++ ）时，传入上述编译选项即可，例如

```bash
gcc xxx.c -Werror=implicit-function-declaration
```