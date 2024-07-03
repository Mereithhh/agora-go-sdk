#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" != "0" ]; then
  SUDO='sudo'
else
  SUDO=''
fi

# Check the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  $SUDO cp -r agoraserver/agora_sdk/*.so /usr/lib/
  $SUDO ldconfig
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  $SUDO cp -r agoraserver/agora_sdk_mac/*.dylib /usr/local/lib/
  $SUDO update_dyld_shared_cache
else
  echo "Unsupported operating system"
  exit 1
fi