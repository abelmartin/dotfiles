#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get today's date in the format YYYY-M-D (without leading zeros)
TODAY=$(date +%Y-%-m-%-d)

# Define an array of files/directories to symlink
SYMSOURCES=("ackrc" "bash" "bash_profile" "bashrc" "inputrc" "zprofile" "zshrc")

echo "Starting dotfiles setup..."
echo "Dotfiles directory: $SCRIPT_DIR"
echo "Backup date suffix: $TODAY"
echo "---"

# Function to create symlink with backup
create_symlink() {
  local source_file="$1"
  local target_file="$2"

  # Check if target already exists and is a symlink pointing to the correct location
  if [ -L "$target_file" ] && [ "$(readlink "$target_file")" = "$source_file" ]; then
    echo "✓ $target_file already correctly symlinked"
    return 0
  fi

  # Check if target exists (file, directory, or symlink to wrong location)
  if [ -e "$target_file" ] || [ -L "$target_file" ]; then
    local backup_file="${target_file}_replaced_${TODAY}"
    echo "→ Backing up existing $target_file to $backup_file"
    mv "$target_file" "$backup_file"
  fi

  # Create the symlink
  echo "→ Creating symlink: $target_file -> $source_file"
  ln -s "$source_file" "$target_file"

  if [ $? -eq 0 ]; then
    echo "✓ Successfully created $target_file"
  else
    echo "✗ Failed to create $target_file"
    return 1
  fi
}

# Iterate over each file/directory in the array
for SOURCE in "${SYMSOURCES[@]}"; do
  SOURCE_PATH="$SCRIPT_DIR/$SOURCE"
  TARGET_PATH="$HOME/.$SOURCE"

  # Check if source file exists in the dotfiles directory
  if [ ! -e "$SOURCE_PATH" ]; then
    echo "⚠ Skipping $SOURCE (not found in dotfiles directory)"
    echo "---"
    continue
  fi

  echo "Processing: $SOURCE"
  create_symlink "$SOURCE_PATH" "$TARGET_PATH"
  echo "---"
done

# Handle private profile separately
echo "Processing: profile_private"
SOURCE_PATH="$SCRIPT_DIR/private/profile_private"
TARGET_PATH="$HOME/.profile_private"

if [ -e "$SOURCE_PATH" ]; then
  create_symlink "$SOURCE_PATH" "$TARGET_PATH"
else
  echo "⚠ Skipping profile_private (not found in dotfiles/private/)"
fi
echo "---"

echo "Dotfiles setup complete!"
