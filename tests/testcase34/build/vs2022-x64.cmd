@echo off

set BUILD_DIR=vs2022-x64
if not exist %BUILD_DIR% md %BUILD_DIR%
cd %BUILD_DIR%

cmake ../.. -G "Visual Studio 17 2022" -A x64
cmake --build .
cd ..
pause