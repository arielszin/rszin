#!/bin/bash

# Print commands for debugging
set -x

echo "Starting redundancy cleanup process..."

# Remove backup directory
echo "Removing backup directory..."
rm -rf backup/

# Remove development/planning directories
echo "Removing development/planning directories..."
rm -rf Cursor/ PRDs/

# Remove empty directories (Hugo will recreate them if needed)
echo "Removing empty directories..."
for dir in assets data i18n layouts static; do
  if [ -d "$dir" ] && [ -z "$(ls -A $dir)" ]; then
    echo "Removing empty directory: $dir"
    rmdir "$dir"
  fi
done

# Remove old cleanup script
echo "Removing old cleanup script..."
rm -f cleanup.sh

# Remove generated directories (they're in .gitignore anyway)
echo "Removing generated directories..."
rm -rf public/ resources/ .hugo_build.lock

echo "Redundancy cleanup completed successfully!" 