#!/bin/bash

# Replace name in package.json
jq --arg name "${NAME}" '.name=$name' package.json > temp.json && mv temp.json package.json

# Replace description in package.json
jq --arg description "${DESCRIPTION}" '.description=$description' package.json > temp.json && mv temp.json package.json

# Replace version in package.json
jq --arg version "${VERSION}" '.version=$version' package.json > temp.json && mv temp.json package.json

# Replace author in package.json
jq --arg author "${AUTHOR_WITH_EMAIL}" '.author=$author' package.json > temp.json && mv temp.json package.json

# Replace repository.url in package.json
jq --arg url "${CLONE_URL}" '.repository.url=$url' package.json > temp.json && mv temp.json package.json

# Replace bugs.url in package.json
jq --arg url "${BUGS_URL}" '.bugs.url=$url' package.json > temp.json && mv temp.json package.json

# Replace homepage in package.json
jq --arg homepage "${HOMEPAGE}" '.homepage=$homepage' package.json > temp.json && mv temp.json package.json
