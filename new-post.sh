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
POST_PATH="content/posts/$DATE-$SLUG.md"

# Create the post
cd rszin || { echo "Error: Could not navigate to rszin directory"; exit 1; }
hugo new "$POST_PATH" || { echo "Error: Failed to create new post"; exit 1; }
cd ..

# Open the file in the default editor
echo "Post created at rszin/$POST_PATH"
echo "Please edit the file to add your content and set draft = false when ready to publish."

# Ask for confirmation before pushing
read -p "Would you like to push changes to GitHub now? (y/n): " CONFIRM
if [[ $CONFIRM =~ ^[Yy]$ ]]; then
  # Check if the post is still marked as draft
  if grep -q "draft = true" "rszin/$POST_PATH"; then
    read -p "Warning: Post is still marked as draft. Push anyway? (y/n): " DRAFT_CONFIRM
    if [[ ! $DRAFT_CONFIRM =~ ^[Yy]$ ]]; then
      echo "Push cancelled. Edit the file and run 'git push origin main' manually when ready."
      exit 0
    fi
  fi
  
  # Add, commit, and push changes
  git add "rszin/$POST_PATH"
  git commit -m "Add new post: $TITLE"
  git push origin main
  echo "Changes pushed to GitHub. Your site will be updated shortly."
else
  echo "Push cancelled. Run 'git push origin main' manually when ready."
fi 