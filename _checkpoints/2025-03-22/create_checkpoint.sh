#!/bin/bash

# Get the date parameter or use today's date if not provided
if [ -z "$1" ]; then
    checkpoint_date=$(date +%Y-%m-%d)
else
    checkpoint_date=$1
fi

# Create the checkpoint directory
checkpoint_dir="_checkpoints/$checkpoint_date"
if [ -d "$checkpoint_dir" ]; then
    rm -rf "$checkpoint_dir"
fi
mkdir -p "$checkpoint_dir"

# Copy all files and directories except .git and .gitignore
rsync -av --exclude='.git' --exclude='.gitignore' --exclude='_checkpoints' ./ "$checkpoint_dir/"

echo "Checkpoint created at $checkpoint_dir"
