#!/bin/bash
export ANDROID_SDK_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_SDK_HOME}/platform-tools

adb kill-server
adb start-server

adb devices | grep -w 'device' | cut -f1 | xargs -I X sh -c 'c=$(adb -s X shell getprop ro.product.manufacturer);m=$(adb -s X shell getprop ro.product.model);s=$(echo X);echo "$s ($c $m)"'
