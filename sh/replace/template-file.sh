#!/bin/bash

# Remove template files
for file in "$INPUT_TEMPLATE_DIR"/*
do
  cp -f -r "$file" .
  echo "::notice:: Copied $file"
done
