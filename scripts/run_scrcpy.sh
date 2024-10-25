#!/bin/bash
# Android sdk and platform tools path
export ANDROID_SDK_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_SDK_HOME}/platform-tools
# Path of scrcpy
export PATH=${PATH}:/usr/local/bin/:/opt/homebrew/bin/

if [[ "$1" == "false" ]]
then
  echo "User canceled"
  exit 0;
fi

for f in "$@"
do
  d=$(echo $f | cut -d ' ' -f1)
  echo "Start scrpy on '$d'"
  scrcpy -s $d &
done
