#!/bin/bash

echo "::group::Show variables"

# Set Name
NAME="${GITHUB_REPOSITORY##*/}"
echo "NAME=${NAME}" >> $GITHUB_ENV
echo "::notice:: Name: ${NAME}"

# Set Description
DESCRIPTION="${INPUT_DESCRIPTION}"
echo "DESCRIPTION=${DESCRIPTION}" >> $GITHUB_ENV
echo "::notice:: Description: ${DESCRIPTION}"

# Set Version
VERSION="${INPUT_VERSION}"
echo "VERSION=${VERSION}" >> $GITHUB_ENV
echo "::notice:: Version: ${VERSION}"

# Set Author
ACTOR=$(echo $GITHUB_ACTOR | tr '[:upper:]' '[:lower:]')

if [[ -n "${INPUT_EMAIL}" ]]; then
    AUTHOR="${ACTOR} <${INPUT_EMAIL}>"
else
    AUTHOR="${ACTOR}"
fi
echo "AUTHOR=${AUTHOR}" >> $GITHUB_ENV
echo "::notice:: Author: ${AUTHOR}"

# Set Repository URL
REPO_URL="${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}"
echo "REPO_URL=${REPO_URL}" >> $GITHUB_ENV
echo "::notice:: Repository URL: ${REPO_URL}"

# Set Clone URL
REPO_TYPE=$(jq -r '.repository.type' package.json)
if [ "$REPO_TYPE" = "git" ]; then
    CLONE_URL="git+${REPO_URL}.git"
else
    CLONE_URL="${REPO_URL}.git"
fi
echo "CLONE_URL=${CLONE_URL}" >> $GITHUB_ENV
echo "::notice:: Clone URL: ${CLONE_URL}"

# Set Bugs URL
if [[ -n "${INPUT_BUGS_URL}" ]]; then
    BUGS_URL="${INPUT_BUGS_URL}"
else
    BUGS_URL="${REPO_URL}/issues"
fi
echo "BUGS_URL=${BUGS_URL}" >> $GITHUB_ENV
echo "::notice:: Bags URL: ${BUGS_URL}"

# Set Homepage
if [[ -n "${INPUT_HOMEPAGE}" ]]; then
    HOMEPAGE="${INPUT_HOMEPAGE}"
else
    HOMEPAGE="${REPO_URL}#readme"
fi
echo "HOMEPAGE=${HOMEPAGE}" >> $GITHUB_ENV
echo "::notice:: Homepage: ${HOMEPAGE}"

echo "::endgroup::"
