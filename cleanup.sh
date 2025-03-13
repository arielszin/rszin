#!/bin/bash

# Print commands for debugging
set -x

echo "Starting cleanup process..."

# Remove .DS_Store files
echo "Removing .DS_Store files..."
find . -name ".DS_Store" -delete

# Remove any backup or temporary files
echo "Removing backup and temporary files..."
find . -name "*.bak" -o -name "*.tmp" -o -name "*.log" -delete

# Remove any unnecessary directories
echo "Removing unnecessary directories..."
# Add directories to remove here if needed
# rm -rf some_directory

# Update .gitmodules to use HTTPS instead of SSH
echo "Updating .gitmodules to use HTTPS..."
if [ -f ".gitmodules.new" ]; then
  mv .gitmodules.new .gitmodules
fi

# Update build script
echo "Updating build script..."
if [ -f "build.sh.new" ]; then
  mv build.sh.new build.sh
  chmod +x build.sh
fi

echo "Cleanup completed successfully!" 