#!/bin/bash

ANDROID_NDK=~/soft/android-ndk-r21b
#ANDROID_NDK=/Users/chris/soft/android-ndk-r21
TOOLCHAIN=$ANDROID_NDK/build/cmake/android.toolchain.cmake

echo "ANDROID_NDK is $ANDROID_NDK"
echo "TOOLCHAIN is: $TOOLCHAIN"

BUILD_DIR=android-arm64
mkdir -p $BUILD_DIR
cd $BUILD_DIR

cmake -G Ninja \
    -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN \
    -DANDROID_LD=lld \
    -DANDROID_ABI="arm64-v8a" \
    -DANDROID_PLATFORM=android-24 \
    -DCMAKE_BUILD_TYPE=Release \
    ../..

#ninja
#cmake --build . --verbose
cmake --build .

cd ..
