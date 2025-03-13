#!/bin/bash

# Print commands for debugging
set -x

# Initialize git submodules
git submodule update --init --recursive

# Check if submodules were initialized correctly
ls -la rszin/themes/dario

# Check if Hugo configuration file exists
ls -la rszin/hugo*

# Navigate to the Hugo project directory
cd rszin

# Check current directory and list files
pwd
ls -la

# Build the Hugo site
hugo --gc --minify

# Check if public directory was created
ls -la public

# Return to the root directory
cd ..

# Print success message
echo "Build completed successfully!" 