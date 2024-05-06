#!/bin/bash

PLACEHOLDER_NAME=$(echo $INPUT_PLACEHOLDERS | jq -r '.name')
PLACEHOLDER_DESCRIPTION=$(echo $INPUT_PLACEHOLDERS | jq -r '.description')
PLACEHOLDER_AUTHOR=$(echo $INPUT_PLACEHOLDERS | jq -r '.author')

find "." -type f | while read file; do
    sed -i "s/$PLACEHOLDER_NAME/$NAME/g" "$file"
    sed -i "s/$PLACEHOLDER_DESCRIPTION/$DESCRIPTION/g" "$file"
    sed -i "s/$PLACEHOLDER_AUTHOR/$AUTHOR/g" "$file"
done
