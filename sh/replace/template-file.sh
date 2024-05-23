#!/bin/bash

# Copy template files
for file in "$INPUT_TEMPLATE_DIR"/* "$INPUT_TEMPLATE_DIR"/.[!.]* "$INPUT_TEMPLATE_DIR"/..?*; do
  if [ -e "$file" ] && [ "$(basename "$file")" != "." ] && [ "$(basename "$file")" != ".." ]; then
    cp -f -r "$file" .
    echo "::notice:: Copied $file"
  fi
done

# Remove template dir
if [ "$INPUT_REMOVE_TEMPLATE_DIR" = true ]; then
  rm -rf "$INPUT_TEMPLATE_DIR"
  echo "::notice:: Removed directory $INPUT_TEMPLATE_DIR"
fi
