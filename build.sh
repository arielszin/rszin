#!/bin/bash

# Print commands for debugging
set -x

echo "Current directory: $(pwd)"
echo "Listing files in current directory:"
ls -la

# Skip submodule initialization entirely and just clone the repositories directly
echo "Removing any existing rszin directory..."
rm -rf rszin

# Try to clone using the public URL first
echo "Cloning rszin repository directly..."
git clone https://github.com/arielszin/rszin.git rszin || true

# If the clone failed, try to create the directory structure manually
if [ ! -d "rszin" ] || [ -z "$(ls -A rszin 2>/dev/null)" ]; then
  echo "Failed to clone rszin repository, creating directory structure manually..."
  mkdir -p rszin/themes
  mkdir -p rszin/content/posts
  
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

  # Create a sample post
  mkdir -p rszin/content/posts
  cat > rszin/content/posts/hello-world.md << EOF
+++
date = '2025-03-13T15:47:07-04:00'
draft = false
title = 'Hello World - My First Post'
tags = ['introduction', 'first post']
categories = ['general']
+++

# Hello World!

Welcome to my first post on the RSZIN website. This is a test post to demonstrate how to create and publish content using Hugo.

## What is Hugo?

Hugo is a fast and modern static site generator written in Go, and designed to make website creation fun again. Hugo is a general-purpose website framework. Technically speaking, Hugo is a static site generator.

## Why I Chose Hugo

Some reasons I chose Hugo for this website:

1. **Speed** - Hugo is incredibly fast at building sites
2. **Ease of use** - The learning curve is relatively gentle
3. **Flexibility** - Hugo can be used for blogs, documentation, portfolios, and more
4. **Active community** - There's a large community of users and developers

## What's Next?

In future posts, I'll be sharing:

- Thoughts on technology
- Programming tips and tricks
- Personal projects
- And much more!

Stay tuned for more content coming soon!
EOF

  # Create an about page
  cat > rszin/content/about.md << EOF
+++
title = "About"
+++

This is the about page for RSZIN.
EOF
fi

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