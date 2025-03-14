#!/bin/bash

# Print commands for debugging
set -x

echo "Current directory: $(pwd)"
echo "Listing files in current directory:"
ls -la

# Check if hugo.toml exists
if [ ! -f "hugo.toml" ]; then
  echo "Error: hugo.toml not found in the expected location!"
  echo "Creating a minimal Hugo configuration file..."
  
  # Create a minimal Hugo configuration file
  cat > hugo.toml << EOF
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
if [ ! -d "themes" ]; then
  echo "Creating themes directory..."
  mkdir -p themes
fi

# Check if dario theme exists, if not clone it
if [ ! -d "themes/dario" ]; then
  echo "Cloning dario theme..."
  git clone https://github.com/GrantBirki/dario.git themes/dario
fi

# Check if the theme clone was successful
if [ ! -d "themes/dario" ]; then
  echo "Error: Failed to clone dario theme!"
  exit 1
fi

# List themes directory
echo "Listing themes directory:"
ls -la themes/

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

# Print success message
echo "Build completed successfully!" 