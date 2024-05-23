#!/bin/bash

# Copy template files
for file in "$INPUT_TEMPLATE_DIR"/*
do
  cp -f -r "$file" .
  echo "::notice:: Copied $file"
done

# Remove template dir
if [ "$INPUT_REMOVE_TEMPLATE_DIR" = true ]; then
  rm -rf "$INPUT_TEMPLATE_DIR"
  echo "::notice:: Removed directory $INPUT_TEMPLATE_DIR"
fi
