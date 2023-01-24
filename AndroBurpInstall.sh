#!/bin/bash

# Assign the location of the Burp Suite certificate to a variable
CERT="9a5ba575.0"

# Check if ADB is installed
if ! [ -x "$(command -v adb)" ]; then
  echo 'Error: ADB is not installed.'
  sudo apt install adb
fi

if [ ! -f $CERT ]; then
  echo "Error: Burp Suite certificate not found at $CERT_LOCATION" >&2
  exit 1
fi

adb push $CERT /sdcard/

adb root
sleep 3
adb remount
adb shell "mv /sdcard/$CERT /system/etc/security/cacerts && chmod 644 /system/etc/security/cacerts/$CERT"

echo "Burp Suite certificate installed successfully!"

