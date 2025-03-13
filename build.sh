#!/bin/bash

# Print commands for debugging
set -x

# Initialize git submodules
git submodule update --init --recursive

# Check if submodules were initialized correctly
ls -la rszin/themes/dario

# Navigate to the Hugo project directory
cd rszin

# Build the Hugo site
hugo --gc --minify

# Return to the root directory
cd ..

# Print success message
echo "Build completed successfully!" 