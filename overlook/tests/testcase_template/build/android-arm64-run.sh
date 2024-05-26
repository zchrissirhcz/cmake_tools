#!/bin/bash

BUILD_DIR=android-arm64
#DST_DIR=/data/pixel
DST_DIR=/data/local/tmp
EXE_FILE=testbed

adb shell "mkdir -p $DST_DIR"
adb push $BUILD_DIR/$EXE_FILE $DST_DIR
adb shell "cd $DST_DIR; chmod +x $DST_DIR/$EXE_FILE; ./$EXE_FILE"

# adb pull /data/pixel/sky_rgb_naive.bmp ./
# adb pull /data/pixel/sky_rgb_idxopt.bmp ./
# adb pull /data/pixel/sky_rgb_asimd.bmp ./
# adb pull /data/pixel/sky_rgb_asm.bmp ./
# adb pull /data/pixel/sky_rgb_opencv.bmp ./

# adb pull /data/pixel/sky_rgb_inplace_naive.bmp ./
# adb pull /data/pixel/sky_rgb_inpalce_naive2.bmp ./
# adb pull /data/pixel/sky_rgb_inplace_asm.bmp ./
# adb pull /data/pixel/sky_rgb_inplace_opencv.bmp ./

# adb pull /data/pixel/sky_thresh60_naive.png ./
# adb pull /data/pixel/sky_thresh60_opencv.png ./
# adb pull /data/pixel/sky_thresh60_asimd.png ./
# adb pull /data/pixel/sky_thresh60_asm.png ./

adb pull $DST_DIR/sky_flip_vert_rgb_opencv.png ./
adb pull $DST_DIR/sky_flip_vert_rgb_naive.png ./
adb pull $DST_DIR/sky_flip_vert_rgb_bylines.png ./


adb pull $DST_DIR/sky_flip_vert_gray_opencv.png ./
adb pull $DST_DIR/sky_flip_vert_gray_naive.png ./
adb pull $DST_DIR/sky_flip_vert_gray_bylines.png ./