#!/usr/bin/env bash

# Set Flutter version
FLUTTER_VERSION="stable"

# Install Flutter
echo "Installing Flutter..."
git clone https://github.com/flutter/flutter.git -b $FLUTTER_VERSION
export PATH="$PATH:$(pwd)/flutter/bin"

# Install dependencies
echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install -y clang libgtk-3-dev google-chrome-stable android-sdk

# Configure Flutter
echo "Configuring Flutter..."
export CHROME_EXECUTABLE=/usr/bin/google-chrome
flutter config --android-sdk /path/to/android-sdk

# Verify Flutter installation
flutter doctor
