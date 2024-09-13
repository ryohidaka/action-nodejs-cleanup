#!/bin/bash

# Check if 'workflows' directory exists in the template directory
if [ -d "$INPUT_TEMPLATE_DIR/workflows" ]; then
  # Check if '.github/workflows' directory exists
  if [ ! -d ".github/workflows" ]; then
    echo "::warning:: '.github/workflows' directory does not exist. Creating it now."
    mkdir -p .github/workflows
    echo "::notice:: Created directory .github/workflows"
  fi

  # Copy files from $INPUT_TEMPLATE_DIR/workflows to .github/workflows
  for file in "$INPUT_TEMPLATE_DIR/workflows"/* "$INPUT_TEMPLATE_DIR/workflows"/.[!.]* "$INPUT_TEMPLATE_DIR/workflows"/..?*; do
    if [ -e "$file" ] && [ "$(basename "$file")" != "." ] && [ "$(basename "$file")" != ".." ]; then
      cp -f -r "$file" .github/workflows/
      echo "::notice:: Copied $file to .github/workflows/"
    fi
  done
fi

# Copy other template files to the current directory, excluding 'workflows'
for file in "$INPUT_TEMPLATE_DIR"/* "$INPUT_TEMPLATE_DIR"/.[!.]* "$INPUT_TEMPLATE_DIR"/..?*; do
  if [ -e "$file" ] && [ "$(basename "$file")" != "." ] && [ "$(basename "$file")" != ".." ] && [ "$(basename "$file")" != "workflows" ]; then
    cp -f -r "$file" .
    echo "::notice:: Copied $file"
  fi
done

# Remove template dir
if [ "$INPUT_REMOVE_TEMPLATE_DIR" = true ]; then
  rm -rf "$INPUT_TEMPLATE_DIR"
  echo "::notice:: Removed directory $INPUT_TEMPLATE_DIR"
fi
