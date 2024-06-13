cmake_minimum_required(VERSION 3.25)
project(test_copy_dll)
include(../../copy_dll.cmake)
add_executable(test test.cpp)
set(OpenCV_DIR "C:/pkgs/opencv/4.9.0/x64/vc16/lib")
find_package(OpenCV REQUIRED)
target_link_libraries(test PRIVATE ${OpenCV_LIBS})
cvpkg_copy_required_dlls(test ${CMAKE_BINARY_DIR})
# This will copy 5 dll files:
# opencv_videoio_ffmpeg490_64.dll
# opencv_videoio_msmf490_64.dll
# opencv_videoio_msmf490_64d.dll
# opencv_world490.dll
# opencv_world490d.dll