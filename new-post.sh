#!/bin/bash

# Check if a title was provided
if [ -z "$1" ]; then
  echo "Please provide a post title"
  echo "Usage: ./new-post.sh \"My New Post Title\""
  exit 1
fi

# Convert the title to a slug
TITLE="$1"
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
DATE=$(date +%Y-%m-%d)

# Create the post
hugo new content/posts/$DATE-$SLUG.md

# Open the file in the default editor
echo "Post created at content/posts/$DATE-$SLUG.md"
echo "Edit the file, then commit and push to deploy automatically" 