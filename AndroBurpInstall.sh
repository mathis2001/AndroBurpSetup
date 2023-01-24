#!/bin/bash


CERT="path/to/burp/certificate"

if ! [ -x "$(command -v adb)" ]; then
  echo 'Error: ADB is not installed.'
  sudo apt install adb
fi

if [ ! -f $CERT ]; then
  echo "Error: Burp Suite certificate not found at $CERT" >&2
  exit 1
fi

adb push $CERT /sdcard/

adb root
sleep 3
adb remount
adb shell "mv /sdcard/$CERT /system/etc/security/cacerts && chmod 644 /system/etc/security/cacerts/$CERT"

echo "Burp Suite certificate installed successfully!"
