#!/bin/bash

# Print commands for debugging
set -x

echo "Current directory: $(pwd)"
echo "Listing files in current directory:"
ls -la

# Skip submodule initialization entirely and just clone the repositories directly
echo "Removing any existing rszin directory..."
rm -rf rszin

echo "Cloning rszin repository directly..."
git clone https://github.com/arielszin/rszin.git rszin
if [ ! -d "rszin" ]; then
  echo "Error: Failed to clone rszin repository!"
  exit 1
fi

cd rszin
git checkout master
cd ..

# Check if Hugo configuration file exists
echo "Checking if Hugo configuration file exists..."
if [ ! -f "rszin/hugo.toml" ]; then
  echo "Error: Hugo configuration file not found!"
  exit 1
fi

# Ensure themes directory exists
echo "Ensuring themes directory exists..."
mkdir -p rszin/themes

# Clone dario theme directly
echo "Cloning dario theme directly..."
rm -rf rszin/themes/dario
git clone https://github.com/GrantBirki/dario.git rszin/themes/dario
if [ ! -d "rszin/themes/dario" ]; then
  echo "Error: Failed to clone dario theme!"
  exit 1
fi

# Navigate to the Hugo project directory
echo "Navigating to the Hugo project directory..."
cd rszin

# Check current directory and list files
echo "Current directory: $(pwd)"
echo "Listing files in current directory:"
ls -la

# List themes directory
echo "Listing themes directory:"
ls -la themes/

# List dario theme directory
echo "Listing dario theme directory:"
ls -la themes/dario/

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