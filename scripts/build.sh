#!/bin/bash

# Exit on error
set -e

# Configuration
APP_NAME="Plastic to Fuel"
VERSION=$(grep 'version:' pubspec.yaml | awk '{print $2}' | cut -d'+' -f1)
BUILD_NUMBER=$(grep 'version:' pubspec.yaml | awk '{print $2}' | cut -d'+' -f2)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Starting build process for $APP_NAME v$VERSION ($BUILD_NUMBER)${NC}"

# Check environment variables
if [ -z "$KEYSTORE_PASSWORD" ] || [ -z "$KEY_ALIAS" ] || [ -z "$KEY_PASSWORD" ]; then
    echo -e "${RED}Error: Missing keystore environment variables${NC}"
    exit 1
fi

# Clean build directory
echo -e "${YELLOW}Cleaning previous builds...${NC}"
flutter clean

# Get dependencies
echo -e "${YELLOW}Getting dependencies...${NC}"
flutter pub get

# Run tests
echo -e "${YELLOW}Running tests...${NC}"
flutter test

# Build Android release
echo -e "${YELLOW}Building Android release...${NC}"
flutter build apk --release
flutter build appbundle --release

# Build iOS release (only on macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "${YELLOW}Building iOS release...${NC}"
    flutter build ios --release --no-codesign
fi

# Generate build info
BUILD_INFO="build_info.txt"
echo "Build Information" > $BUILD_INFO
echo "----------------" >> $BUILD_INFO
echo "App: $APP_NAME" >> $BUILD_INFO
echo "Version: $VERSION" >> $BUILD_INFO
echo "Build: $BUILD_NUMBER" >> $BUILD_INFO
echo "Date: $(date)" >> $BUILD_INFO
echo "Commit: $(git rev-parse HEAD)" >> $BUILD_INFO

# Create release directory
RELEASE_DIR="release"
mkdir -p $RELEASE_DIR

# Copy builds to release directory
cp build/app/outputs/flutter-apk/app-release.apk "$RELEASE_DIR/${APP_NAME// /_}_v${VERSION}_${BUILD_NUMBER}.apk"
cp build/app/outputs/bundle/release/app-release.aab "$RELEASE_DIR/${APP_NAME// /_}_v${VERSION}_${BUILD_NUMBER}.aab"
cp $BUILD_INFO "$RELEASE_DIR/"

echo -e "${GREEN}Build completed successfully!${NC}"
echo -e "${GREEN}Release files are available in the '$RELEASE_DIR' directory${NC}" 