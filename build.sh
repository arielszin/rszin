#!/bin/bash

# Print commands for debugging
set -x

echo "Current directory: $(pwd)"
echo "Listing files in current directory:"
ls -la

# Try to initialize git submodules
echo "Trying to initialize git submodules..."
git submodule update --init --recursive || true

# If rszin directory doesn't exist or is empty, clone it directly
echo "Checking if rszin directory exists and has content..."
if [ ! -d "rszin" ] || [ -z "$(ls -A rszin 2>/dev/null)" ]; then
  echo "Rszin directory doesn't exist or is empty, cloning directly..."
  rm -rf rszin
  git clone https://github.com/arielszin/rszin.git rszin
  cd rszin
  git checkout master
  cd ..
fi

# Check if rszin directory exists
echo "Checking if rszin directory exists..."
if [ ! -d "rszin" ]; then
  echo "Error: rszin directory not found!"
  exit 1
fi

# Check if Hugo configuration file exists
echo "Checking if Hugo configuration file exists..."
if [ ! -f "rszin/hugo.toml" ]; then
  echo "Error: Hugo configuration file not found!"
  exit 1
fi

# Check if themes directory exists
echo "Checking if themes directory exists..."
if [ ! -d "rszin/themes" ]; then
  echo "Error: themes directory not found!"
  mkdir -p rszin/themes
fi

# Check if dario theme exists, if not clone it
echo "Checking if dario theme exists..."
if [ ! -d "rszin/themes/dario" ]; then
  echo "Dario theme not found, cloning it..."
  git clone https://github.com/GrantBirki/dario.git rszin/themes/dario
fi

# Navigate to the Hugo project directory
echo "Navigating to the Hugo project directory..."
cd rszin

# Check current directory and list files
echo "Current directory: $(pwd)"
echo "Listing files in current directory:"
ls -la

# Build the Hugo site
echo "Building the Hugo site..."
hugo --gc --minify

# Check if public directory was created
echo "Checking if public directory was created..."
if [ ! -d "public" ]; then
  echo "Error: public directory not created!"
  exit 1
fi

echo "Listing files in public directory:"
ls -la public

# Return to the root directory
cd ..

# Copy the public directory to the root
echo "Copying the public directory to the root..."
rm -rf public
cp -r rszin/public .

# Check if public directory was copied
echo "Checking if public directory was copied..."
if [ ! -d "public" ]; then
  echo "Error: public directory not copied!"
  exit 1
fi

echo "Listing files in root public directory:"
ls -la public

# Print success message
echo "Build completed successfully!" 