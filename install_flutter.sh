#!/usr/bin/env bash

# Set Flutter version
FLUTTER_VERSION="3.24.5"  # Change to the desired version

# Install Flutter
echo "Installing Flutter..."
git clone https://github.com/flutter/flutter.git -b $FLUTTER_VERSION
export PATH="$PATH:$(pwd)/flutter/bin"

echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install clang libgtk-3-dev google-chrome-stable -y

# Verify installation
flutter doctor
