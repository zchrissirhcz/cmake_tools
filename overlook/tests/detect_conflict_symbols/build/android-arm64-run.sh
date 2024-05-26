#!/bin/bash

BUILD_DIR=android-arm64
DST_DIR=/data/local/tmp

test_macros()
{
    EXE_FILE=test_macros
    adb push $BUILD_DIR/$EXE_FILE $DST_DIR
    #adb push ../bg.jpg $DST_DIR
    adb shell "cd $DST_DIR; chmod +x $DST_DIR/$EXE_FILE; ./$EXE_FILE"
}

test_macros