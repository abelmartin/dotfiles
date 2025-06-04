#!/bin/bash

# Define an array of symlink paths
SYMSOURCES=("ackrc" "bash" "bash_profile" "bashrc" "inputrc" "zprofile")

# Iterate over each symlink path in the array
for SOURCE in "${SYMSOURCES[@]}"; do
  TARGET="$HOME/.$SOURCE"
  SOURCE="$HOME/dotfiles/$SOURCE"

  # Check if the symlink exists and is a symbolic link
  if [ -L "$TARGET" ]; then
    echo "The $SOURCE symlink already exists at $TARGET"
  else
    echo "Creating $TARGET from $SOURCE"
    # Create the symlink
    ln -s "$SOURCE" "$TARGET"
    echo "ln -s $SOURCE $TARGET"
    echo "Created $TARGET from $SOURCE"
  fi
  echo "---"
done

echo "\/\/\/"
TARGET=$HOME/.profile_private
SOURCE="$HOME/dotfiles/private/profile_private"
if [ -L "$HOME/.profile_private" ]; then
  echo "The $SOURCE symlink already exists at $TARGET"
else
  echo "Creating $TARGET from $SOURCE"
  # Create the symlink
  ln -s "$SOURCE" "$TARGET"
  echo "ln -s $SOURCE $TARGET"
  echo "Created $TARGET from $SOURCE"
fi
echo "/\/\/\/"
