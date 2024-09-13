#!/bin/bash

echo "::group::Remove LICENSE"

# Removed LICENSE file
if [[ -f "LICENSE" ]]; then
    rm LICENSE
    echo "::notice:: Removed LICENSE"
elif [[ -f "LICENSE.md" ]]; then
    rm LICENSE.md
    echo "::notice:: Removed LICENSE.md"
else
    echo "::notice:: No LICENSE or LICENSE.md found"
fi

# Remove license from package.json
if jq -e .license package.json >/dev/null; then
    jq 'del(.license)' package.json >temp.json && mv temp.json package.json
    echo "::notice:: Removed license from package.json"
else
    echo "::notice:: No license found in package.json"
fi

echo "::endgroup::"
