#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 -u <repo_url>"
    exit 1
}

# Parse command line arguments
while getopts "u:" opt; do
    case $opt in
        u) URL="$OPTARG" ;;
        *) usage ;;
    esac
done

# Check if URL is set
if [ -z "$URL" ]; then
    echo "Error: Repository URL is required."
    usage
fi

# Find and publish all .tgz files to the specified registry
for pkg in $(find . -type f -not -path '*/\.*' -name '*.tgz'); do
    npm publish "$pkg" --registry "$URL"
done
