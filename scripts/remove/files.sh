#!/bin/bash

echo "::group::Remove excluded files"

IFS=',' read -ra ADDR <<< "$INPUT_REMOVE_FILES"
for i in "${ADDR[@]}"; do
rm -rf $i
echo "::notice:: Removed $i"
done

echo "::endgroup::"
