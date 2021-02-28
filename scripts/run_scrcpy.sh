#!/bin/bash
export ANDROID_SDK_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_SDK_HOME}/platform-tools

if [[ "$1" == "false" ]]
then
  echo "User canceled"
  exit 0;
fi

for f in "$@"
do
	echo "$f"
	/usr/local/bin/scrcpy -s $f &
done