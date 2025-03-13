#!/bin/bash

# Print commands for debugging
set -x

echo "Current directory: $(pwd)"
echo "Listing files in current directory:"
ls -la

# Remove any existing rszin directory
echo "Removing any existing rszin directory..."
rm -rf rszin

# Clone the repository
echo "Cloning rszin repository directly..."
git clone https://github.com/arielszin/rszin.git rszin

# Check if the clone was successful
if [ ! -d "rszin" ]; then
  echo "Error: Failed to clone rszin repository!"
  exit 1
fi

# List the contents of the cloned repository
echo "Listing files in rszin directory:"
ls -la rszin

# Check if hugo.toml exists
if [ ! -f "rszin/hugo.toml" ]; then
  echo "Error: hugo.toml not found in the expected location!"
  echo "Creating a minimal Hugo configuration file..."
  
  # Create a minimal Hugo configuration file
  cat > rszin/hugo.toml << EOF
baseURL = "https://www.rszin.com/"
languageCode = "en-us"
title = "RSZIN"
theme = "dario"

[params]
  author = "Ariel R Szin"
  description = "Questions,Exploratory Musings"

  [params.homeInfoParams]
    Title = "Welcome to My Website"
    Content = "This is a minimal web log inspired by Dario Amodei's personal website."
    Description = "A minimal web log."
EOF
fi

# Create themes directory if it doesn't exist
if [ ! -d "rszin/themes" ]; then
  echo "Creating themes directory..."
  mkdir -p rszin/themes
fi

# Clone dario theme directly
echo "Cloning dario theme directly..."
rm -rf rszin/themes/dario
git clone https://github.com/GrantBirki/dario.git rszin/themes/dario

# Check if the theme clone was successful
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