#!/usr/bin/env bash

# Set Flutter version
FLUTTER_VERSION="3.24.5-stable"  # Change to the desired version

# Install Flutter
echo "Installing Flutter..."
git clone https://github.com/flutter/flutter.git -b $FLUTTER_VERSION
export PATH="$PATH:$(pwd)/flutter/bin"

# Verify installation
flutter doctor
