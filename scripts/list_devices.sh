#!/bin/bash
export ANDROID_SDK_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_SDK_HOME}/platform-tools

# Restart ADB, uncomment if your adb has trouble to locate the devices
# Newer adb versions work without restaring olders require it.
# adb kill-server
# adb start-server

# Get device list with manufacturer and model info
device_list=$(adb devices | grep -w 'device' | cut -f1 | xargs -I X sh -c 'c=$(adb -s X shell getprop ro.product.manufacturer); m=$(adb -s X shell getprop ro.product.model); s=$(echo X); echo "$s ($c $m)"')

# Check if device_list is empty
if [ -z "$device_list" ]; then
  # Show an Automator dialog for no devices found and exit
  osascript -e 'display dialog "No devices found. Please connect an Android device and try again." buttons {"Exit"} default button "Exit"' >/dev/null 2>&1
else
  # Pass device list to the next step
  echo "$device_list"
fi
