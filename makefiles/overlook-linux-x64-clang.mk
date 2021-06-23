OVERLOOK_C_FLAGS = -Werror=implicit-function-declaration -Werror=implicit-int -Werror=incompatible-pointer-types -Werror=return-type -Werror=shadow -Werror=return-stack-address -Werror=uninitialized -Werror=format -Werror=int-conversion -Werror=array-bounds -Werror=pointer-arith -fno-common -Werror=int-to-pointer-cast -Werror=unknown-escape-sequence -Werror=comment -Werror=unused-value -Werror=unused-comparison -Werror=multichar

OVERLOOK_CXX_FLAGS = -Werror=implicit-function-declaration -Werror=implicit-int -Werror=incompatible-pointer-types -Werror=return-type -Werror=shadow -Werror=return-stack-address -Werror=uninitialized -Werror=format -Werror=int-conversion -Werror=array-bounds -Werror=int-to-pointer-cast -Werror=unknown-escape-sequence -Werror=comment -Werror=unused-value -Werror=unused-comparison -Werror=writable-strings -Werror=multichar

CFLAGS += ${OVERLOOK_C_FLAGS}
CXXFLAGS += ${OVERLOOK_CXX_FLAGS}

